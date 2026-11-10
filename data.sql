USE myottdb;

-- CONTENT (1–20)
INSERT INTO CONTENT VALUES
('Inception',2010,'English',1,'PG13'),
('Dark',2017,'German',2,'18+'),
('MoneyHeist',2017,'Spanish',3,'18+'),
('Interstellar',2014,'English',4,'PG13'),
('StrangerThings',2016,'English',5,'16+'),
('BreakingBad',2008,'English',6,'18+'),
('Loki',2021,'English',7,'PG13'),
('TheOffice',2005,'English',8,'13+'),
('Narcos',2015,'Spanish',9,'18+'),
('Witcher',2019,'English',10,'18+'),
('Friends',1994,'English',11,'13+'),
('Avatar',2009,'English',12,'PG13'),
('Joker',2019,'English',13,'18+'),
('Tenet',2020,'English',14,'PG13'),
('PeakyBlinders',2013,'English',15,'18+'),
('Sherlock',2010,'English',16,'16+'),
('Lucifer',2016,'English',17,'18+'),
('Matrix',1999,'English',18,'18+'),
('Titanic',1997,'English',19,'PG13'),
('Deadpool',2016,'English',20,'18+');

-- STREAMING PLATFORM
INSERT INTO STREAMING_PLATFORM VALUES
('Netflix','Global',1),
('AmazonPrime','Global',2),
('DisneyPlus','Global',3);

-- GENRE
INSERT INTO GENRE VALUES
(1,'SciFi'),(2,'Drama'),(3,'Thriller'),(4,'Crime'),(5,'Action');

-- CAST MEMBER
INSERT INTO CAST_MEMBER VALUES
(1,'Leonardo','USA'),
(2,'Cillian','Ireland'),
(3,'Millie','UK'),
(4,'Pedro','Spain'),
(5,'Matthew','USA'),
(6,'Bryan','USA'),
(7,'Tom','UK'),
(8,'Steve','USA'),
(9,'Henry','UK'),
(10,'Ryan','Canada');

-- CONTENT_GENRE (simple mapping)
INSERT INTO CONTENT_GENRE VALUES
(1,1),(2,2),(3,4),(4,1),(5,2),
(6,2),(7,1),(8,2),(9,4),(10,1),
(11,2),(12,1),(13,2),(14,1),(15,4),
(16,2),(17,2),(18,1),(19,2),(20,5);

-- CONTENT_CAST
INSERT INTO CONTENT_CAST VALUES
(1,1),(2,2),(3,4),(4,5),(5,3),
(6,6),(7,7),(8,8),(9,4),(10,9),
(11,8),(12,5),(13,10),(14,1),(15,6),
(16,2),(17,7),(18,1),(19,1),(20,10);

-- AVAILABILITY
INSERT INTO AVAILABILITY VALUES
(1,1),(2,1),(3,1),(4,2),(5,3),
(6,1),(7,3),(8,2),(9,1),(10,1),
(11,2),(12,3),(13,1),(14,2),(15,1),
(16,2),(17,1),(18,2),(19,3),(20,1);

-- CONTENT_STATISTICS
INSERT INTO CONTENT_STATISTICS VALUES
(1,1,1000000,9,50000),(2,2,900000,8,40000),
(3,3,1200000,9,60000),(4,4,1100000,9,55000),
(5,5,1300000,8,50000),(6,6,1500000,10,70000),
(7,7,800000,8,30000),(8,8,1400000,9,60000),
(9,9,1100000,9,50000),(10,10,1000000,8,45000),
(11,11,1600000,9,70000),(12,12,2000000,10,90000),
(13,13,1700000,9,80000),(14,14,1200000,8,60000),
(15,15,1400000,9,70000),(16,16,900000,8,40000),
(17,17,1000000,8,45000),(18,18,1800000,9,80000),
(19,19,2200000,10,100000),(20,20,1900000,9,85000);

-- MOVIE
INSERT INTO MOVIE VALUES
(1,148,160000000),(4,169,165000000),
(12,162,237000000),(13,122,55000000),
(14,150,205000000),(18,136,63000000),
(19,195,200000000),(20,108,58000000);

-- SERIES
INSERT INTO SERIES VALUES
(2,3,'Completed'),(3,5,'Ongoing'),(5,4,'Ongoing'),
(6,5,'Completed'),(7,2,'Ongoing'),(8,9,'Completed'),
(9,3,'Completed'),(10,3,'Ongoing'),
(11,10,'Completed'),(15,6,'Ongoing'),
(16,4,'Completed'),(17,6,'Completed');

-- TRAILER
INSERT INTO TRAILER VALUES
(1,1,2,'2010-06-01'),
(2,4,3,'2014-05-01'),
(3,12,3,'2009-07-01'),
(4,13,2,'2019-08-01'),
(5,14,3,'2020-07-01');

-- SEASON
INSERT INTO SEASON VALUES
(1,2,1,'2017'),(2,2,2,'2019'),
(3,5,1,'2016'),(4,5,2,'2017'),
(5,6,1,'2008'),(6,6,2,'2009'),
(7,7,1,'2021'),(8,8,1,'2005');

-- EPISODE
INSERT INTO EPISODE VALUES
(1,1,1,'Ep1',50),(2,1,2,'Ep2',55),
(3,2,1,'Ep1',60),(4,3,1,'Ep1',45),
(5,4,1,'Ep1',50),(6,5,1,'Ep1',50),
(7,6,1,'Ep1',55),(8,7,1,'Ep1',45);