--#The InstantStay House Development team wants to track the extra facilities and/or benefits such as
--amenities or insurances, #provided with the houses. The team needs you to create a new database table called
--EXTRA with fields ExtraID and ExtraDescription
create table EXTRA(
ExtraID int PRIMARY KEY NOT NULL,
ExtraDescrition varchar(20) NOT NULL
);

create table HOUSE(
HouseID int PRIMARY KEY NOT NULL,
HouseDescrition varchar(20) NOT NULL
);

--this is for change column name
exec sp_rename 'HOUSE.HouseDescrition','HouseState';

CREATE TABLE OWNER(
OwnerID int not null,
OwnerFirstName varchar(50) not null,
OwnerLastName varchar(50) not null,
OwnereStatus BIT default 1,
OwnerEmail varchar(50) not null,
OwnerEndDate date
);

--#The House Development team wants to combine extras and house information in a separate table. #Create a new table
-- called HOUSE_EXTRA with the fields ExtraID and HouseID. Use foreign keys to add the respective references to their
--own tables.#In addition, when the IDs of the houses or extras are updated or changed, the changes should be automatically
--reflected in the HOUSE_EXTRA table #with the ON UPDATE CASCADE references. Similarly, when the houses or extras are deleted,
--the corresponding rows from the HOUSE_EXTRA table #will also need to be deleted using the ON DELETE CASCADE statements
CREATE TABLE HOUSE_EXTRA(
HouseID INT NOT NULL,
ExtraID INT NOT NULL,
PRIMARY KEY (HouseID, ExtraID),
FOREIGN KEY (HouseID)
REFERENCES HOUSE(HouseID)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(ExtraID)
REFERENCES EXTRA(ExtraID)
ON DELETE CASCADE ON UPDATE CASCADE
);

--#The Owner Relationships team wants to track the active owners in the InstantStay system. 
--#The team requested a new table, called ACTIVE_OWNER, which should have all the related information of the active 
--owners currently
--there have one function different with MySQL
--in MS SQL SERVER BIT means bool, 1 means true, 0 means false
CREATE TABLE ACTIVE_OWNER(
OwnerID int not null,
OwnerFirstName varchar(50) not null,
OwnerLastName varchar(50) not null,
OwnereStatus BIT default 1,
OwnerEmail varchar(50) not null
);

INSERT INTO ACTIVE_OWNER(OwnerID, OwnerFirstName, OwnerLastName, OwnerEmail)
SELECT OwnerID, OwnerFirstName, OwnerLastName, OwnerEmail
from Owner
where OwnerEndDate is null;

select *
from ACTIVE_OWNER;

--#The owner relationship team wants to reduce the time required to access all the active owner details. #The team has
--highlighted the fact that it needs extra effort and time to fetch the customer information #when they are only provided
--with the first name. The team is looking for a solution to minimize the time required to fetch the required data.
--#In such case, you need to create an INDEX for first name and last name of the active owners.#Indexes make it easier
--to find rows in MySQL. Without an index, the MySQL engine will look for all the rows to find the searched items.
--#Indexes are created over the tables and their fields
CREATE INDEX NameSearch ON ACTIVE_OWNER(
OwnerFirstName, OwnerLastName
);

--#The Owner Relationship team wants to ensure that there are no multiple active owners with the same first name, 
--last name and email.To ensure this, you need to create a CONSTRAINT on the ACTIVE_OWNER table to ensure the teams requirement
ALTER TABLE ACTIVE_OWNER
ADD CONSTRAINT Dupicatecheck UNIQUE(
OwnerFirstName, OwnerLastName,OwnerEmail
);

--#The House Development team considered that the extras for the houses should not be free. 
--#Therefore, they want to extend their EXTRA table to cover pricing information. Change the corresponding table with the
--following command
ALTER TABLE EXTRA
ADD ExtraPrice FLOAT;

select *
from EXTRA;

--#The House Development team wants to ensure that the default price of the extras should be 0 instead of NULL. 
--#Their calculation systems resulted with errors when NULL values are returned. 
--$You need to set default value for the ExtraPrice column of the EXTRA table
ALTER TABLE EXTRA 
ADD CONSTRAINT DF_ExtraPrice DEFAULT 0 FOR ExtraPrice;

--#The Owner Relationship team requested a constraint on the first names and last names of the active users. 
--#The team does not want dummy owner names with only 1 letter in the system, therefore, you need to insert the following
--CHECK to the ACTIVE_OWNER table
ALTER TABLE ACTIVE_OWNER ADD CHECK (LEN(OwnerFirstName)>2 AND LEN(OwnerLastName)>2);

--#The House Development team collected the extras and they want you to update the system’s database with the relative information:
--#ID: 1, Description: Liability Insurance, Price: 0
--#ID: 2, Description: Personal Insurance, Price: 100
--#ID: 3, Description: Household Insurance, Price: 125
INSERT INTO EXTRA(ExtraID, ExtraDescrition,ExtraPrice)
VALUES
(1, 'Liability Insurance',0),
(2, 'Personal Insurance',100),
(3, 'Household Insurance', 125)

SELECT *
FROM EXTRA;

INSERT INTO HOUSE(HouseID,HouseState)
VALUES
(1, 'NY')

SELECT *
FROM HOUSE;

--#The House Development team mentioned that all the houses in the state NY already have Liability Insurance (ID: 1).
--#Add all the houses in NY with the ExtraID value of 1 into the HOUSE_EXTRA table
INSERT INTO HOUSE_EXTRA(HouseID, ExtraID)
SELECT HouseID,'1' from HOUSE WHERE HouseState='NY';

SELECT *
FROM HOUSE_EXTRA;

--#The Owner Relationship team realized that they do not need an OwnerStatus column in the ACTIVE_OWNER table.
--#The team want you to remove the column the from the table
--when table has constraint need drop constraint first then drop column
ALTER TABLE ACTIVE_OWNER
DROP CONSTRAINT DF__ACTIVE_OW__Owner__403A8C7D;
ALTER TABLE ACTIVE_OWNER DROP COLUMN OwnereStatus;


--#The House Development team wants to update the price of the liability insurance extra to 75 and wants to remove the 
--household insurance option.#However, the team does not store the ExtraID and wants to work with the ExtraDescription. 
--#Prepare the update script by temporarily inactivating the safe update feature of MySQL
--SET SQL_SAFE_UPDATES=0;-- temporarily inactivating the safe update feature of MySQL
UPDATE EXTRA
SET 
ExtraPrice=75
WHERE 
ExtraDescrition='Liability Insurance';
DELETE
FROM EXTRA
WHERE 
ExtraDescrition='Household Insurance';
--SET SQL_SAFE_UPDATES = 1; -- activating the safe update feature of MYSQL

SELECT *
FROM EXTRA;

--#The House Development team wants a SQL script to add multiple rows to the HOUSE_EXTRA table in a batch. 
--#You need to create a transaction, add the rows and finally commit the changes
--SET autocommit=OFF;
select *
from HOUSE_EXTRA;

BEGIN  TRANSACTION;
INSERT INTO HOUSE_EXTRA (HouseID, ExtraID)
VALUES
(2, 1),
(2, 2);
COMMIT;

--SET autocommit=ON;

--#The House Development team wants a SQL script to add ExtraID 1 and 2 with HouseID 3 to the HOUSE_EXTRA table.
--#However, they do not want this data in the database after they complete their operations. You need to create a 
--transaction #with the rollback of the changes
BEGIN  TRANSACTION;
INSERT INTO HOUSE_EXTRA (HouseID, ExtraID)
VALUES
(3,1),
(3,2)
ROLLBACK;
COMMIT;

--#The Owner Relationship team realized that maintaining owners in two different tables is difficult.#Therefore, they 
--indicated that they do not need the ACTIVE_OWNER table anymore. You need to delete the table from the database
DROP TABLE ACTIVE_OWNER;

--#The Owner Relationship team requested to work with a VIEW for active owners. 
--#Create a VIEW with the name ACTIVE_OWNER from the table OWNER for the owners with end date is NULL
CREATE VIEW ACTIVE_OWNER AS
SELECT OwnerID, OwnerFirstName, OwnerLastName, OwnerEmail
from OWNER
Where OwnerEndDate is null;

Select *
from active_owner;

INSERT INTO OWNER(OwnerID, OwnerFirstName, OwnerLastName, OwnerEmail)
VALUES
(5, 'charles','salehan','cs@web.com')


--#The Owner Relationship team wants to update the email of the active owner whose ID is 5 with the address 
--a.webber@xmail.au.#Create an UPDATE statement to work over the ACTIVE_OWNER view
UPDATE ACTIVE_OWNER
SET 
OwnerEmail='a.webber@xmail.au'
where OwnerID=5;

select *
from ACTIVE_OWNER
where OwnerID=5;

--#The Owner Relationship team wants to add a new owner (Ece, Yilmaz, e.yilmaz@xmail.com, 2022-07-28). 
--#However, they indicated that OwnerID fields should be automatically increased with the new additions to the system. 
--#You need to make related adjustment to the OWNER table for the OwnerID field
Select *
from OWNER;

INSERT INTO OWNER(OwnerID, OwnerFirstName, OwnerLastName, OwnerEmail, OwnerEndDate)
VALUES
(6,'Ece','Yilmaz','cs@web.com','2022-07-28');

--#The InstantStay Finance team requested a procedure to calculate the value-added tax (VAT) amount of the stays
--reservations in InstantStay.#The team also indicated that VAT percentage is currently 18% but can be changed in the 
--future. #You need to create a VATCalculator procedure with the VAT Percentage variable.
--#We will create the procedure with a single SELECT statement where the price and VAT is calculated
CREATE PROCEDURE VATCalculator AS
BEGIN
    DECLARE @VAT_PERCENTAGE FLOAT = 0.18;

    SELECT StayPrice, ROUND(StayPrice * @VAT_PERCENTAGE, 2) AS VAT
    FROM STAY;
END;

--#The InstantStay Marketing team wants to create guest levels such as GOLD, BRONZE and NEW. 
--#The team will use these levels to provide additional campaigns and discounts. The team requested to create a function 
--to set guest level as GOLD #when the user stays more than 2, BRONZE more than 1 and NEW otherwise. Create the following
--MySQL function to return the guest levels
CREATE FUNCTION GuestStatus (@id INT)
RETURNS VARCHAR(20)
AS
BEGIN
    DECLARE @guestLevel VARCHAR(20);
    DECLARE @stayCount INT;
    
    SELECT @stayCount = COUNT(StayID) 
    FROM STAY
    WHERE GuestID = @id;
    
    IF (@stayCount > 2)
        SET @guestLevel = 'GOLD';
    ELSE IF (@stayCount > 1)
        SET @guestLevel = 'BRONZE';
    ELSE
        SET @guestLevel = 'NEW';
    
    RETURN @guestLevel;
END;

--#The InstantStay Developers team requested a SQL statement to collect the emails from the tables in the InstantStay 
--database. #Create a generic statement with the following script and execute it for testing
DECLARE @table_name NVARCHAR(50) = 'OWNER';
DECLARE @OwnerEmailCollector NVARCHAR(MAX);
DECLARE @sql NVARCHAR(MAX);

SET @OwnerEmailCollector = N'SELECT OwnerEmail FROM ' + QUOTENAME(@table_name);

SET @sql = N'EXEC sp_executesql @OwnerEmailCollector';

EXEC sp_executesql @sql, N'@OwnerEmailCollector NVARCHAR(MAX)', @OwnerEmailCollector;

--#The Developers team wanted to ensure that all the emails of the owners are lowercase in the database. 
--#You need to create a trigger for before any INSERT statement on OWNER table
CREATE TRIGGER email_insert
ON OWNER
AFTER INSERT
AS
BEGIN
    UPDATE OWNER
    SET OwnerEmail = LOWER(inserted.OwnerEmail)
    FROM OWNER
    INNER JOIN inserted ON OWNER.OwnerID = inserted.OwnerID;
END;

--#The Developers also indicated that emails should be lowercase even after they are updated in the database. 
--#You need to create another trigger for before any UPDATE statements are called on the OWNER table
CREATE TRIGGER email_update
ON OWNER
INSTEAD OF UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE OWNER
    SET OwnerEmail = LOWER(inserted.OwnerEmail)
    FROM inserted
    WHERE OWNER.OwnerID = inserted.OwnerID;
END;

--#The Marketing team requested to create an email list with combining all the email addresses with ;.
--#You need to create a procedure that uses a CURSOR to iterate all over the emails in the OWNER table
CREATE PROCEDURE OwnerEmailList
    @emailAddresses VARCHAR(MAX) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @emailAddress VARCHAR(100);
 
    DECLARE cursorEmail CURSOR FOR 
        SELECT OwnerEmail FROM OWNER;
    
    SET @emailAddresses = '';

    OPEN cursorEmail;
    FETCH NEXT FROM cursorEmail INTO @emailAddress;
    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @emailAddresses =
            COALESCE(@emailAddresses + ';', '') + 
            LOWER(@emailAddress);
        FETCH NEXT FROM cursorEmail INTO @emailAddress;
    END
    CLOSE cursorEmail;
    DEALLOCATE cursorEmail;
END;

DECLARE @ownerEmailList VARCHAR(MAX);
EXEC OwnerEmailList @ownerEmailList OUTPUT;
SELECT @ownerEmailList;