# OTT Catalogue Management System

A Python and MySQL-based application for managing an OTT streaming platform's programme catalogue.

## Features

- **Database Initialization** – Checks whether the database exists and initializes it with the required tables, constraints, and sample data if it does not.
- **Create Records** – Add records to any table by selecting the table and entering the required values.
- **View Records** – Retrieve information from any table, choose which columns to display, and optionally filter the results.
- **Update Records** – Modify existing records, with optional conditions to select which rows should be updated.
- **Delete Records** – Delete selected records using conditions or delete all rows from a table after confirmation.
- **Flexible Filtering** – Supports `=`, `<`, `<=`, `>`, `>=`, and `LIKE` conditions.
- **Transaction Management** – Commit changes to the database or roll them back.
- **Error Handling** – Handles invalid inputs, data type errors, database constraint violations, and SQL errors.

## Database Overview

The catalogue stores information about:

- **Content** – Titles, release years, languages, and age ratings.
- **Streaming Platforms** – Platform names and regions.
- **Genres and Cast Members** – Content categories and cast information.
- **Movies and Series** – Details specific to movies and television series.
- **Seasons and Episodes** – Season and episode details for series.
- **Availability** – The streaming platforms on which content is available.
- **Content Statistics** – View counts, ratings, and number of reviews.
- **Trailers and Subscription Plans** – Additional content and platform plan information.

### Project Structure

```text
OTT-Programme-Catalogue/
├── microproject.py
├── schema.sql
├── fk_constraints.sql
├── data.sql
└── README.md
```
### Requirements

- Python 3
- MySQL Server
- `mysql-connector-python`

Install the required package:

```bash
pip install mysql-connector-python
```

### Configuration

Update the MySQL connection settings in `microproject.py` to match your local MySQL setup.

Make sure the three SQL files are in the same directory as `microproject.py`. The application expects the filenames `schema.sql`, `fk_constraints.sql`, and `data.sql`.

### Run the Application

Start MySQL Server, open a terminal in the project directory, and run:

```bash
python microproject.py
```

If the `myottdb` database does not exist, the application initializes it using the SQL files. If it already exists, the application connects to the existing database.
