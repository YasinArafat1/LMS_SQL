/*
					SQL Project Name : Library Management System
							    Trainee Name : Yasin Arafat   
						    	  Trainee ID : 1279076       
							  Batch ID : WADA/PNTL-A/56/01 

 ---------------------------------------------------------------------------------------------------------------------------------------
 ---------------------------------------------------------------------------------------------------------------------------------------

Table of Contents: DDL
			‣ SECTION 01: Created a Database LMS
			‣ SECTION 02: Created Appropriate Tables with column definition related to the project
			‣ SECTION 03: ALTER, DROP AND MODIFY TABLES & COLUMNS
			‣ SECTION 04: CREATE CLUSTERED AND NONCLUSTERED INDEX
			‣ SECTION 05: CREATE SEQUENCE & ALTER SEQUENCE
			‣ SECTION 06: CREATE A VIEW & ALTER VIEW
			‣ SECTION 07: CREATE STORED PROCEDURE & ALTER STORED PROCEDURE
			‣ SECTION 08: CREATE FUNCTION(SCALER VALUED FUNCTION & TABLE VALUED FUNCTION)
			‣ SECTION 09: CREATE TRIGGER (FOR/AFTER TRIGGER)
			‣ SECTION 10: CREATE TRIGGER (INSTEAD OF TRIGGER)
*/
							
							-- ‣ SECTION 01: Created a Database LMS--

CREATE DATABASE LMS 
ON 
(
Name='LMSmdf',
FileName='D:\SQL Project.mdf',
size = 5mb,
Maxsize=50mb,
Filegrowth =10%
)
LOG ON 
(
Name='LMSldf',
FileName='D:\SQL Project.ldf',
size = 5mb,
Maxsize=50mb,
Filegrowth =10%
)

USE LMS

				--‣ SECTION 02: Created Appropriate Tables with column definition related to the project

--Table 1

CREATE TABLE Books (
  BookID INT PRIMARY KEY,
  Title VARCHAR(100) NOT NULL,
  ISBN VARCHAR(20) NOT NULL,
  PublicationYear INT NOT NULL,
  Publisher VARCHAR(100) NOT NULL
);

--Table 2

CREATE TABLE Authors (
  AuthorID INT PRIMARY KEY,
  [Name] VARCHAR(100) NOT NULL
);

--Table 3

CREATE TABLE BooksAuthors (
  BookID INT NOT NULL,
  AuthorID INT NOT NULL,
  PRIMARY KEY (BookID, AuthorID),
  FOREIGN KEY (BookID) REFERENCES Books(BookID),
  FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

--Table 4

CREATE TABLE Members (
  MemberID INT PRIMARY KEY,
  Name VARCHAR(100) NOT NULL,
  Email VARCHAR(100) NOT NULL,
  Phone VARCHAR(20) NOT NULL
);

--Table 5

CREATE TABLE Loans (
  LoanID INT PRIMARY KEY,
  BookID INT,
  MemberID INT,
  LoanDate DATE NOT NULL,
  DueDate DATE NOT NULL ,
  FOREIGN KEY (BookID) REFERENCES Books(BookID),
  FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

GO

--Table 6

CREATE TABLE feedBack 
(
id int ,
dateOfReturn VARCHAR(50)
)
GO
						


						--	‣ SECTION 03: ALTER, DROP AND MODIFY TABLES & COLUMNS


--Alter Example

ALTER TABLE feedBack 
ADD TakingDate DATE
GO

--Drop Example 

DROP TABLE feedBack 
GO
--MODIFY Example 

ALTER TABLE feedBack 
ADD dateOfReturn DATE 
GO


							


		
						--		‣ SECTION 04: CREATE CLUSTERED AND NONCLUSTERED INDEX


CREATE INDEX AuthorsIndex 
ON Authors (AuthorID)
GO 

CREATE NONCLUSTERED INDEX AuthorsIndex_1
ON Authors (name)
GO 



								-- ‣ SECTION 05: CREATE SEQUENCE & ALTER SEQUENCE
--CREATING SEQUENCE 

CREATE SEQUENCE tempSeq 
AS INT 
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 10000
CYCLE 
GO 


--ALTERING SEQUENCE 

ALTER SEQUENCE tempSeq 
AS INT 
RESTART WITH 100 
INCREMENT BY 1
MINVALUE 1
MAXVALUE 1000000
CYCLE 
GO 



							-- ‣ SECTION 06: CREATE A VIEW & ALTER VIEW --


CREATE VIEW tempViews1
AS 
SELECT BookID, ISBN
FROM Books;
GO
SELECT * FROM tempViews 
GO



								---‣ SECTION 07: CREATE STORED PROCEDURE (Insert ,Update,Delete using stored procedure)
--inserting using stored procedure 


CREATE PROC spBookInsert @BookID INT,
						 @Title VARCHAR(100),
						 @ISBN VARCHAR(20),
						 @PublicationYear INT,
						 @Publisher VARCHAR(100)

AS 
INSERT INTO Books (BookID,Title,ISBN,PublicationYear,Publisher ) 
            VALUES (@BookID,@Title,@ISBN,@PublicationYear,@Publisher)
GO
EXEC spBookInsert 16,'Book 16 Title', 'ISBN 888877775555',2019, Yasin 
GO


--Updating values using stored procedure


CREATE PROC spBookInsert2 @BookID INT					
AS 
Update Books set BookID = @BookID 
where BookID=@BookID 
GO 
EXEC spBookInsert2  16		
GO

--Deleting valuse using stored procedure 


CREATE PROC  spDelete   @BookID INT
AS 
Delete from Books 
Where BookID = @BookID         
GO
EXEC spDelete 16
GO
 



--- ‣ SECTION 08: CREATE FUNCTION(SCALER VALUED FUNCTION & TABLE VALUED FUNCTION)
GO

--Scaler Functions 

CREATE FUNCTION MonthlyExam1 (@MemberID as int )
Returns int
AS 
Begin 
Return (@MemberID+10)
end 
GO
Select dbo.Monthly (100)
Go


---Table Valued Functions 

select * from Loans
GO
CREATE FUNCTION TableVF1 (@BookID AS INT, @MemberID AS INT)
RETURNS TABLE
AS 
RETURN(SELECT MemberID FROM Loans WHERE MemberID >1)
GO


				--‣ SECTION 09: CREATE TRIGGER (FOR/AFTER TRIGGER)---


CREATE TRIGGER trUpdateDelete 
ON Loans FOR UPDATE,DELETE 
AS 
BEGIN 
PRINT 'Update And Delete For This Table is Restricted'
ROLLBACK TRANSACTION
END 
GO
UPDATE Loans SET LoanDate='2025-10-10'
DELETE FROM Loans WHERE LoanID=1



				--	‣ SECTION 10: CREATE TRIGGER (INSTEAD OF TRIGGER)

select * from   Books
GO
CREATE TRIGGER BooksTrigger 
ON Books 
FOR INSERT,UPDATE 
AS 
BEGIN 
DECLARE @BookID INT
SELECT @BookID=BookID FROM inserted
	IF @BookID>20
	BEGIN 
		PRINT 'insert and update cannot be performed cz itemid >20'
		ROLLBACK TRANSACTION
	END
END 
GO
Insert into  Books VALUES (25,'abc','acbd','2025','abc') 
update Books set BookID=22
where BookID=5
