


-- Create relational  DB of your choice with minimum 8 tables - LINES 17-193
-- Set Primary and Foreign Key constraints to create relations between the tables - LINES 80-102
-- Using any type of the joins create a view that combines multiple tables in a logical way - LINES 247-252
-- In your database, create a stored function that can be applied to a query in your DB - LINES 196-223
-- Prepare an example query with a subquery to demonstrate how to extract data from your DB for analysis - LINE 282-288
-- Create DB diagram where all table relations are shown - In presentation
-- In your database, create a stored procedure and demonstrate how it runs - LINES 226-241
-- In your database, create a trigger and demonstrate how it runs - LINES 196-223
-- In your database, create an event and demonstrate how it runs - 272-279
-- Create a view that uses at least 3-4 base tables; prepare and demonstrate a query that uses the view to produce a logically arranged result set for analysis. - LINES 247-252
-- Prepare an example query with group by and having to demonstrate how to extract data from your DB for analysis - LINES 297-300
 

CREATE DATABASE University_Library;

CREATE TABLE Students
(Stu_ID INTEGER PRIMARY KEY,
First_name VARCHAR (50),
Last_name VARCHAR (50),
Course_name VARCHAR (20));

CREATE TABLE Contacts
(Stu_ID INTEGER,
Email_address VARCHAR (75),
Phone_number VARCHAR(15));

CREATE TABLE Books
(Book_ID INTEGER PRIMARY KEY,
ISBN INTEGER,
Title VARCHAR (75),
Author VARCHAR (75),
Course VARCHAR (50));

CREATE TABLE Stock
(Book_ID INTEGER,
ISBN INTEGER,
Total_copies INTEGER,
Copies_loaned INTEGER,
Available_copies INTEGER);

CREATE TABLE Loans 
(Loan_ID INTEGER PRIMARY KEY,
Stu_ID INTEGER,
Book_ID INTEGER,
Date_of_loan DATE,
Date_due DATE,
Days_overdue INTEGER);

CREATE TABLE Fines 
(Fine_ID INTEGER PRIMARY KEY,
Stu_ID INTEGER,
Loan_ID INTEGER,
Days_overdue INTEGER,
Fines_owed DECIMAL(13,2));

CREATE TABLE Courses
(Course_ID INTEGER,
Course_name VARCHAR (50) PRIMARY KEY);

CREATE TABLE Reservations
(Res_ID INTEGER,
Book_ID INTEGER,
Available_copies INTEGER,
Stu_ID INTEGER,
Date_available DATE);

CREATE TABLE returned_Loans 
(Loan_ID INTEGER PRIMARY KEY,
Stu_ID INTEGER,
Book_ID INTEGER,
Date_of_loan DATE,
Date_due DATE,
Days_overdue INTEGER);

-- Adding foreign keys --

ALTER TABLE Contacts
ADD FOREIGN KEY (Stu_ID) REFERENCES Students(Stu_ID);

ALTER TABLE Stock
ADD FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID);

ALTER TABLE Loans
ADD FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID);

ALTER TABLE Fines
ADD FOREIGN KEY (Stu_ID) REFERENCES Students(Stu_ID);

ALTER TABLE Fines
ADD FOREIGN KEY (Loan_ID) REFERENCES Loans(Loan_ID);

ALTER TABLE Reservations 
ADD FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID);

ALTER TABLE Reservations 
ADD FOREIGN KEY (Stu_ID) REFERENCES Students(Stu_ID);

ALTER TABLE Students
ADD FOREIGN KEY (Course_name) REFERENCES Course(Course_name);

-- Inserting data into tables --

INSERT INTO Students
(Stu_ID, First_name, Last_name, Course)
VALUES
(1, 'Charlotte', 'Cole', 'COMPUTER_PROGRAMMING'),
(2, 'Neil', 'McLatchie', 'MATHEMATICS'),
(3, 'Zach', 'Wyborn', 'CHEMISTRY'),
(4, 'Alison', 'May', 'COMPUTER_PROGRAMMING'),
(5, 'Timothy', 'Baldwin', 'COMPUTER_PROGRAMMING'),
(6, 'Sarah', 'Wilson', 'CHEMISTRY'),
(7, 'Sarah', 'Peters', 'BIOLOGY'),
(8, 'James', 'Smith', 'COMPUTER_PROGRAMMING'),
(9, 'Linda', 'Waterworth', 'MATHEMATICS'),
(10, 'Lucy', 'Smith', 'BIOLOGY'),
(11, 'Patricia', 'Goddard', 'MATHEMATICS'),
(12, 'Daniel', 'Howells', 'COMPUTER_PROGRAMMING'),
(13, 'Miah', 'Jarvis', 'CHEMISTRY'),
(14, 'Samuel', 'Gardner', 'MATHEMATICS'),
(15, 'Natalie', 'Petty', 'COMPUTER_PROGRAMMING');

INSERT INTO Books
(Book_ID, ISBN, Title, Author, Course)
VALUES
(1, 7854093, 'SQL for Dummies', 'Max Codeperson', 'COMPUTER_PROGRAMMING'),
(2, 8573092, 'The Biology of Bees', 'Carly Honey', 'BIOLOGY'),
(3, 0628376, 'Searching for Ions', 'Frank Herbert', 'CHEMISTRY'),
(4, 8439047, 'Calculations for the Ages', 'Maria Vasquez', 'MATHEMATICS'),
(5, 6284730, 'The Human Body', 'Brian Lech', 'BIOLOGY'),
(6, 9759302, 'Python - Not Just a Snake', 'Lisa Osezeke', 'COMPUTER_PROGRAMMING'),
(7, 0394832, 'Algebra pt 7 Cubed', 'Humphrey Klein', 'MATHEMATICS');

INSERT INTO Stock
(Book_ID, ISBN, Total_copies, Copies_loaned, Available_copies)
VALUES
(1, 7854093, 5, 2, 3),
(2, 8573092, 3, 3, 0),
(3, 0628376, 2, 0, 2),
(4, 8439047, 4, 3, 1),
(5, 6284730, 3, 1, 2),
(6, 9759302, 2, 2, 0),
(7, 0394832, 1, 0, 1);

INSERT INTO Contacts
(Stu_ID, Email_address, Phone_number)
VALUES
(1, 'c.cole@thisuniversity.ac.uk', 07936243986),
(2, 'n.mclatchie@thisuniversity.ac.uk', 07927483624),
(3, 'r.wyborn@thisuniversity.ac.uk', 07473928365),
(4, 'a.may@thisuniversity.ac.uk', 07834265986),
(5, 't.baldwin@thisuniversity.ac.uk', 07943785932),
(6, 's.wilson@thisuniversity.ac.uk', 07764987357),
(7, 's.peters@thisuniversity.ac.uk', 07749140435),
(8, 'j.smith@thisuniversity.ac.uk', 07897557674),
(9, 'l.waterworth78@thisuniversity.ac.uk', 07374829589),
(10, 'j.smith@thisuniversity.ac.uk', 07927386523),
(11, 'p.goddard@thisuniversity.as.uk', 07717348485),
(12, 'd.howells@thisuniversity.ac.uk', 07846203945),
(13, 'm.jarvis@thisuniversity.ac.uk', 07938472856),
(14, 's.gardner@thisuniversity.ac.uk', 07936478372),
(15, 'n.petty@thisuniversity.ac.uk', 07778453267);

INSERT INTO Courses
(Course_ID, Course_name)
VALUES
(1, 'BIOLOGY'),
(2, 'MATHEMATICS'),
(3, 'CHEMISTRY'),
(4, 'COMPUTER_PROGRAMMING');

INSERT INTO Loans
(Loan_ID, Stu_ID, Book_ID, Date_of_loan, Date_due, Days_overdue)
VALUES
(1, 1, 6, 20220122, 20220222, 0),
(2, 13, 3, 20220125, 20220225, 0),
(3, 7, 5, 20220203, 20220303, 0),
(4, 9, 4, 20220402, 020220502, 5),
(5, 11, 7, 20220407, 20220507, 3);

INSERT INTO Fines
(Fine_ID, Stu_ID, Loan_ID, Days_overdue, Fines_owed)
VALUES
(1, 9, 4, 5, 5.00),
(2, 11, 5, 3, 3.00);

INSERT INTO Reservations
(Res_ID, Book_ID, Available_copies, Stu_ID, Date_available)
VALUES
(1, 1, 1, 12, '2022/02/22'),
(2, 4, 1, 14, '2022/05/20');


-- stored function --

DELIMITER //
 CREATE FUNCTION Over_due_checker(
	Date_Due DATE)
		RETURNS VARCHAR(3)
        DETERMINISTIC
    BEGIN
		DECLARE Over_Due_Checker VARCHAR(3);
        IF Date_Due > current_date() THEN
			SET Over_due_checker = 'NO';
		ELSEIF Date_Due < current_date() THEN
			SET Over_due_checker = 'YES';
	END IF;
		
        RETURN (Over_Due_Checker) ;
END // 
DELIMITER ;


SELECT 
Stu_ID, 
over_due_checker(Date_Due) AS Overdue
FROM Loans
ORDER BY Stu_ID;

– Alias Added–
-- END OF STORED FUNCTION –


	-- STORED PROCEDURE --

DELIMITER //

CREATE PROCEDURE  Student_Chemistry()
BEGIN
	SELECT Stu_ID, First_name, Last_Name
    FROM students
    Where course_name = 'Chemistry' ;
END //

DELIMITER ; 

CALL Student_Chemistry();

 -- END OF STORED PROCEDURE --



-- CREATE VIEW WITH A JOIN --

CREATE VIEW Stock_List AS
SELECT books.Book_ID, books.Title, stock.available_copies, loans.date_due
FROM Books
INNER JOIN stock ON Books.book_ID = stock.book_ID
INNER JOIN loans ON books.book_ID = loans.book_ID;
SELECT * FROM Stock_List

-- END OF CREATE VIEW --

-- CREATE TRIGGER --

-- trigger is to transfer deleted loans from the loans table into the returned loans table -- 

DELIMITER $$
CREATE trigger return_loan BEFORE DELETE ON loans FOR EACH ROW
BEGIN
INSERT INTO returned_loans (Loan_ID, Stu_ID, Book_ID, Date_of_loan, Date_due, 
Days_overdue)
VALUES (OLD.Loan_ID, OLD.Stu_ID, OLD.Book_ID, OLD.Date_of_loan, OLD.Date_due, 
OLD.Days_overdue);
END $$
DELIMITER ;

-- END OF TRIGGER --

-- Create Event --
CREATE EVENT Due_today
ON SCHEDULE EVERY 1 DAY
STARTS ‘2022-05-11 09:00:00’
ENDS ‘2022-05-11 09:00:00’ + INTERVAL 1 HOUR
DO SELECT days_overdue
FROM fines
WHERE date_due = current-date - 1;


-- Example Query with Subquery to demonstrate how to extract data --
-- check stock levels for Mathematics coursebooks (table join plus subquery)
SELECT *
FROM (SELECT * FROM Books WHERE Course = 'Mathematics') AS m
INNER JOIN Stock AS s
ON m.book_id = s.book_id
ORDER BY s.book_id;

-- List of books where stocklevel = 0 (options: reorder stock or follow up overdue loans)
SELECT *
FROM (SELECT * FROM Stock WHERE Available_copies = 0) AS s
INNER JOIN Books AS b
ON s.Book_ID = b.Book_ID
ORDER BY b.ISBN;

-- GROUP BY AND ORDER --
SELECT * FROM stock
GROUP BY book_ID 
HAVING available_copies > 0 
 
 

-- Create relational  DB of your choice with minimum 8 tables
-- Set Primary and Foreign Key constraints to create relations between the tables
-- Using any type of the joins create a view that combines multiple tables in a logical way
-- In your database, create a stored function that can be applied to a query in your DB
-- Prepare an example query with a subquery to demonstrate how to extract data from your DB for analysis
-- Create DB diagram where all table relations are shown
-- In your database, create a stored procedure and demonstrate how it runs
-- In your database, create a trigger and demonstrate how it runs
-- In your database, create an event and demonstrate how it runs
-- Create a view that uses at least 3-4 base tables; prepare and demonstrate a query that uses the view to produce a logically arranged result set for analysis.
-- Prepare an example query with group by and having to demonstrate how to extract data from your DB for analysis 
 
 
 
 
 
 

