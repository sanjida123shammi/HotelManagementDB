/*  Author - Sanjida Shammi

==========================================================================================

    Hotel Management Database - DDL Script
    Database Name: HotelManagementDB
    Total queries: 56

==========================================================================================

    Index
    -----
    DDL-01.	Create a 3NF database ........................................... Line 75
    DDL-02.	Create Tables ................................................... Line 99
    DDL-03.	Create Non-clustered Index ...................................... Line 113
    DDL-04.	Create Clustered Index .......................................... Line 123
    DDL-05.	Modify a Table .................................................. Line 143
    DDL-06.	Delete a Table .................................................. Line 181
    DDL-07.	Clear all the data of a Table using TRUNCATE .................... Line 185
    DDL-08.	Create a view that joins Multiple Tables ........................ Line 190
    DDL-09. VIEW with ENCRYPTION ............................................ Line 210
    DDL-10. VIEW with SCHEMABINDING ......................................... Line 231
    DDL-11. VIEW with ENCRYPTION and SCHEMABINDING .......................... Line 252
	DDL-12. ALTER VIEW ...................................................... Line 273
	DDL-13. CREATE an Updatable View ........................................ Line 296
	DDL-14. ALTER Updatable View ............................................ Line 305
	DDL-15. Create View With Check Option ................................... Line 314
    DDL-16. Drop View ....................................................... Line 324
	DDL-17. CREATE SEQUENCE ................................................. Line 328
	DDL-18. CREATE a TABLE by using SEQUENCE ................................ Line 342
	DDL-19. ALTER SEQUENCE .................................................. Line 349
    DDL-20. DROP SEQUENCE ................................................... Line 356
    DDL-21.	SELECT PROCEDURE ................................................ Line 361
    DDL-22.	ALTER Procedure ................................................. Line 385
	DDL-23. Create PROCEDURE WITH ENCRYPTION ................................ Line 398
	DDL-24. Create PROCEDURE WITH RECOMPILE ................................. Line 417
	DDL-25. Create PROCEDURE WITH ENCRYPTION and RECOMPILE .................. Line 436
	DDL-26. Create PROCEDURE with Required Parameter ........................ Line 455
	DDL-27. Create PROCEDURE with Optional Parameter ........................ Line 468
	DDL-28. INSERT PROCEDURE ................................................ Line 483
	DDL-29. Create a procedure using THROW .................................. Line 500
	DDL-30. Create a User-Defined Table Type ................................ Line 519
	DDL-31. Create Procedure that accepts a table as a parameter ............ Line 529
	DDL-32. Multiple Action Procedure w/o Transaction and Error Handling .... Line 538
	DDL-33. Create Procedure with error handling ............................ Line 586
    DDL-34. Create Procedure with Transaction ............................... Line 638
	DDL-35. Multiple Action Procedure with Transaction and Error Handling ... Line 692
	DDL-36. DROP PROCEDURE .................................................. Line 767
	DDL-37. Create Scalar-valued Function ................................... Line 772
	DDL-38. Create Simple/Inline Table-valued Function ...................... Line 791
	DDL-39. Create Multi-statement Table-valued Function .................... Line 804
	DDL-40. Create Function With Encryption/Schemabinding ................... Line 824
	DDL-41. Alter Function .................................................. Line 847
	DDL-42. DROP Function ................................................... Line 869
	DDL-43. Instead Of Trigger - Raise an error ............................. Line 874
	DDL-44. INSTEAD OF Trigger for a View ................................... Line 914
	DDL-45. ALTER Trigger ................................................... Line 938
	DDL-46. AFTER TRIGGER that shows the result after an action ............. Line 987
	DDL-47. AFTER TRIGGER that archieves deleted data ....................... Line 996
	DDL-48. FOR TRIGGER ..................................................... Line 1007
	DDL-49. DROP TRIGGER .................................................... Line 1017
	DDL-50. CREATE LOGIN: Create a new identity on the server ............... Line 1022
	DDL-51. ALTER LOGIN: Change the password or rename the login ............ Line 1027
	DDL-52. DROP LOGIN: Remove the login from the server .................... Line 1032
	DDL-53. GRANT: Give permission to read and modify ....................... Line 1036
	DDL-54. REVOKE: Take away the Insert and Update permissions ............. Line 1042
	DDL-55. WITH GRANT OPTION ............................................... Line 1046
	DDL-56. GRANT OPTION FOR ................................................ Line 1050

==========================================================================================
*/

USE master
GO

-- DDL-01. Create Database
IF DB_ID('HotelManagementDB') IS NOT NULL
DROP DATABASE HotelManagementDB
GO
CREATE DATABASE HotelManagementDB
ON(
    Name = HotelManagementDB_Data_1,
    Filename = 'C:\Program Files\Microsoft SQL Server\MSSQL17.MSSQLSERVER\MSSQL\DATA\HotelManagementDB_Data.mdf',
    Size = 25MB,
    Maxsize = 100MB,
    Filegrowth = 5%
)
LOG ON(
    Name = HotelManagementDB_Log_1,
    Filename = 'C:\Program Files\Microsoft SQL Server\MSSQL17.MSSQLSERVER\MSSQL\DATA\HotelManagementDB_Log.ldf',
    Size = 5MB,
    Maxsize = 50MB,
    Filegrowth = 1%
)
GO


USE HotelManagementDB
GO
-- DDL-02. Create Tables
--- Lookup Tables ---
CREATE TABLE RoomsStatuses (
    StatusID int PRIMARY KEY,
    StatusName varchar(50) NOT NULL
);

CREATE TABLE RoomTypes (
    RoomTypeID int PRIMARY KEY,
    RoomTypeName varchar(50) NOT NULL,
    RoomsDescription text
);


-- DDL-03. Create Non-clustered Index
CREATE NONCLUSTERED INDEX ix_RoomTypes_RoomTypeName ON RoomTypes(RoomTypeName);


CREATE TABLE Facilities (
    FacilityID int PRIMARY KEY NONCLUSTERED,
    FacilityName varchar(50) NOT NULL
);


-- DDL-04. Create Clustered Index
CREATE CLUSTERED INDEX ix_Facilities_FacilityName ON Facilities(FacilityName)


CREATE TABLE GuestTypes (
GuestTypeID int PRIMARY KEY,
GuestTypeName varchar(50) NOT NULL
);

--- Master Tables ---
CREATE TABLE Guests (
    GuestID int PRIMARY KEY Identity(501, 1),
    FirstName varchar(50) NOT NULL,
    LastName varchar(50) NOT NULL,
    GuestTypeID int REFERENCES GuestTypes(GuestTypeID) NOT NULL,
    Email varchar(100) UNIQUE,
    PhoneNumber varchar(20)
);


-- DDL-05. Modify a Table (Schema Evolution: Adding localized attributes)
ALTER TABLE Guests
ADD City char(2);


CREATE TABLE Rooms (
    RoomID int PRIMARY KEY,
    RoomNumber varchar(10) NOT NULL,
    RoomTypeID int REFERENCES RoomTypes(RoomTypeID) NOT NULL,
    StatusID int REFERENCES RoomsStatuses(StatusID) DEFAULT 101
);

--- Relationship / Transactional Tables ---
CREATE TABLE Room_Facilities (
    RoomID int REFERENCES Rooms(RoomID),
    FacilityID int REFERENCES Facilities(FacilityID) NOT NULL,
    PRIMARY KEY (RoomID, FacilityID)
);

CREATE TABLE Bookings (
    BookingID int PRIMARY KEY Identity,
    GuestID int REFERENCES Guests(GuestID),
    RoomID int REFERENCES Rooms(RoomID),
    CheckInDate date NOT NULL,
    CheckOutDate date NOT NULL,
    PerDayExpense decimal(10, 2)
);

CREATE TABLE BookingsArchieve (
    BookingID int PRIMARY KEY Identity,
    GuestID int REFERENCES Guests(GuestID),
    RoomID int REFERENCES Rooms(RoomID),
    CheckInDate date NOT NULL,
    CheckOutDate date NOT NULL,
    PerDayExpense decimal(10, 2)
);


-- DDL-06. Delete a TABLE
-- DROP TABLE Room_Facilities;


-- DDL-07. TRUNCATE TABLE
TRUNCATE TABLE Bookings;
GO


-- DDL-08. CREATE VIEW
CREATE VIEW vu_BookingInfos
AS
    SELECT  b.BookingID, g.FirstName + ' ' + g.LastName AS [Guest's Name], g.PhoneNumber, gt.GuestTypeName AS GuestType, 
            r.RoomNumber, rt.RoomTypeName AS RoomType, rs.StatusName AS [Room's Status], b.CheckInDate, B.CheckOutDate, 
            b.PerDayExpense, (DATEDIFF(day, b.CheckInDate, b.CheckOutDate) * b.PerDayExpense) AS TotalExpense
    FROM Bookings b
    JOIN Guests g 
        ON b.GuestID = g.GuestID
    JOIN GuestTypes gt
        ON gt.GuestTypeID = g.GuestTypeID
    JOIN Rooms r
        ON r.RoomID = b.RoomID
    JOIN RoomTypes rt
        ON rt.RoomTypeID = r.RoomTypeID
    JOIN RoomsStatuses rs
        ON rs.StatusID = r.StatusID;
GO


-- DDL-09. VIEW with ENCRYPTION
CREATE VIEW vu_BookingInfosEncrypt
WITH ENCRYPTION
AS
    SELECT  b.BookingID, g.FirstName + ' ' + g.LastName AS [Guest's Name], g.PhoneNumber, gt.GuestTypeName AS GuestType, 
            r.RoomNumber, rt.RoomTypeName AS RoomType, rs.StatusName AS [Room's Status], b.CheckInDate, B.CheckOutDate, 
            b.PerDayExpense, (DATEDIFF(day, b.CheckInDate, b.CheckOutDate) * b.PerDayExpense) AS TotalExpense
    FROM Bookings b
    JOIN Guests g 
        ON b.GuestID = g.GuestID
    JOIN GuestTypes gt
        ON gt.GuestTypeID = g.GuestTypeID
    JOIN Rooms r
        ON r.RoomID = b.RoomID
    JOIN RoomTypes rt
        ON rt.RoomTypeID = r.RoomTypeID
    JOIN RoomsStatuses rs
        ON rs.StatusID = r.StatusID;
GO


-- DDL-10. VIEW with SCHEMABINDING
CREATE VIEW vu_BookingInfosSchemabind
WITH SCHEMABINDING
AS
    SELECT  b.BookingID, g.FirstName + ' ' + g.LastName AS [Guest's Name], g.PhoneNumber, gt.GuestTypeName AS GuestType, 
            r.RoomNumber, rt.RoomTypeName AS RoomType, rs.StatusName AS [Room's Status], b.CheckInDate, B.CheckOutDate, 
            b.PerDayExpense, (DATEDIFF(day, b.CheckInDate, b.CheckOutDate) * b.PerDayExpense) AS TotalExpense
    FROM dbo.Bookings b
    JOIN dbo.Guests g 
        ON b.GuestID = g.GuestID
    JOIN dbo.GuestTypes gt
        ON gt.GuestTypeID = g.GuestTypeID
    JOIN dbo.Rooms r
        ON r.RoomID = b.RoomID
    JOIN dbo.RoomTypes rt
        ON rt.RoomTypeID = r.RoomTypeID
    JOIN dbo.RoomsStatuses rs
        ON rs.StatusID = r.StatusID;
GO


-- DDL-11. VIEW with ENCRYPTION and SCHEMABINDING
CREATE VIEW vu_BookingInfosEncryptAndSchemabind
WITH ENCRYPTION, SCHEMABINDING
AS
    SELECT  b.BookingID, g.FirstName + ' ' + g.LastName AS [Guest's Name], g.PhoneNumber, gt.GuestTypeName AS GuestType, 
            r.RoomNumber, rt.RoomTypeName AS RoomType, rs.StatusName AS [Room's Status], b.CheckInDate, B.CheckOutDate, 
            b.PerDayExpense, (DATEDIFF(day, b.CheckInDate, b.CheckOutDate) * b.PerDayExpense) AS TotalExpense
    FROM dbo.Bookings b
    JOIN dbo.Guests g 
        ON b.GuestID = g.GuestID
    JOIN dbo.GuestTypes gt
        ON gt.GuestTypeID = g.GuestTypeID
    JOIN dbo.Rooms r
        ON r.RoomID = b.RoomID
    JOIN dbo.RoomTypes rt
        ON rt.RoomTypeID = r.RoomTypeID
    JOIN dbo.RoomsStatuses rs
        ON rs.StatusID = r.StatusID;
GO


-- DDL-12. ALTER VIEW
ALTER VIEW vu_BookingInfosEncryptAndSchemabind
WITH ENCRYPTION, SCHEMABINDING
AS
    SELECT  b.BookingID, g.FirstName + ' ' + g.LastName AS [Guest's Name], g.PhoneNumber, 
            gt.GuestTypeName AS GuestType, r.RoomNumber, rt.RoomTypeName AS RoomType, 
            rs.StatusName AS [Room's Status], b.CheckInDate, b.CheckOutDate, b.PerDayExpense,
            DATEDIFF(day, b.CheckInDate, b.CheckOutDate) AS TotalDays, 
            (DATEDIFF(day, b.CheckInDate, b.CheckOutDate) * b.PerDayExpense) AS TotalExpense
    FROM dbo.Bookings b
    JOIN dbo.Guests g 
        ON b.GuestID = g.GuestID
    JOIN dbo.GuestTypes gt
        ON gt.GuestTypeID = g.GuestTypeID
    JOIN dbo.Rooms r
        ON r.RoomID = b.RoomID
    JOIN dbo.RoomTypes rt
        ON rt.RoomTypeID = r.RoomTypeID
    JOIN dbo.RoomsStatuses rs
        ON rs.StatusID = r.StatusID;
GO


-- DDL-13. CREATE an Updatable View
CREATE VIEW vu_Shammi_Bookings
AS
SELECT BookingID, GuestID, CheckOutDate, PerDayExpense
FROM Bookings
WHERE GuestID = (SELECT GuestID FROM Guests WHERE LastName = 'Shammi');
GO


-- DDL-14. ALTER Updatable View
ALTER VIEW vu_Shammi_Bookings
AS
SELECT BookingID, GuestID, RoomID, CheckInDate, CheckOutDate, PerDayExpense
FROM Bookings
WHERE GuestID = (SELECT GuestID FROM Guests WHERE LastName = 'Shammi');
GO


-- DDL-15. Create View With Check Option
CREATE VIEW vu_Shammi_Bookings_With_Check
AS
SELECT BookingID, GuestID, RoomID, CheckInDate, CheckOutDate, PerDayExpense
FROM Bookings
WHERE GuestID = (SELECT GuestID FROM Guests WHERE LastName = 'Shammi')
WITH CHECK OPTION;
GO


-- DDL-16. DROP VIEW
DROP VIEW vu_BookingInfosEncryptAndSchemabind;


-- DDL-17. CREATE SEQUENCE
CREATE SEQUENCE TestSequence
    START WITH 1
    INCREMENT BY 10;

CREATE SEQUENCE TestSequence2
    AS int
    START WITH 10
    INCREMENT BY 10
    MINVALUE 10
    MAXVALUE 10000
    CYCLE CACHE 10;


-- DDL-18. CREATE a TABLE by using SEQUENCE
CREATE TABLE SequenceTable(
    SequenceNumber int,
    SequenceDescription varchar(50)
);


-- DDL-19. ALTER SEQUENCE
ALTER SEQUENCE TestSequence2
INCREMENT BY 15
CACHE 5
CYCLE;


-- DDL-20. DROP SEQUENCE
DROP SEQUENCE TestSequence, TestSequence2;
GO


-- DDL-21. SELECT PROCEDURE
CREATE PROC spBookingReport
AS

BEGIN
    SELECT DISTINCT g.GuestID, g.FirstName + ' ' + g.LastName AS GuestName, g.PhoneNumber,
                    SUM(b.PerDayExpense) OVER(PARTITION BY b.GuestID) AS TotalExpense
    FROM Guests AS g
    JOIN Bookings AS b
        ON g.GuestID = b.GuestID
    WHERE b.PerDayExpense > 400
    ORDER BY GuestName
END;
GO

CREATE PROC spGuestCity
    @City char(2)
AS
SELECT  FirstName + ' ' + LastName AS GuestName
FROM Guests
WHERE City = @City;
GO


-- DDL-22. ALTER Procedure
ALTER PROC spGuestCity
    @City char(2) = NULL
AS
    IF @City IS NULL
        SELECT  FirstName + ' ' + LastName AS GuestName
        FROM Guests
    ELSE
        SELECT  FirstName + ' ' + LastName AS GuestName
        FROM Guests
        WHERE City = @City;


-- DDL-23. Create PROCEDURE WITH ENCRYPTION
IF OBJECT_ID('spBookingCopy') IS NOT NULL
    DROP PROC spBookingsCopy
GO

CREATE PROC spBookingsCopy
WITH ENCRYPTION
AS

BEGIN
    IF OBJECT_ID('BookingsCopy') IS NOT NULL
    DROP TABLE BookingsCopy
        
    SELECT * INTO BookingsCopy
    FROM Bookings
END;
GO


-- DDL-24. Create PROCEDURE WITH RECOMPILE
IF OBJECT_ID('spBookingCopy2') IS NOT NULL
    DROP PROC spBookingsCopy2
GO

CREATE PROC spBookingsCopy2
WITH RECOMPILE
AS

BEGIN
    IF OBJECT_ID('BookingsCopy') IS NOT NULL
    DROP TABLE BookingsCopy
        
    SELECT * INTO BookingsCopy
    FROM Bookings
END;
GO


-- DDL-25. Create PROCEDURE WITH ENCRYPTION and RECOMPILE
IF OBJECT_ID('spBookingCopy3') IS NOT NULL
    DROP PROC spBookingsCopy3
GO

CREATE PROC spBookingsCopy3
WITH ENCRYPTION, RECOMPILE
AS

BEGIN
    IF OBJECT_ID('BookingsCopy') IS NOT NULL
    DROP TABLE BookingsCopy
        
    SELECT * INTO BookingsCopy
    FROM Bookings
END;
GO


-- DDL-26. Create PROCEDURE with Required Parameter 
CREATE PROC spBookingInvoiceTotal
    @dateVar Date,
    @bookingInvTotal money OUTPUT
AS

BEGIN
    SELECT @bookingInvTotal = SUM(PerDayExpense) FROM Bookings
    WHERE CheckInDate >= @dateVar
END;
GO


-- DDL-27. Create PROCEDURE with Optional Parameter 
CREATE PROC spBookingInvoiceTotal2
    @DateVar Date = NULL,
    @bookingInvTotal money OUTPUT
AS

BEGIN
    IF @DateVar IS NULL
    SELECT @DateVar = MIN(CheckOutDate) FROM Bookings
    SELECT @bookingInvTotal = SUM(PerDayExpense) FROM Bookings
    WHERE CheckOutDate >= @DateVar
END;
GO


-- DDL-28. INSERT PROCEDURE 
CREATE PROC spAddGuest
    @FirstName varchar(50),
    @LastName varchar(50),
    @GuestTypeID int,
    @Email varchar(100),
    @PhoneNumber varchar(20),
    @City char(2)
AS

BEGIN
    INSERT INTO Guests (FirstName, LastName, GuestTypeID, Email, PhoneNumber, City)
    VALUES (@FirstName, @LastName, @GuestTypeID, @Email, @PhoneNumber, @City)
END;
GO


-- DDL-29. Create a procedure using THROW 
CREATE PROC spInsertBookings
    @GuestID int,
    @RoomID int,
    @CheckInDate date,
    @CheckOutDate date,
    @PerDayExpense decimal(10, 2)
AS

BEGIN
    IF EXISTS (SELECT * FROM Guests WHERE GuestID = @GuestID)
        INSERT INTO Bookings
        VALUES (@GuestID, @RoomID, @CheckInDate, @CheckOutDate, @PerDayExpense);
    ELSE
        THROW 50001, 'Not a valid Guest', 1;
END;
GO


-- DDL-30. Creates a User-Defined Table Type
CREATE TYPE RoomsWithFacility AS TABLE
(
    RoomID int NOT NULL,
    FacilitySequence int NOT NULL,
    PRIMARY KEY (RoomID, FacilitySequence)
);
GO


-- DDL-31. Create Procedure that accepts a table as a parameter
CREATE PROC spRoomsWithFacility
    @RoomsWithFacility RoomsWithFacility READONLY
AS
    INSERT INTO Room_Facilities
    SELECT * FROM @RoomsWithFacility;
GO


-- DDL-32. Multiple Action Procedure without Transaction and Error Handling
CREATE PROC spSelectInsertUpdateDeleteOutputReturn
    @operation_Type char (1),
    @room_ID int,
    @facility_ID int,
    @facility_Name varchar (50) OUTPUT,
    @total_Count int
AS
BEGIN
    IF @operation_Type = 'S'
    BEGIN
        SELECT * FROM Room_Facilities
    END

    IF @operation_Type = 'I'
    BEGIN
        INSERT INTO Room_Facilities (RoomID, FacilityID)
        VALUES (@room_ID, @facility_ID)
    END

    IF @operation_Type = 'U'
    BEGIN
        UPDATE Room_Facilities
        SET FacilityID = @facility_ID
        WHERE RoomID = @room_ID
    END

    IF @operation_Type = 'D'
    BEGIN
        DELETE FROM Room_Facilities WHERE RoomID = @room_ID
    END

    IF @operation_Type = 'O'
    BEGIN
        SELECT @facility_Name = FacilityName FROM Facilities
        WHERE FacilityID = @facility_ID
    END

    IF @operation_Type = 'R'
    BEGIN
        SELECT @total_Count = COUNT(*) FROM Room_Facilities
        WHERE RoomID = @room_ID
        RETURN @total_Count
    END
END;
GO


-- DDL-33. Procedure with error handling
CREATE PROC spSelectInsertUpdateDeleteWithErrorHandling
    @operation_Type char (1),
    @room_ID int,
    @facility_ID int
AS
BEGIN
    IF @operation_Type = 'S'
    BEGIN
        SELECT * FROM Room_Facilities
    END

    IF @operation_Type = 'I'
    BEGIN
        BEGIN TRY
            INSERT INTO Room_Facilities (RoomID, FacilityID)
            VALUES (@room_ID, @facility_ID)
        END TRY
        BEGIN CATCH
            SELECT ERROR_NUMBER() AS ErNum, ERROR_MESSAGE() AS ErMsg, ERROR_SEVERITY() AS ErSever,
            ERROR_LINE() AS ErLine
        END CATCH        
    END

    IF @operation_Type = 'U'
    BEGIN
        BEGIN TRY
            UPDATE Room_Facilities
            SET FacilityID = @facility_ID
            WHERE RoomID = @room_ID
        END TRY
        BEGIN CATCH
            SELECT ERROR_NUMBER() AS ErNum, ERROR_MESSAGE() AS ErMsg, ERROR_SEVERITY() AS ErSever,
            ERROR_LINE() AS ErLine
        END CATCH        
    END

    IF @operation_Type = 'D'
    BEGIN
        BEGIN TRY
            DELETE FROM Room_Facilities WHERE RoomID = @room_ID
        END TRY
        BEGIN CATCH
            SELECT ERROR_NUMBER() AS ErNum, ERROR_MESSAGE() AS ErMsg, ERROR_SEVERITY() AS ErSever,
            ERROR_LINE() AS ErLine
        END CATCH        
    END
END;
GO


-- DDL-34. Procedure with Transaction
CREATE PROC spSelectInsertUpdateDeleteWithTransaction
    @operation_Type char (1),
    @room_ID int,
    @facility_ID int
AS
BEGIN
    IF @operation_Type = 'S'
    BEGIN
        SELECT * FROM Room_Facilities
    END

    IF @operation_Type = 'I'
    BEGIN
        BEGIN TRY
            BEGIN TRAN
                INSERT INTO Room_Facilities (RoomID, FacilityID)
                VALUES (@room_ID, @facility_ID)
            COMMIT TRAN
        END TRY
        BEGIN CATCH
            ROLLBACK TRAN
        END CATCH        
    END

    IF @operation_Type = 'U'
    BEGIN
        BEGIN TRY
            BEGIN TRAN
                UPDATE Room_Facilities
                SET FacilityID = @facility_ID
                WHERE RoomID = @room_ID
            COMMIT TRAN
        END TRY
        BEGIN CATCH
            ROLLBACK TRAN           
        END CATCH        
    END

    IF @operation_Type = 'D'
    BEGIN
        BEGIN TRY
            BEGIN TRAN
                DELETE FROM Room_Facilities WHERE RoomID = @room_ID
            COMMIT TRAN
        END TRY
        BEGIN CATCH
            ROLLBACK TRAN           
        END CATCH    
    END
END;
GO


-- DDL-35. Multiple Action Procedure with Transaction and Error Handling
CREATE PROC spSelectInsertUpdateDeleteOutputReturnWithTransactionAndError
    @operation_Type char (1),
    @room_ID int,
    @facility_ID int,
    @facility_Name varchar (50) OUTPUT,
    @total_Count int
AS
BEGIN
    IF @operation_Type = 'S'
    BEGIN
        SELECT * FROM Room_Facilities
    END

    IF @operation_Type = 'I'
    BEGIN
        BEGIN TRY
            BEGIN TRAN
                INSERT INTO Room_Facilities (RoomID, FacilityID)
                VALUES (@room_ID, @facility_ID)
            COMMIT TRAN
        END TRY
        BEGIN CATCH
            SELECT ERROR_NUMBER() AS ErNum, ERROR_MESSAGE() AS ErMsg, ERROR_SEVERITY() AS ErSever,
            ERROR_LINE() AS ErLine
            ROLLBACK TRAN
        END CATCH
    END

    IF @operation_Type = 'U'
    BEGIN
        BEGIN TRY
            BEGIN TRAN
                UPDATE Room_Facilities
                SET FacilityID = @facility_ID
                WHERE RoomID = @room_ID
            COMMIT TRAN
        END TRY
        BEGIN CATCH
            SELECT ERROR_NUMBER() AS ErNum, ERROR_MESSAGE() AS ErMsg, ERROR_SEVERITY() AS ErSever,
            ERROR_LINE() AS ErLine
            ROLLBACK TRAN
        END CATCH
    END

    IF @operation_Type = 'D'
    BEGIN
        BEGIN TRY
            BEGIN TRAN
                DELETE FROM Room_Facilities WHERE RoomID = @room_ID
            COMMIT TRAN
        END TRY
        BEGIN CATCH
            SELECT ERROR_NUMBER() AS ErNum, ERROR_MESSAGE() AS ErMsg, ERROR_SEVERITY() AS ErSever,
            ERROR_LINE() AS ErLine
            ROLLBACK TRAN
        END CATCH
    END

    IF @operation_Type = 'O'
    BEGIN
        SELECT @facility_Name = FacilityName FROM Facilities
        WHERE FacilityID = @facility_ID
    END

    IF @operation_Type = 'R'
    BEGIN
        SELECT @total_Count = COUNT(*) FROM Room_Facilities
        WHERE RoomID = @room_ID
        RETURN @total_Count
    END
END;
GO


-- DDL-36. DROP PROCEDURE
DROP PROC spBookingReport;
GO


-- DDL-37. Create Scalar-valued Function
CREATE FUNCTION fnRoomFacilitiesCount
    (@FacilityID int)
    RETURNS int
BEGIN
    RETURN (SELECT COUNT(*) FROM Room_Facilities WHERE FacilityID = @FacilityID)
END;
GO
-----
CREATE FUNCTION fnPaymentTotal()
    RETURNS decimal(10, 2)
BEGIN
    RETURN  (SELECT SUM(DATEDIFF(day, CheckInDate, CheckOutDate) * PerDayExpense) 
            FROM Bookings 
            WHERE DATEDIFF(day, CheckInDate, CheckOutDate) * PerDayExpense > 4000)
END;
GO


-- DDL-38. Create Simple/Inline Table-valued Function
CREATE FUNCTION fnTopGuestsPayment
    (@topTotal int)
    RETURNS TABLE
RETURN
    (SELECT g.FirstName + ' ' + g.LastName AS GuestName, SUM(DATEDIFF(day, b.CheckInDate, b.CheckOutDate) * b.PerDayExpense) AS TotalExpense
    FROM Bookings b JOIN Guests g ON b.GuestID = g.GuestID
    WHERE DATEDIFF(day, b.CheckInDate, b.CheckOutDate) * b.PerDayExpense > 2000
    GROUP BY g.FirstName + ' ' + g.LastName
    HAVING SUM(DATEDIFF(day, b.CheckInDate, b.CheckOutDate) * b.PerDayExpense) > @topTotal);
GO


-- DDL-39. Create Multi-statement Table-valued Function
CREATE FUNCTION fnGuestBookingHistory(@GuestID int)
    RETURNS @GuestBookingHistory TABLE
        (GuestID int, GuestName varchar(50), RoomID int, RoomType varchar(15), CheckInDate date, 
        CheckOutDate date, TotalExpense decimal(10, 2))
AS
BEGIN
    INSERT INTO @GuestBookingHistory
        SELECT  b.GuestID, g.FirstName + ' ' + g.LastName, r.RoomID, rt.RoomTypeName, 
                b.CheckInDate, b.CheckOutDate, DATEDIFF(day, b.CheckInDate, b.CheckOutDate) * b.PerDayExpense 
        FROM Bookings AS b
        JOIN Guests AS g ON b.GuestID = g.GuestID
        JOIN Rooms AS r ON b.RoomID = r.RoomID
        JOIN RoomTypes AS rt ON rt.RoomTypeID = r.RoomTypeID
        WHERE b.GuestID = @GuestID;
    RETURN
END;
GO


-- DDL-40. Create Function With Encryption, Schemabinding and Execute_As_Clause
CREATE FUNCTION fnGuestBookingHistoryEncryptSchemabindExecAsClause
            (@GuestID int)
    RETURNS @GuestBookingHistory TABLE
        (GuestID int, GuestName varchar(50), RoomID int, RoomType varchar(15), CheckInDate date, 
        CheckOutDate date, TotalExpense decimal(10, 2))
    WITH ENCRYPTION, SCHEMABINDING, EXECUTE AS CALLER
AS
BEGIN
    INSERT INTO @GuestBookingHistory
        SELECT  b.GuestID, g.FirstName + ' ' + g.LastName, r.RoomID, 
                rt.RoomTypeName, b.CheckInDate, b.CheckOutDate, 
                CAST(DATEDIFF(day, b.CheckInDate, b.CheckOutDate) * b.PerDayExpense AS decimal(10,2))
        FROM dbo.Bookings AS b
        JOIN dbo.Guests AS g ON b.GuestID = g.GuestID
        JOIN dbo.Rooms AS r ON b.RoomID = r.RoomID
        JOIN dbo.RoomTypes AS rt ON rt.RoomTypeID = r.RoomTypeID
        WHERE b.GuestID = @GuestID;
    RETURN
END;
GO


-- DDL-41. Alter Function
ALTER FUNCTION fnGuestBookingHistory(@GuestID int)
    RETURNS @GuestBookingHistory TABLE
        (GuestID int, GuestName varchar(50), RoomID int, RoomType varchar(15), CheckInDate date, 
        CheckOutDate date, TotalStayingDays int, TotalExpense decimal(10, 2))
AS
BEGIN
    INSERT INTO @GuestBookingHistory
        SELECT  b.GuestID, g.FirstName + ' ' + g.LastName, r.RoomID, 
                rt.RoomTypeName, b.CheckInDate, b.CheckOutDate, 
                DATEDIFF(day, b.CheckInDate, b.CheckOutDate),
                DATEDIFF(day, b.CheckInDate, b.CheckOutDate) * b.PerDayExpense 
        FROM Bookings AS b
        JOIN Guests AS g ON b.GuestID = g.GuestID
        JOIN Rooms AS r ON b.RoomID = r.RoomID
        JOIN RoomTypes AS rt ON rt.RoomTypeID = r.RoomTypeID
        WHERE b.GuestID = @GuestID;
    RETURN
END;
GO


-- DDL-42. DROP Function
DROP FUNCTION fnGuestBookingHistory, fnGuestBookingHistoryEncryptSchemabindExecAsClause;
GO


-- DDL-43. Instead Of Trigger - Raise an error if more than one row is being inserted or updated
CREATE TRIGGER tr_BookingInsertUpdate
    ON Bookings
    INSTEAD OF UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @UpdateCount int = (SELECT COUNT(*) FROM inserted);
    DECLARE @DeleteCount int = (SELECT COUNT(*) FROM deleted);

    IF @UpdateCount>1 OR (@UpdateCount=0 AND @DeleteCount>1)
    BEGIN
        RAISERROR('Security policy: Bulk operation are disabled.', 16, 1);
        ROLLBACK TRANSACTION;
    RETURN
    END

    IF @UpdateCount=1
    BEGIN
        UPDATE Bookings 
        SET CheckInDate = i.CheckInDate, CheckOutDate = i.CheckOutDate,
            PerDayExpense = i.PerDayExpense
        FROM Bookings b 
        JOIN inserted i 
            ON  b.BookingID = i.BookingID 
            AND b.GuestID = i.GuestID
    END

    ELSE IF @DeleteCount=1
    BEGIN
        DELETE FROM Bookings
        FROM Bookings b 
        JOIN deleted d 
            ON b.BookingID = d.BookingID 
            AND b.GuestID = d.GuestID
    END
END;
GO


-- DDL-44. INSTEAD OF Trigger for a View
CREATE TRIGGER trg_AllAction_vu_Shammi_Bookings
    ON vu_Shammi_Bookings
    INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ShammiID INT;    
    SELECT @ShammiID = GuestID FROM Guests WHERE LastName = 'Shammi';

    IF @ShammiID IS NULL
    BEGIN
        RAISERROR ('Operation aborted: Guest "Shammi" is not found in Guests table.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END
    INSERT INTO Bookings (GuestID, RoomID, CheckInDate, CheckOutDate, PerDayExpense)
    SELECT  @ShammiID, RoomID, CheckInDate, CheckOutDate, PerDayExpense
    FROM inserted;
END;
GO


-- DDL-45. ALTER Trigger
ALTER TRIGGER trg_AllAction_vu_Shammi_Bookings
    ON vu_Shammi_Bookings
    INSTEAD OF INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ShammiID INT;
    SELECT @ShammiID = GuestID FROM Guests WHERE LastName = 'Shammi';

    IF @ShammiID IS NULL AND (EXISTS (SELECT 1 FROM inserted))
    BEGIN
        RAISERROR ('Guest "Shammi" does not exist. Operation aborted.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END

    -- If there are rows in 'inserted' but NOT in 'deleted', it's a pure INSERT
    IF EXISTS (SELECT 1 FROM inserted) AND NOT EXISTS (SELECT 1 FROM deleted)
    BEGIN
        INSERT INTO Bookings (GuestID, RoomID, CheckInDate, CheckOutDate, PerDayExpense)
        SELECT @ShammiID, RoomID, CheckInDate, CheckOutDate, PerDayExpense
        FROM inserted;
    END

    -- If rows exist in both 'inserted' and 'deleted', it's an UPDATE
    ELSE IF EXISTS (SELECT 1 FROM inserted) AND EXISTS (SELECT 1 FROM deleted)
    BEGIN
        UPDATE B
        SET B.RoomID = i.RoomID,
            B.CheckInDate = i.CheckInDate,
            B.CheckOutDate = i.CheckOutDate,
            B.PerDayExpense = i.PerDayExpense,
            B.GuestID = @ShammiID
        FROM Bookings B
        INNER JOIN inserted i ON B.BookingID = i.BookingID;
    END

    ELSE IF EXISTS (SELECT 1 FROM deleted) AND NOT EXISTS (SELECT 1 FROM inserted)
    BEGIN
        DELETE B
        FROM Bookings B
        INNER JOIN deleted d ON B.BookingID = d.BookingID;
    END
END;
GO


-- DDL-46. AFTER TRIGGER that shows the reult after an action
CREATE TRIGGER Facilities_Insert_Update
    ON Facilities
    AFTER INSERT, UPDATE
AS
SELECT * FROM inserted;
GO


-- DDL-47. AFTER TRIGGER that archieves deleted data
CREATE TRIGGER BookingS_DELETE
    ON Bookings
    AFTER DELETE
AS
INSERT INTO BookingsArchieve (GuestID, RoomID, CheckInDate, CheckOutDate, PerDayExpense)
    SELECT GuestID, RoomID, CheckInDate, CheckOutDate, PerDayExpense
    FROM deleted;
GO


-- DDL-48. FOR TRIGGER 
CREATE TRIGGER GuestTypes_Insert_Update
    ON GuestTypes
    WITH ENCRYPTION
    FOR INSERT, UPDATE
AS
SELECT * FROM inserted;
GO


-- DDL-49. DROP TRIGGER
DROP TRIGGER tr_BookingInsertUpdate;
GO


-- DDL-50. CREATE LOGIN: Create a new identity on the server
CREATE LOGIN DeveloperUser WITH PASSWORD = 'StrongPassword123!', 
DEFAULT_DATABASE = [HotelManagementDB];


-- DDL-51. ALTER LOGIN: Change the password or rename the login
ALTER LOGIN DeveloperUser WITH PASSWORD = 'NewEvenStrongerPassword456!';
ALTER LOGIN DeveloperUser WITH NAME = SeniorDev;


-- DDL-52. DROP LOGIN: Remove the login from the server
DROP LOGIN SeniorDev;


-- DDL-53. GRANT: Give permission to read and modify the Bookings table
CREATE USER DevUser1 FOR LOGIN DeveloperUser;

GRANT SELECT, INSERT, UPDATE ON Bookings TO DevUser1;


-- DDL-54. REVOKE: Take away the Insert and Update permissions
REVOKE INSERT, UPDATE ON Bookings FROM DevUser1;


-- DDL-55. WITH GRANT OPTION - Granting SELECT with the ability for DevUser1 to give it to others
GRANT SELECT ON Guests TO DevUser1 WITH GRANT OPTION;


-- DDL-56. GRANT OPTION FOR - DevUser1 can still SELECT from Guests, but can no longer GRANT it to anyone else
REVOKE GRANT OPTION FOR SELECT ON Guests FROM DevUser1;