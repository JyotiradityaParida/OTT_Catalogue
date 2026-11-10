import mysql.connector
from mysql.connector import Error

# Connect
def connect():
	try:
		db = mysql.connector.connect(
			host="localhost",
			user="root",
			password="root"
		)
		print("Connected\n")
		return db
	except Error as e:
		print("Connection Failed:", e)
		exit()

db = connect()
db.autocommit = False
cursor = db.cursor()

# Run SQL file
def run_sql_file(filename):
	with open(filename, "r") as f:
		sql = f.read()
	for cmd in sql.split(";"):
		cmd = cmd.strip()
		if cmd:
			cursor.execute(cmd)

# Initialize
try:
	cursor.execute("USE myottdb")
	print("Using existing database\n")

except Error:
	print("Database not found. Initializing...\n")

	run_sql_file("schema.sql")
	run_sql_file("fk_constraints.sql")
	run_sql_file("data.sql")

	db.commit()

	cursor.execute("USE myottdb")
	print("Database Ready\n")

# Input
def get_int(msg):
	while True:
		try:
			return int(input(msg))
		except:
			print("Invalid\n")

# Transaction
def confirm_txn():
	print()
	ch = input("Commit changes? (y/n): ")
	if ch == 'y':
		db.commit()
		print("Committed\n")
	else:
		db.rollback()
		print("Rolled back\n")

# Tables
def show_tables():
	cursor.execute("SHOW TABLES")
	tables = [x[0] for x in cursor.fetchall()]
	print()
	for i,t in enumerate(tables):
		print(i+1, t)
	print()
	return tables

# Create
def insert_table():
	try:
		tables = show_tables()
		if not tables: return

		ch = get_int("Select table (no.): ")
		if ch < 1 or ch > len(tables):
			print("Invalid\n")
			return

		table = tables[ch-1]

		cursor.execute(f"DESCRIBE {table}")
		cols = cursor.fetchall()

		values = []

		for c in cols:
			col_name = c[0]
			col_type = c[1]
			is_pk = (c[3] == 'PRI')

			while True:
				try:
					label = f"{col_name} ({col_type})"
					if is_pk:
						label += " [PK]"

					if "int" in col_type:
						val = int(input(label + ": "))
					else:
						val = input(label + ": ")

					values.append(val)
					break
				except:
					print("Invalid\n")

		ph = ",".join(["%s"]*len(values))
		cursor.execute(f"INSERT INTO {table} VALUES ({ph})",tuple(values))

		confirm_txn()

	except Error as e:
		print("SQL Error:", e)
		db.rollback()

# Read
def view_table():
	try:
		tables = show_tables()
		if not tables: return

		ch = get_int("Select table (no.): ")
		if ch < 1 or ch > len(tables):
			print("Invalid\n")
			return

		table = tables[ch-1]

		cursor.execute(f"DESCRIBE {table}")
		cols_info = cursor.fetchall()
		col_names = [c[0] for c in cols_info]

		print("\nColumns:")
		for c in col_names:
			print("-", c)

		print("\nSELECT columns (* for all OR c1, c2, ...)")
		cols = input("Columns: ")

		print("\nAdd WHERE clause? (y/n)")
		cond = input()

		if cond == 'y':
			print("WHERE (column) (condition =, <, <=, >, >=, LIKE) (value)")
			col = input("Column: ")

			if col not in col_names:
				print("Invalid\n")
				return

			op = input("Operator: ").upper()

			if op not in ["=", "<", "<=", ">", ">=", "LIKE"]:
				print("Invalid\n")
				return

			val = input("Value: ")

			query = f"SELECT {cols} FROM {table} WHERE {col} {op} %s"
			cursor.execute(query, (val,))
			
		else:
			query = f"SELECT {cols} FROM {table}"
			cursor.execute(query)

		rows = cursor.fetchall()

		if not rows:
			print("No data\n")
			return

		print()
		for i,row in enumerate(rows,1):
			print(i, row)
		print()

	except Error as e:
		print("SQL Error:", e)
# Update
def update_table():
	try:
		tables = show_tables()
		if not tables: return

		ch = get_int("Select table (no.): ")
		if ch < 1 or ch > len(tables):
			print("Invalid\n")
			return

		table = tables[ch-1]

		cursor.execute(f"DESCRIBE {table}")
		cols = cursor.fetchall()
		col_names = [c[0] for c in cols]

		print("\nColumns:")
		for c in col_names:
			print("-", c)
		print()

		print("UPDATE (column) SET (value)")
		col_update = input("Column: ")
		if col_update not in col_names:
			print("Invalid\n")
			return

		new_val = input("Value: ")

		print("\nAdd WHERE clause? (y/n)")
		cond = input()

		if cond == 'y':
			print("WHERE (column) (condition =, <, <=, >, >=, LIKE) (value)")
			col_cond = input("Column: ")
			if col_cond not in col_names:
				print("Invalid\n")
				return

			op = input("Operator: ").upper()

			if op not in ["=", "<", "<=", ">", ">=", "LIKE"]:
				print("Invalid\n")
				return
			val_cond = input("Value: ")

			cursor.execute(
				f"UPDATE {table} SET {col_update}=%s WHERE {col_cond} {op} %s",
				(new_val, val_cond)
			)

		else:
			cursor.execute(
				f"UPDATE {table} SET {col_update}=%s",
				(new_val,)
			)

		confirm_txn()

	except Error as e:
		print("SQL Error:", e)
		db.rollback()

# Delete
def delete_table():
	try:
		tables = show_tables()
		if not tables: return

		ch = get_int("Select table (no.): ")
		if ch < 1 or ch > len(tables):
			print("Invalid\n")
			return

		table = tables[ch-1]

		cursor.execute(f"DESCRIBE {table}")
		cols = cursor.fetchall()
		col_names = [c[0] for c in cols]

		print("\nColumns:")
		for c in col_names:
			print("-", c)
		print()

		print("Add WHERE clause? (y/n)")
		cond = input()

		if cond == 'y':
			print("WHERE (column) (condition =, <, <=, >, >=, LIKE) (value)")
			col = input("Column: ")

			if col not in col_names:
				print("Invalid\n")
				return

			op = input("Operator: ").upper()

			if op not in ["=", "<", "<=", ">", ">=", "LIKE"]:
				print("Invalid\n")
				return

			val = input("Value: ")

			cursor.execute(
				f"DELETE FROM {table} WHERE {col} {op} %s",
				(val,)
			)

		else:
			check = input("Delete ALL rows? (y/n): ")
			if check != 'y':
				print("Cancelled\n")
				return

			cursor.execute(f"DELETE FROM {table}")

		confirm_txn()

	except Error as e:
		print("SQL Error:", e)
		db.rollback()

# Menu
while True:
	try:
		print("\nMenu")
		print("1 Create")
		print("2 Read")
		print("3 Update")
		print("4 Delete")
		print("5 Exit")

		ch = int(input("Choice: "))
		print()

		if ch==1: insert_table()
		elif ch==2: view_table()
		elif ch==3: update_table()
		elif ch==4: delete_table()
		elif ch==5: break
		else: print("Invalid\n")

	except:
		print("Invalid\n")