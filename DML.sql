/*

					  SQL Project Name : Library Management System
							    Trainee Name : Yasin Arafat   
						    	  Trainee ID : 1279076       
							   Batch ID : WADA/PNTL-A/56/01 

 --------------------------------------------------------------------------------
Table of Contents: DML

			‣ SECTION   01  : INSERT DATA USING INSERT INTO KEYWORD
			 ‣SECTION   02  : SELECT FROM TABLE
			 ‣SECTION	03	: SELECT FROM VIEW
			 ‣SECTION	04	: SELECT INTO
			 ‣SECTION	05	: IMPLICIT JOIN WITH WHERE BY CLAUSE, ORDER BY CLAUSE
			 ‣SECTION	06	: INNER JOIN WITH GROUP BY CLAUSE
			 ‣SECTION	07	: OUTER JOIN
			 ‣SECTION	08	: CROSS JOIN
			 ‣SECTION	09	: TOP DISTINCT CLAUSE WITH TIES
			 ‣SECTION	10	: COMPARISON, LOGICAL(AND OR NOT) & BETWEEN OPERATOR
			 ‣SECTION	11	: LIKE, IN, NOT IN, OPERATOR & IS NULL CLAUSE
			 ‣SECTION	12	: OFFSET FETCH
			 ‣SECTION	13	: AGGREGATE FUNCTIONS
			 ‣SECTION	14	: ROLLUP & CUBE OPERATOR
			 ‣SECTION	15	: GROUPING SETS
			 ‣SECTION	16	: SUB-QUERIES (INNER, CORRELATED)
			 ‣SECTION	17	: EXISTS
			 ‣SECTION	18	: CTE
			 ‣SECTION	19	: MERGE
			 ‣SECTION	20	: IIF,CASE,CHOOSE
			 ‣SECTION	21	: COALESCE & ISNULL
			 ‣SECTION	22	: GROPING FUNCTION
			 ‣SECTION	23	: RANKING FUNCTION
			 ‣SECTION	24	: IF ELSE & PRINT
			 ‣SECTION	25	: GOTO
			 ‣SECTION	26	: WAITFOR
			 ‣SECTION	27	: sp_helptext

*/

							-- ‣ SECTION   01  : INSERT DATA USING INSERT INTO KEYWORD--

USE LMS 
GO 
--insert values in Table 1 Books 

INSERT INTO Books (BookID, Title, ISBN, PublicationYear, Publisher) 
VALUES
(1, 'Book 1 Title', 'ISBN111111', 2000, 'Publisher A'),
(2, 'Book 2 Title', 'ISBN222222', 2005, 'Publisher B'),
(3, 'Book 3 Title', 'ISBN333333', 2010, 'Publisher C'),
(4, 'Book 4 Title', 'ISBN444444', 2015, 'Publisher D'),
(5, 'Book 5 Title', 'ISBN555555', 2020, 'Publisher E'),
(6, 'Book 6 Title', 'ISBN666666', 1998, 'Publisher F'),
(7, 'Book 7 Title', 'ISBN777777', 2003, 'Publisher G'),
(8, 'Book 8 Title', 'ISBN888888', 2008, 'Publisher H'),
(9, 'Book 9 Title', 'ISBN999999', 2013, 'Publisher I'),
(10, 'Book 10 Title', 'ISBN101010', 2018, 'Publisher J'),
(11, 'Book 11 Title', 'ISBN111000', 1995, 'Publisher K'),
(12, 'Book 12 Title', 'ISBN222000', 2001, 'Publisher L'),
(13, 'Book 13 Title', 'ISBN333000', 2006, 'Publisher M'),
(14, 'Book 14 Title', 'ISBN444000', 2011, 'Publisher N'),
(15, 'Book 15 Title', 'ISBN555000', 2016, 'Publisher O');
GO

--insert values in Table 2 Authors

INSERT INTO Authors (AuthorID, Name) VALUES
(1, 'John Smith'),
(2, 'Emma Johnson'),
(3, 'Michael Williams'),
(4, 'Olivia Brown'),
(5, 'William Jones'),
(6, 'Ava Davis'),
(7, 'James Miller'),
(8, 'Sophia Wilson'),
(9, 'Robert Taylor'),
(10, 'Isabella Anderson');
GO

--insert values in Table 3 BooksAuthors

INSERT INTO BooksAuthors (BookID, AuthorID) VALUES
(1, 1),  -- Book 1 is authored by John Smith
(2, 2),  -- Book 2 is authored by Emma Johnson
(1, 2),  -- Book 1 is also co-authored by Emma Johnson
(3, 3),  -- Book 3 is authored by Michael Williams
(3, 1);  -- Book 3 is also co-authored by John Smith
GO


--insert values in Table 4 Members


INSERT INTO Members (MemberID, Name, Email, Phone) VALUES
(1, 'John Smith', 'john@example.com', '123-456-7890'),
(2, 'Emma Johnson', 'emma@example.com', '987-654-3210'),
(3, 'Michael Williams', 'michael@example.com', '555-555-5555'),
(4, 'Olivia Brown', 'olivia@example.com', '111-222-3333'),
(5, 'William Jones', 'william@example.com', '444-444-4444'),
(6, 'Ava Davis', 'ava@example.com', '777-888-9999'),
(7, 'James Miller', 'james@example.com', '666-666-6666'),
(8, 'Sophia Wilson', 'sophia@example.com', '777-777-7777'),
(9, 'Robert Taylor', 'robert@example.com', '888-888-8888'),
(10, 'Isabella Anderson', 'isabella@example.com', '999-999-9999'),
(11, 'David Lee', 'david@example.com', '222-333-4444'),
(12, 'Emily Thomas', 'emily@example.com', '111-000-1111');
GO

--insert values in Table 5 Members

INSERT INTO Loans (LoanID, BookID, MemberID, LoanDate, DueDate) VALUES
(1, 1, 1, '2023-07-21', '2023-08-21'),  -- Book 1 borrowed by Member 1
(2, 2, 2, '2023-07-22', '2023-08-22'),  -- Book 2 borrowed by Member 2
(3, 3, 1, '2023-07-23', '2023-08-23'),  -- Book 3 borrowed by Member 1
(4, 1, 3, '2023-07-24', '2023-08-24'),  -- Book 1 borrowed by Member 3
(5, 2, 1, '2023-07-25', '2023-08-25'),  -- Book 2 borrowed by Member 1
(6, 3, 2, '2023-07-26', '2023-08-26'),  -- Book 3 borrowed by Member 2
(7, 1, 2, '2023-07-27', '2023-08-27'),  -- Book 1 borrowed by Member 2
(8, 2, 3, '2023-07-28', '2023-08-28'),  -- Book 2 borrowed by Member 3
(9, 3, 3, '2023-07-29', '2023-08-29'),  -- Book 3 borrowed by Member 3
(10, 1, 1, '2023-07-30', '2023-08-30');  -- Book 1 borrowed by Member 1

--Insert  values in Table 6 feedBack

INSERT INTO feedBack (id, dateOfReturn) VALUES
(1, '2023-07-21'),
(2, '2023-07-22'),
(3, '2023-07-23'),
(4, '2023-07-24'),
(5, '2023-07-25');
GO



-- ‣ SECTION   02  : SELECT FROM TABLE

SELECT * FROM Books
GO
---- ‣ SECTION   03 : SELECT FROM View 

SELECT * FROM tempViews 

-- ‣SECTION	04	: SELECT INTO

SELECT * INTO BookCopy FROM Books
GO
-- ‣ SECTION	05	: IMPLICIT JOIN WITH ORDER BY CLAUSE & WHERE BY CLAUSE, 

SELECT b.BookID,Title,MemberID FROM Books b
JOIN Loans  l ON b.BookID = l.BookID
ORDER BY BookID
GO
SELECT * FROM Books
WHERE BookID = 1


--- ‣SECTION	06	: INNER JOIN WITH GROUP BY CLAUSE

SELECT b.BookID,SUM(MemberID) AS Memberid FROM Books b
JOIN Loans  l ON b.BookID = l.BookID
GROUP BY (b.BookID)
GO

---Section 7  Outer Join 

SELECT b.BookID,Title,MemberID FROM Books b
LEFT OUTER JOIN Loans  l ON b.BookID = l.BookID
ORDER BY BookID
GO
--SECTION 08 Cross join 

SELECT b.BookID,Title,MemberID FROM Books b 
CROSS JOIN Loans  
GO
-- SECTOIN 09 TOP DISTINCT CLAUSE

SELECT DISTINCT TOP 5   BookID FROM Books 

--Section 10 Comparison Operator (AND,OR,NOT)

--AND

SELECT * FROM Loans
WHERE LoanID = 3 AND DueDate = '2023-08-23'
GO

--OR 

SELECT * FROM Loans
WHERE LoanID = 3 OR DueDate = '2023-08-23'
GO
--NOT 

SELECT * FROM Loans 
WHERE NOT DueDate = '2023-08-21'
GO

--Section 11 LIKE,IN,IS NULL Operator

SELECT * FROM Books

SELECT * FROM Books 
WHERE title LIKE 'b%'
GO
SELECT * FROM Books 
WHERE title LIKE 'N[A-J]'
GO
SELECT * FROM Books 
WHERE title LIKE 'B[^P-Z]'
GO
--Section 12 Fetch and Offset 

SELECT *
FROM Books
ORDER BY Title
OFFSET 4 ROWS
FETCH NEXT 4 ROWS ONLY;

--Section 13 

SELECT LoanID,sum(MemberID)As SumOfMember FROM Loans
GROUP BY (LoanID)

--Section 15 ROLLUP AND CUBE

--ROLLUP 
SELECT  LoanID,COUNT(MemberID)AS Member FROM Loans
GROUP BY ROllUP(LoanID)

--CUBE 
SELECT  LoanID,COUNT(MemberID)AS Member FROM Loans
GROUP BY CUBE(LoanID)

--Section 16 SubQuerie (subqueries,and co-related subqueries)

SELECT * FROM Books
SELECT * FROM Loans

--Sub Queries

SELECT BookID, Title,
  (SELECT COUNT(*) FROM Loans WHERE BookID = Books.BookID) AS LoanCount
FROM Books;

--Co-Related Sub Queries 

SELECT LoanID, LoanDate,
  (SELECT Title FROM Books WHERE BookID = Loans.BookID) AS BookTitle,
  (SELECT MemberID FROM Loans WHERE LoanID = Loans.LoanID) AS MemberID,
  (SELECT MemberID FROM Members WHERE MemberID = Loans.MemberID) AS MemberName
FROM Loans
WHERE BookID = (SELECT BookID FROM Books WHERE Title = 'ISBN888888');


--Section 17 EXISTS CLAUSE 

SELECT BookID, Title
FROM Books
WHERE EXISTS (
  SELECT 1
  FROM Loans
  WHERE Loans.BookID = Books.BookID
);


--Section 18 CTE 

WITH CurrentLoans AS (
  SELECT 
    b.BookID,
    b.Title,
    b.ISBN,
    l.MemberID,
    l.LoanDate,
    l.DueDate
  FROM
    Books b
    INNER JOIN Loans l ON b.BookID = l.BookID
)
SELECT * FROM CurrentLoans;
GO 

--Section 19 Merge in SQL 

SELECT
  Loans.LoanID,
  Loans.BookID,
  Books.Title,
  Books.ISBN,
  Books.PublicationYear,
  Books.Publisher,
  Loans.MemberID,
  Loans.LoanDate,
  Loans.DueDate
FROM
  Loans
JOIN
  Books ON Loans.BookID = Books.BookID;
GO

--Section 20 IFF,CASE,CHOOSE

SELECT * FROM Books
SELECt * FROM Loans

--IIF 

SELECT BookID,
IIF(BookID>0,'we have it','We do not have it ') AS Result 
FROM Books
GO 

--CHOOSE 

SELECT BookID,
CHOOSE(BookID,'1st','2nd','3rd','4th','6th')
FROM Books
GO

--CASE 

SELECT
  BookID,
  Title,
  PublicationYear,
  CASE
    WHEN PublicationYear < 2010 THEN 'Old'
    WHEN PublicationYear BETWEEN 2010 AND 2019 THEN 'Recent'
    WHEN PublicationYear >= 2020 THEN 'New'
    ELSE 'Unknown'
  END AS Category
FROM
  Books;
GO

--Section 21 COALESCE & ISNULL

--COALESCE 

SELECT COALESCE(LoanID,'Loans') AS LOAN_NO,SUM(MemberID) AS member FROM Loans
GROUP BY (LoanID)

--Isnull 

SELECT * FROM Books
WHERE ISBN  is null


--Section 22 ANY ,SOME ,ALL


--ANY
IF 1>ANY(SELECT BookID FROM Books)
PRINT 'Yes'
ELSE 
PRINT 'NO'
GO


--SOME
IF 1>SOME(SELECT BookID FROM Books)
PRINT 'Yes'
ELSE 
PRINT 'NO'
GO

--ALL

IF 1>ALL(SELECT BookID FROM Books)
PRINT 'Yes'
ELSE 
PRINT 'NO'
GO


--Section 22 Wait for clause 

PRINT 'HELLO'
WAITFOR DELAY '00:00:03'
PRINT 'GOOD LUCK'
GO

--Section 23 sphelp 

EXEC sp_helptext books
GO

--Section 24 RANK FUNCTION 

SELECT 
RANK() OVER(ORDER BY BookID) AS 'Rank',
DENSE_RANK() OVER(ORDER BY ISBN) AS 'Dense_Rank',
NTILE(3) OVER(ORDER BY PublicationYear) AS 'NTILE',
BookID,
ISBN, 
PublicationYear
FROM Books
GO

select * from Books