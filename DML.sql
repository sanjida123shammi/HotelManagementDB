USE HotelManagementDB
GO

-- DMl-01. Insert Table Data
INSERT INTO RoomsStatuses (StatusID, StatusName) 
VALUES	(101, 'Available'), 
		(102, 'Occupied'), 
		(103, 'Vacant Dirty'),
		(104, 'Maintenance'), 
		(105, 'Expected Arrival');

INSERT INTO RoomTypes (RoomTypeID, RoomTypeName, RoomsDescription) 
VALUES	(201, 'Standard', 'Standard and small cozy room for one'),
		(202, 'Twin Room', 'An spacious room with two single beds, perfect for friends, colleagues, or children traveling together'),
		(203, 'Connecting Room', 'Two rooms with an interior door, convenient for families or groups preferring easy in-room access'),
		(204, 'Studio', 'An spacious room with one bed, a kitchenette with a small fridge and stove for cooking'),		
		(205, 'Suite', 'Luxury suite with living area'),
		(206, 'Deluxe', 'Large room with a King-sized bed and city view'),	
		(207, 'Penthouse Suite', 'Top-floor rooms with panoramic views, terraces, and bespoke design');

INSERT INTO Facilities (FacilityID, FacilityName) 
VALUES	(301, 'Free WiFi'), 
		(302, 'Mini-fridge'), 
		(303, 'Swimming Pool'), 
		(304, 'Ocean View'), 
		(305, 'Jacuzzi'),
		(306, 'Specialized Workstations'),
		(307, 'Balcony'),
		(308, 'Gym'),
		(309, 'Coffee-maker');

INSERT INTO GuestTypes (GuestTypeID, GuestTypeName)
VALUES	(401, 'Business Traveler'),
		(402, 'Family'),
		(403, 'VIP'),
		(404, 'Group Traveler'),
		(405, 'Budget Traveler'),
		(406, 'Remote Worker');

INSERT INTO Guests (FirstName, LastName, GuestTypeID, Email, PhoneNumber, City) 
VALUES	('John', 'Doe', 401, 'john.doe@email.com', '555-1234', 'RJ'),
		('Jane', 'Smith', 406, 'jane.smith@email.com', '555-5678', NULL),
		('Sabiha', 'Tasnim', 401, 'sabiha.tasnim@gmail.com', '555-9012', NULL),
		('Sanjida', 'Shammi', 406, 'sanjida_shammi@gmail.com', '555-3456', 'DH'),
		('Israt', 'Zahan', 403, 'israt.zahan@email.com', '555-7890', 'CH'),
		('Humayra', 'Anjum', 405, 'humayra_anjum@gmail.com', '555-2345', 'BA'),
		('Abdus', 'Salam', 402, 'abdus.salam@gmail.com', '555-6789', NULL),
		('Shahanaz', 'Parvin', 402, 'shahanaz_parvin@gmail.com', '555-0123', 'DH'),
		('Imran', 'Hossain', 404, 'imran.hossain@gmail.com', '555-4567', 'MY'),
		('Habibur', 'Rahman', 401, 'habibur_rahman@gmail.com', '555-8901', 'SY'),
		('Miraj', 'Hossain', 402, 'miraj_hossain@email.com', '555-2465', NULL),
		('Abdus', 'Sobahan', 404, 'abdus12sobahan@email.com', '555-3567', NULL),
		('Ayesha', 'Akter', 401, 'ayesha_akter@gmail.com', '555-4678', 'BA'),
		('Arnob', 'Shikdar', 401, 'arnob_Shikdar@gmail.com', '555-5789', NULL),
		('Tawhid', 'Rahman', 403, 'tawhid.rahmann@email.com', '555-6890', NULL),
		('Farhan', 'Hossain', 406, 'farhan_hossain@gmail.com', '555-7901', 'KH'),
		('Muskan', 'Afrin', 405, 'afrin.muskan@gmail.com', '555-8012', 'SY'),
		('Swadhin', 'Shikdar', 402, 'swadhin_shikdar@gmail.com', '555-9123', NULL),
		('Nurunnahar', 'Runa', 404, 'nurunnahar.runa@gmail.com', '555-0234', NULL),
		('Munira', 'Akter', 402, 'munira_akter@gmail.com', '555-1345', 'KH');

INSERT INTO Rooms (RoomID, RoomNumber, RoomTypeID, StatusID) 
VALUES	(601, '1001', 201, 101),
		(602, '1002', 203, 101),
		(603, '1003', 204, 102),
		(604, '2001', 202, 103),
		(605, '2002', 203, 105),
		(606, '2003', 204, 104),
		(607, '3001', 201, 105),
		(608, '3002', 202, 101),
		(609, '3003', 203, 102),
		(610, '4001', 205, 102),
		(611, '4002', 206, 103),
		(612, '5001', 205, 105),
		(613, '5002', 206, 104),
		(614, '6001', 207, 105),
		(615, '7001', 207, 101),
		(616, '8001', 207, 102),
		(617, '9001', 207, 103),
		(618, '10001', 206, 10);

INSERT INTO Room_Facilities (RoomID, FacilityID) 
VALUES	(601, 301), (601, 302), -- Room 1001 has WiFi and Mini-fridge
		(602, 302), (602, 304), -- Room 1002 has Mini-fridge and Ocean View
		(603, 301), (603, 307), -- Room 1003 has WiFi and Balcony
		(604, 302), (604, 307), -- Room 2001 has Mini-fridge and Balcony
		(605, 302), (605, 304), (605, 307), -- Room 2002 has Mini-fridge, Ocean View and Balcony
		(606, 301), (606, 302), -- Room 2003 has WiFi and Mini-fridge
		(607, 304), (607, 307), -- Room 3001 has Ocean View and Balcony
		(608, 302), (608, 308), -- Room 3002 has Mini-fridge and Gym
		(609, 301), (609, 302), -- Room 3003 has WiFi and Mini-fridge
		(610, 301), (610, 303), (610, 304), -- Room 4001 (Suite) has WiFi, Swimming pool and Ocean view
		(611, 301), (611, 305), (611, 306), -- Room 4002 (Delux) has WiFi, Jacuzzi and Specialized workstations
		(612, 303), (612, 304), (612, 308), -- Room 5001 (Suite) has Swimming pool, Ocean view and Gym
		(613, 301), (613, 306), (613, 307), -- Room 5002 (Delux) has WiFi, Specialized workstations, and Balcony
		(614, 302), (614, 303), (614, 307), (614, 308), -- Room 6001 (Penthouse) has Mini-fridge, Swimming pool, Balcony and Gym
		(615, 302), (615, 304), (615, 305), (615, 308), -- Room 7001 (Penthouse) has Mini-fridge, Ocean view, Jacuzzi and Gym
		(616, 301), (616, 302), (616, 306), (616, 308), -- Room 8001 (Penthouse) has WiFi, Mini-fridge, Specialized workstations and Gym
		(617, 303), (617, 304), (617, 306), (617, 307),(617, 308); -- Room 9001 (Penthouse) has Swimming pool, Ocean View, Specialized workstations, Balcony and Gym

INSERT INTO Bookings (GuestID, RoomID, CheckInDate, CheckOutDate, PerDayExpense)
VALUES	
		-- Late Winter Off-Season (Lower Prices)
		(501, 611, '2026-02-01', '2026-02-05', 135.00), 
		(505, 612, '2026-02-15', '2026-02-17', 190.00), 
		(502, 601, '2026-03-20', '2026-03-22', 75.00), 
		(503, 602, '2026-03-21', '2026-03-25', 100.00), 
		(504, 603, '2026-03-22', '2026-03-28', 120.00), 
		(506, 604, '2026-03-24', '2026-03-26', 85.00), 
		(507, 605, '2026-03-25', '2026-03-30', 105.00), 
		(508, 606, '2026-03-28', '2026-04-02', 125.00),
		-- Spring Peak (Prices Rising)
		(509, 607, '2026-04-01', '2026-04-03', 95.00),  
		(510, 608, '2026-04-02', '2026-04-05', 115.00), 
		(511, 609, '2026-04-05', '2026-04-10', 125.00), 
		(512, 610, '2026-04-06', '2026-04-08', 270.00), 
		(513, 613, '2026-04-10', '2026-04-15', 195.00), 
		(514, 614, '2026-04-12', '2026-04-14', 480.00), 
		(515, 615, '2026-04-15', '2026-04-20', 520.00), 
		(516, 616, '2026-04-18', '2026-04-22', 495.00), 
		(517, 617, '2026-04-20', '2026-04-21', 580.00), 
		(518, 601, '2026-04-22', '2026-04-25', 90.00),  
		(519, 604, '2026-04-25', '2026-04-28', 110.00), 
		(520, 611, '2026-04-28', '2026-05-02', 210.00), 
		-- May/June: High Business Activity
		(501, 610, '2026-05-01', '2026-05-05', 280.00), 
		(505, 617, '2026-05-05', '2026-05-10', 600.00), 
		(502, 608, '2026-05-12', '2026-05-15', 120.00), 
		(509, 614, '2026-05-20', '2026-05-22', 480.00), 
		(504, 613, '2026-05-25', '2026-05-30', 200.00),
		(505, 602, '2026-06-01', '2026-06-04', 115.00), 
		(507, 616, '2026-06-05', '2026-06-07', 500.00), 
	    (508, 605, '2026-06-10', '2026-06-14', 130.00), 
	    (501, 611, '2026-06-15', '2026-06-20', 220.00), 
		(510, 603, '2026-06-22', '2026-06-25', 145.00), 
	    -- Summer Travel Season
		(511, 604, '2026-07-01', '2026-07-05', 105.00), 
	    (506, 607, '2026-07-04', '2026-07-06', 95.00),  
		(513, 615, '2026-07-10', '2026-07-12', 540.00), 
	    (514, 609, '2026-07-15', '2026-07-20', 130.00), 
		(515, 601, '2026-07-22', '2026-07-23', 95.00),  
	    (516, 612, '2026-08-01', '2026-08-10', 290.00), 
		(517, 606, '2026-08-12', '2026-08-15', 145.00), 
		(518, 610, '2026-08-18', '2026-08-22', 285.00), 
	    (519, 602, '2026-08-25', '2026-08-28', 125.00), 
		(520, 617, '2026-09-01', '2026-09-05', 650.00),
		-- September: End of Summer / Business Peak
		(501, 617, '2026-09-10', '2026-09-15', 620.00), 
		(504, 614, '2026-09-12', '2026-09-14', 495.00),
		(520, 611, '2026-09-18', '2026-09-20', 210.00),   
		-- October: Regular Mid-Season
		(501, 608, '2026-10-01', '2026-10-05', 100.00), 
		(503, 602, '2026-10-03', '2026-10-06', 110.00), 
		(505, 615, '2026-10-05', '2026-10-10', 500.00), 
		(508, 603, '2026-10-12', '2026-10-15', 130.00), 
		(510, 609, '2026-10-15', '2026-10-18', 115.00), 
		(515, 612, '2026-10-20', '2026-10-25', 200.00), 
		(517, 601, '2026-10-22', '2026-10-24', 80.00),     
		-- November: Off-Season Discounts (Great for Groups/Remote Workers)
		(519, 613, '2026-11-02', '2026-11-05', 145.00), 
		(516, 604, '2026-11-05', '2026-11-07', 75.00),  
		(501, 607, '2026-11-10', '2026-11-12', 65.00),  
		(513, 616, '2026-11-15', '2026-11-20', 400.00), 
		(506, 605, '2026-11-18', '2026-11-22', 90.00),  
		(509, 610, '2026-11-25', '2026-11-28', 190.00),     
		-- December: Holiday Season (Surge Pricing / VIP Stays)
		(505, 617, '2026-12-20', '2026-12-26', 750.00),
		(514, 616, '2026-12-22', '2026-12-27', 680.00),
		(501, 615, '2026-12-24', '2026-12-28', 700.00),
		(504, 612, '2026-12-28', '2027-01-02', 350.00),
		(520, 614, '2026-12-30', '2027-01-03', 600.00),
		(511, 611, '2026-12-31', '2027-01-05', 280.00),
		-- Early 2027: New Year "Refresh" Bookings
		(501, 601, '2027-01-10', '2027-01-12', 70.00),  
		(515, 602, '2027-01-15', '2027-01-18', 95.00),  
		(516, 603, '2027-01-20', '2027-01-25', 110.00), 
		(518, 604, '2027-02-01', '2027-02-04', 85.00),  
		(510, 606, '2027-02-05', '2027-02-08', 120.00), 
		(501, 609, '2027-02-12', '2027-02-14', 105.00), 
		(508, 607, '2027-02-15', '2027-02-17', 80.00),  
		(505, 610, '2027-02-20', '2027-02-24', 210.00);
		

-- DMl-02. Update Table Data
UPDATE Rooms SET StatusID = 103
WHERE RoomID = 609;


-- DMl-03. Update Multiple Rows of a column to Different Values
UPDATE Guests 
SET City = CASE GuestID
	WHEN 502 THEN 'KH'
	WHEN 503 THEN 'DH'
	WHEN 507 THEN 'MY'
	WHEN 511 THEN 'RA'
	WHEN 512 THEN 'BA'
	WHEN 514 THEN 'RJ'
	WHEN 515 THEN 'SY'
	WHEN 518 THEN 'KH'
	WHEN 519 THEN 'MY'
END
WHERE GuestID IN (502, 503, 507, 511, 512, 514, 515, 518, 519);


-- DMl-04. Delete Table Data
DELETE FROM Facilities WHERE FacilityID = 309;


-- DMl-05. Retrieve last 5 of those Booking histories whose per day expense is more than 200
SELECT TOP 5 * FROM Bookings
WHERE PerDayExpense > 200
ORDER BY BookingID DESC;


-- DMl-06. Retrieve those Bookings whose Check in date is later than 01/06/2026 or before than 31/07/2026 and per day expense is greater than 80
SELECT * FROM Bookings 
WHERE CheckInDate > '2026-06-01' 
	OR CheckInDate < '2026-07-31'
	AND PerDayExpense > 150;


-- DMl-07. Retrieve those bookings whose guests City are all except 'RJ', 'KH', 'SY' and Check out date is later than 01/05/2026
SELECT bk.BookingID, bk.CheckOutDate, bk.GuestID, gt.City, bk.PerDayExpense
FROM Bookings AS bk
JOIN Guests AS gt ON bk.GuestID = gt.GuestID
WHERE gt.City NOT IN ('RJ, KH', 'SY')
	AND bk.CheckOutDate > '2026-05-01';


-- DMl-08. Retrieve bookings from 01/03/2026 to 30/04/2026
SELECT * FROM Bookings
WHERE CheckInDate BETWEEN '2026-04-01' AND '2026-04-30';


-- DMl-09. Retrieve those guests whose email ends with '@email.com'
SELECT * FROM Guests
WHERE Email LIKE '%@email.com';


-- DMl-10. Find all guests whose phone number starts with '555-' and the next digit is one of 0 through 5
SELECT * FROM Guests
WHERE PhoneNumber LIKE '555-[0-5]%';


-- DMl-11.	Find all guests whose phone number starts with '555-' and the next digit is not in 0 through 5
SELECT * FROM Guests
WHERE PhoneNumber LIKE '555-[^0-5]%';


-- DMl-12.	Retrieve 11 through 20 records of Bookings
SELECT * FROM Bookings
ORDER BY BookingID
OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY;


-- DMl-13.	Write a group query to retrieve bookings those average of per day expense is more than 250
SELECT GuestID, AVG(PerDayExpense) AS AverageExpense
FROM Bookings
GROUP BY GuestID
HAVING AVG(PerDayExpense) > 250;


-- DMl-14. CUBE Operator
SELECT GuestID, RoomID, SUM(PerDayExpense) AS TotalExpense 
FROM Bookings
GROUP BY CUBE (GuestID, RoomID);


-- DMl-15. ROLLUP Operator
SELECT GuestID, RoomID, SUM(PerDayExpense) AS TotalExpense 
FROM Bookings
GROUP BY ROLLUP (GuestID, RoomID);


-- DMl-16. GROUPING SETS Operator
SELECT GuestID, RoomID, SUM(PerDayExpense) AS TotalExpense 
FROM Bookings
GROUP BY GROUPING SETS ((GuestID), (RoomID), ())
ORDER BY GuestID, RoomID;


-- DMl-17. OVER Clause
SELECT GuestID, RoomID, PerDayExpense, SUM(PerDayExpense) OVER() TotalExpense,
		AVG(PerDayExpense) OVER(PARTITION BY RoomID) AS RoomAverage
FROM Bookings;


-- DMl-18. Non-correlated Subquery
SELECT GuestID, FirstName + ' ' + LastName as "Guest Name", Email, PhoneNumber 
FROM Guests
WHERE GuestID IN
(SELECT DISTINCT GuestID FROM Bookings);


-- DML-19. Correlated Subquery
SELECT GuestID, PerDayExpense FROM Bookings main_b
WHERE PerDayExpense >
(SELECT AVG(PerDayExpense) FROM Bookings sub_b
WHERE main_b.GuestID = sub_b.GuestID);


-- DML-20. ANY - Logical operator 
SELECT BookingID, GuestID, PerDayExpense FROM Bookings
WHERE PerDayExpense > ANY
(SELECT PerDayExpense FROM Bookings);


-- DML-21. ALL - Logical operator 
SELECT GuestID, PerDayExpense FROM Bookings
WHERE PerDayExpense > ALL
(SELECT AVG(PerDayExpense) FROM Bookings);


-- DML-22. SOME - Logical operator 
SELECT GuestID, PerDayExpense FROM Bookings
WHERE PerDayExpense > SOME
(SELECT PerDayExpense FROM Bookings);


-- DML-23. EXISTS - Boolean or Logical operator
SELECT DISTINCT FirstName + ' ' + LastName AS [Guest's Name]
FROM Guests AS g
WHERE EXISTS 
(SELECT * FROM Bookings AS b
WHERE	PerDayExpense > 150
	AND b.GuestID = g.GuestID);


-- DML-24. CTE - Common Table Expression
WITH GuestHistory 
AS 
(
	SELECT	b.GuestID, [Guest's Name] = g.FirstName + ' ' + g.LastName, r.RoomNumber, 
			rt.RoomTypeName, SUM(b.PerDayExpense) TotalExpense
	FROM Bookings b
	JOIN Guests g 
		ON b.GuestID = g.GuestID
	JOIN Rooms r
		ON b.RoomID = r.RoomID
	JOIN RoomTypes rt
		ON r.RoomTypeID = rt.RoomTypeID
	GROUP BY  b.GuestID, g.FirstName + ' ' + g.LastName, r.RoomNumber, rt.RoomTypeName
		HAVING SUM(b.PerDayExpense) > 125
),
SecondGuestTable AS
(
	SELECT GuestID, MAX(TotalExpense) AS MaximumExpense 
	FROM GuestHistory 
	GROUP BY GuestID
)
SELECT  gh.GuestID, gh.[Guest's Name], gh.RoomNumber, 
		gh.RoomTypeName, gh.TotalExpense, sgh.MaximumExpense
FROM GuestHistory AS gh 
JOIN SecondGuestTable AS sgh
	ON gh.GuestID = sgh.GuestID;


-- DML-25. CASE Function
SELECT	r.RoomID, r.RoomNumber, r.StatusID,
		CASE r.StatusID
			WHEN 101 THEN 'Available'
			WHEN 102 THEN 'Occupied'
			WHEN 103 THEN 'Vacant Dirty'
			WHEN 104 THEN 'Maintenance'
			WHEN 105 THEN 'Expected Arrival'
		END RoomStatus
FROM Rooms r
ORDER BY r.StatusID;


-- DML-26. SEARCH CASE Function
SELECT	BookingID, GuestID, RoomID, PerDayExpense, 
		CASE 
			WHEN PerDayExpense > 400 THEN 'Expensive'
			WHEN PerDayExpense < 150 THEN 'Budget-friendly'
			ELSE 'Reasonable'
		END AS RoomPriceStatus
FROM Bookings
ORDER BY PerDayExpense;


-- DML-27. IIF Function
SELECT	RoomID, PerDayExpense,
		IIF(PerDayExpense > 380, 'Expensive', 'Budget-friendly')
		AS RoomPriceStatus
FROM Bookings
ORDER BY PerDayExpense;


-- DML-28. CHOOSE Function
SELECT	RoomID, FacilityID,
		CHOOSE	(FacilityID - 300, 'Free WiFi', 'Mini-fridge', 'Swimming Pool', 'Ocean View', 
				'Jacuzzi', 'Specialized Workstations', 'Balcony', 'Gym', 'Coffee-maker')
		AS Facilities
FROM Room_Facilities;


-- DML-29. COALESCE Function
SELECT	GuestID, FirstName + ' ' + LastName AS GuestName, City,
		COALESCE (City, 'No City')
		AS NewCity
FROM Guests;


-- DML-30. ISNULL Function
SELECT	GuestID, FirstName + ' ' + LastName AS GuestName, City,
		ISNULL (City, 'No City')  -- The output will show 'No' only. Because it works with the mentioned columns datatype.
		AS NewCity
FROM Guests;


-- DML-31. GROUPING Function
SELECT 
	CASE
		WHEN GROUPING(Email) = 1 THEN 'ALL'
		ELSE Email
	END Email,
	CASE
		WHEN GROUPING(City) = 1 THEN 'ALL'
		ELSE City
	END City,
	COUNT(*) AS GuestCounting
FROM Guests
WHERE City IN ('DH', 'RJ', 'KH')
GROUP BY City, Email WITH ROLLUP
ORDER BY City, Email;


-- DML-32. ROW_NUMBER - Ranking Function
SELECT	ROW_NUMBER() OVER(PARTITION BY City ORDER BY City) AS CityRows,
		GuestID, FirstName + ' ' + LastName, City
FROM Guests;


-- DML-33. RANK, DENSE_RANK - Ranking Function
SELECT	RANK() OVER(ORDER BY PerDayExpense) AS ExpoenseRank,
		DENSE_RANK() OVER(ORDER BY PerDayExpense) AS ExpoenseDenseRank,
		BookingID, GuestID, PerDayExpense
FROM Bookings;


-- DML-34. NTILE - Ranking Function
SELECT	FacilityID, FacilityName,
		NTILE(2) OVER(ORDER BY FacilityID) TwoFacilityGroups,
		NTILE(3) OVER(ORDER BY FacilityID) ThreeFacilityGroups,
		NTILE(4) OVER(ORDER BY FacilityID) FourFacilityGroups,
		NTILE(5) OVER(ORDER BY FacilityID) FiveFacilityGroups,
		NTILE(6) OVER(ORDER BY FacilityID) SixFacilityGroups,
		NTILE(7) OVER(ORDER BY FacilityID) SevenFacilityGroups
FROM Facilities;


-- DML-35. FIRST_VALUE - Analytic Function
SELECT	BookingID, GuestID, CheckInDate, PerDayExpense,
		FIRST_VALUE(PerDayExpense) OVER(PARTITION BY GuestID ORDER BY GuestID)
		AS "Guest's First Expense"
FROM Bookings;


-- DML-36. LAST_VALUE - Analytic Function
SELECT	BookingID, GuestID, CheckInDate, PerDayExpense,
		LAST_VALUE(PerDayExpense) OVER(PARTITION BY GuestID ORDER BY GuestID)
		AS "Guest's Last Expense"
FROM Bookings;


-- DML-37. LEAD - Analytic Function
SELECT	BookingID, GuestID, CheckInDate, PerDayExpense,
		LEAD(PerDayExpense) OVER(PARTITION BY GuestID ORDER BY GuestID)
		AS "Guest's Upcoming Expense"
FROM Bookings;


-- DML-38. LAG - Analytic Function
SELECT	BookingID, GuestID, CheckInDate, PerDayExpense,
		LAG(PerDayExpense) OVER(PARTITION BY GuestID ORDER BY GuestID)
		AS "Guest's Previous Expense"
FROM Bookings;


-- DML-39. PERCENT_RANK - Analytic Function
SELECT	BookingID, GuestID, CheckInDate, PerDayExpense,
		PERCENT_RANK() OVER(PARTITION BY GuestID ORDER BY PerDayExpense)
		AS "Guest's Percent Ranking"
FROM Bookings;


-- DML-40. CUME_DIST - Analytic Function
SELECT	BookingID, GuestID, CheckInDate, PerDayExpense,
		CUME_DIST() OVER(PARTITION BY GuestID ORDER BY PerDayExpense)
		AS "Guest's Cumulative Distribution"
FROM Bookings;


-- DML-41. PERCENTILE_CONT - Analytic Function
SELECT	BookingID, GuestID, RoomID, PerDayExpense,
		PERCENTILE_CONT(0.5) WITHIN GROUP(ORDER BY PerDayExpense DESC)
		OVER(PARTITION BY RoomID )
		AS "Continuous Distribution Percentage"
FROM Bookings;


-- DML-42. PERCENTILE_DISC - Analytic Function
SELECT	BookingID, GuestID, RoomID, PerDayExpense,
		PERCENTILE_DISC(0.5) WITHIN GROUP(ORDER BY PerDayExpense DESC)
		OVER(PARTITION BY RoomID )
		AS "Discrete Percentage"
FROM Bookings;


-- DML-43. DATEDIFF, GETDATE, DATEADD - Difference and Addition System Functions
SELECT	DATEDIFF(DAY, '2026-01-01', '2026-01-31') AS DateDifferenceInDay,
		DATEDIFF(MONTH, '2026-01-01', '2026-03-01') AS DateDifferenceInMonth,
		DATEDIFF(YEAR, '2025-01-01', '2026-01-01') AS DateDifferenceInYear, 
		DATEADD(month, 3, '2026-03-20') NewDate,
		GETDATE() AS CurrentDate;


-- DML-44. DATEPART, DATENAME, DAY, MONTH, YEAR - Extraction System Functions
SELECT	DATEPART(weekday, '2026-03-20') WeekDayInNumber,
		DATENAME(month, '2026-03-20') MonthName,
		DATENAME(weekday, '2026-03-20') MonthName,
		DAY('2026-03-20') DayNumber,
		Month('2026-03-20') MonthNumber,
		Year('2026-03-20') Year;


-- DML-45. ISDATE - Validation Function
SELECT	ISDATE('2026-02-29') ValidDate1,
		ISDATE('2026-03-29') ValidDate2;


-- DML-46. SELECT INTO Clause
SELECT * INTO BookingsCopy
FROM Bookings
WHERE	DATEDIFF(DAY, CheckInDate, CheckOutDate) > 2
	AND PerDayExpense > 100;


-- DML-47. MERGE
MERGE BookingsArchieve ba
USING BookingsCopy bc
	ON ba.BookingID = bc.BookingID
WHEN MATCHED THEN
	UPDATE 
	SET	ba.PerDayExpense = bc.PerDayExpense
WHEN NOT MATCHED THEN
	INSERT (GuestID, RoomID, CheckInDate, CheckOutDate, PerDayExpense)
	VALUES (bc.GuestID, bc.RoomID, bc.CheckInDate, bc.CheckOutDate, bc.PerDayExpense)
WHEN NOT MATCHED BY SOURCE THEN
	DELETE;


-- DML-48. Compound Join (An inner join with two conditions)
SELECT b.BookingID, b.CheckInDate, b.PerDayExpense, ba.PerDayExpense
FROM Bookings AS b 
JOIN BookingsArchieve AS ba
	ON	(b.BookingID = ba.BookingID) 
	AND	(b.PerDayExpense > ba.PerDayExpense)
ORDER BY CheckInDate;


-- DML-49. Self-Join
SELECT DISTINCT G1.GuestID, G1.City, G1.PhoneNumber 
FROM Guests AS G1 
JOIN Guests AS G2
	ON	(G1.City = G2.City)  
	AND	(G1.GuestID <> G2.GuestID)
ORDER BY G1.City;


-- DML-50. A SELECT statement that Joins four table
SELECT  b.BookingID, g.GuestID, g.FirstName + ' ' + g.LastName AS [Guest's Name], g.PhoneNumber, 
            gt.GuestTypeName AS GuestType, r.RoomNumber, b.CheckInDate, b.CheckOutDate, b.PerDayExpense,
            DATEDIFF(day, b.CheckInDate, b.CheckOutDate) AS TotalDays, 
            (DATEDIFF(day, b.CheckInDate, b.CheckOutDate) * b.PerDayExpense) AS TotalExpense
    FROM dbo.Bookings b
    JOIN dbo.Guests g 
        ON b.GuestID = g.GuestID
    JOIN dbo.GuestTypes gt
        ON gt.GuestTypeID = g.GuestTypeID
    JOIN dbo.Rooms r
        ON r.RoomID = b.RoomID
WHERE (DATEDIFF(day, b.CheckInDate, b.CheckOutDate) * b.PerDayExpense) > 3500;


-- DML-51. A left outer join
SELECT Email, b.GuestID, LastName FROM Guests g
LEFT JOIN Bookings b
	ON g.GuestID = b.GuestID;


-- DML-52. A right outer join
SELECT Email, b.GuestID, LastName FROM Guests g
RIGHT JOIN Bookings b
	ON g.GuestID = b.GuestID;


-- DML-53. A full outer join
SELECT Email, b.GuestID, g.GuestID, LastName FROM Guests g
FULL JOIN Bookings b
	ON g.GuestID = b.GuestID;


-- DML-54. A SELECT statement that combines an outer and inner join
SELECT  g.GuestID, g.FirstName + ' ' + g.LastName GuestName, r.RoomNumber, b.CheckInDate 
FROM Bookings b
JOIN Guests g
	ON b.GuestID = g.GuestID
LEFT JOIN Rooms r
	ON b.RoomID = r.RoomID
ORDER BY CheckInDate;


-- DML-55. CROSS Join
SELECT TOP 10 PERCENT	
	b.CheckInDate, g.GuestID, 
	g.FirstName + ' ' + g.LastName GuestName 
FROM Bookings b
	CROSS JOIN Guests g
ORDER BY g.GuestID;


-- DML-56. UNION operation
	SELECT BookingID, CheckInDate, PerDayExpense FROM Bookings
	WHERE CheckInDate >= '2026-12-01'
UNION
	SELECT BookingID, CheckInDate, PerDayExpense FROM BookingsArchieve
	WHERE CheckInDate >= '2026-08-01'
ORDER BY CheckInDate;


-- DML-57. EXCEPT operation
	SELECT GuestID
	FROM Guests
	WHERE City IS NOT NULL
EXCEPT
	SELECT GuestID
	FROM Bookings
	WHERE PerDayExpense IS NULL;


-- DML-58. INTERSECT operation
	SELECT GuestID
	FROM Bookings
	WHERE PerDayExpense > 500
INTERSECT
	SELECT GuestID
	FROM Bookings
	WHERE CheckInDate >= '2026-11-01';


-- DML-59. Use @@IDENTITY and @@ROWCOUNT
DECLARE @MyIdentity int, @MyRowCount int;

INSERT INTO Guests (FirstName, LastName, GuestTypeID, Email, PhoneNumber, City)
VALUES ('Nishat', 'Sharmeen', 403, 'nishat_sharmeen@gmail.com', '555-6380', 'DH')

SET @MyIdentity=@@IDENTITY
SET @MyRowCount=@@ROWCOUNT

IF @MyRowCount=1
INSERT INTO Bookings
VALUES (@MyIdentity, 617, '2027-03-26', '2027-03-31', 650.00);
---------
SELECT * FROM Guests WHERE FirstName = 'Nishat';
SELECT * FROM Bookings WHERE GuestID = 524;


-- DML-60. TRY......CATCH
BEGIN TRY
	INSERT INTO RoomsStatuses VALUES (103, 'Clean')
	PRINT 'Success: Record saved susseccfully'
END TRY
BEGIN CATCH
	SELECT	ERROR_NUMBER() AS ErNo, ERROR_MESSAGE() AS ErMessage, 
			ERROR_LINE() As line, ERROR_SEVERITY() AS Severity,
			ERROR_STATE() AS Erstate
END CATCH;


-- DML-61. Transaction using @@IDENTITY, @@ROWCOUNT
BEGIN
	BEGIN TRY
		BEGIN TRAN
			DECLARE @myIdentity int, @myRowcount int;
			INSERT INTO	Guests (FirstName, LastName, GuestTypeID, Email, PhoneNumber, City)
			VALUES ('Sadia', 'Afrin', 401, 'sadia_afrin@email.com', '555-3145', NULL)

			SET @myIdentity=@@IDENTITY
			SET @myRowcount=@@ROWCOUNT

			if @myRowcount=1
				INSERT INTO Bookings (GuestID, RoomID, CheckInDate, CheckOutDate, PerDayExpense)
				VALUES	(@myIdentity, 614, '2027-02-20', '2027-02-23', 580.00),
						(@myIdentity, 612, '2027-03-03', '2027-03-08', 385.00)
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		ROLLBACK TRAN
	END CATCH
END;
---
SELECT * FROM Guests WHERE FirstName = 'Sadia';
SELECT * FROM Bookings WHERE GuestID = 521;
GO


-- DML-62. Using Transaction with Error Handling
BEGIN
	BEGIN TRY
		BEGIN TRAN
			DECLARE @myIdentity int, @myRowcount int;
			INSERT INTO	Guests (FirstName, LastName, GuestTypeID, Email, PhoneNumber, City)
			VALUES ('Nusrat', 'Alam Nizum', 402, 'nusrat.alam.nizum@email.com', '555-6745', NULL)

			SET @myIdentity=@@IDENTITY
			SET @myRowcount=@@ROWCOUNT

			if @myRowcount=1
				INSERT INTO Bookings (GuestID, RoomID, CheckInDate, CheckOutDate, PerDayExpense)
				VALUES	(@myIdentity, 614, '2027-03-10', '2027-03-14', 550.00),
						(@myIdentity, 612, '2027-03-23', '2027-03-28', 400.00)
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		SELECT ERROR_MESSAGE() AS msg, ERROR_NUMBER() AS ErNo, ERROR_LINE() AS ErLine, ERROR_SEVERITY() AS SEVERITY
		ROLLBACK TRAN
	END CATCH
END;
---
SELECT * FROM Guests WHERE FirstName = 'Nusrat';
SELECT * FROM Bookings WHERE GuestID = 524;
GO


-- DML-63. Justify VIEW
SELECT * FROM vu_BookingInfos;
EXEC sp_helptext vu_BookingInfos;
EXEC sp_helptext vu_BookingInfosEncrypt;
-- DROP TABLE Bookings;
EXEC sp_helptext vu_BookingInfosEncryptAndSchemabind;
SELECT * FROM vu_BookingInfosEncryptAndSchemabind;


-- DML-64. Getting Next Value For a Sequence
INSERT INTO SequenceTable
VALUES	(NEXT VALUE FOR TestSequence2, 'First inserted row');

INSERT INTO SequenceTable
VALUES	(NEXT VALUE FOR TestSequence2, 'Second inserted row');

INSERT INTO SequenceTable
VALUES	(NEXT VALUE FOR TestSequence2, 'Third inserted row after Alter'),
		(NEXT VALUE FOR TestSequence2, 'Fourth inserted row after Alter');


-- DML-65. Getting Current Value of the Sequence
SELECT current_value 
FROM sys.sequences 
WHERE name = 'TestSequence2';


-- DML-66. CURSOR
DECLARE @varBookingID int, @varPaymentTotal money, @UpdateCount int;
SET @UpdateCount = 0;

DECLARE booking_inv_Cursor CURSOR
FOR
	SELECT	BookingID,
			DATEDIFF(day, CheckInDate, CheckOutDate) * PerDayExpense AS PaymentTotal 
	FROM	Bookings
	WHERE	DATEDIFF(day, CheckInDate, CheckOutDate) * PerDayExpense > 500;

OPEN booking_inv_Cursor;

FETCH NEXT FROM booking_inv_Cursor INTO @varBookingID, @varPaymentTotal;
WHILE @@FETCH_STATUS <> -1
	BEGIN
		IF @varPaymentTotal > 2000
		BEGIN
			UPDATE Bookings
			SET PerDayExpense = PerDayExpense + 10;
			SET @UpdateCount = @UpdateCount + 1;
		END;
		FETCH NEXT FROM booking_inv_Cursor INTO @varBookingID, @varPaymentTotal;
	END;

CLOSE booking_inv_Cursor;
DEALLOCATE booking_inv_Cursor;

PRINT ''
PRINT CONVERT(varchar, @UpdateCount) + ' rows updated';


-- DML-67. INSERT through the View Without and With Check Option
INSERT INTO vu_Shammi_Bookings (GuestID, RoomID, CheckInDate, CheckOutDate, PerDayExpense)
VALUES (507, 611, '2027-03-02', '2027-03-10', 350.00);

INSERT INTO vu_Shammi_Bookings_With_Check (GuestID, RoomID, CheckInDate, CheckOutDate, PerDayExpense)
VALUES (505, 612, '2027-02-25', '2027-03-01', 300.00);


-- DML-68. Update through View
UPDATE vu_Shammi_Bookings
SET PerDayExpense = 275.00
WHERE BookingID = 5;


-- DML-69. Delete through View
DELETE FROM vu_Shammi_Bookings
WHERE BookingID = 60;


-- DML-70. Catalog View
SELECT  sys.tables.name AS TableName,
        sys.schemas.name AS SchemaName
FROM sys.tables 
INNER JOIN sys.schemas
    ON sys.tables.schema_id = sys.schemas.schema_id;
GO


-- DML-71. Justify PROCEDURE - WITH ENCRYPTION and RECOMPILE
spBookingReport;
EXEC spBookingReport;
EXECUTE spBookingReport;

-- WITH ENCRYPTION and RECOMPILE --
EXEC sp_helptext spBookingsCopy;
EXEC spBookingsCopy2;
EXEC spBookingsCopy3;
EXEC sp_helptext spBookingsCopy3;


-- DML-72. Justification of Procedure With Required and Optional Parameter 
DECLARE @Total money;
EXEC spBookingInvoiceTotal '2026-11-02', @Total OUTPUT
SELECT @Total AS BookingInvTotal;

-- Optional Parameter --
DECLARE @TotalInv money
EXEC spBookingInvoiceTotal2 '', @TotalInv OUTPUT
SELECT @TotalInv AS BookingInvTotal;


-- DML-73. Justify Insert Procedure By Position and By Name and Using Throw
EXEC spAddGuest 'Mohiuddin', 'Rakib', '403', 'mohiuddin_rakib@gmail.com', '555-1985', NULL;
SELECT * FROM Guests;
EXEC spAddGuest	@FirstName = 'Shafikul', @LastName = 'Islam', @GuestTypeID = 406,
				@Email = 'shafikul.islam@email.com', @PhoneNumber = '555-4395', @City = 'BA';

-- Throw --
EXEC spInsertBookings 550, 613, '2027-02-20', '2026-02-27', 150.00;


-- DML-74. Justify Procedure that accepts a table as a parameter
DECLARE @RoomsWithFacility RoomsWithFacility
INSERT INTO @RoomsWithFacility 
VALUES (606, 304);
INSERT INTO @RoomsWithFacility 
VALUES (606, 307);
INSERT INTO @RoomsWithFacility 
VALUES (606, 309);
EXEC spRoomsWithFacility @RoomsWithFacility

SELECT * FROM Room_Facilities;


-- DML-75. Justification of  Multiple Action procedure with and without transaction and Error Handling
-- Without Transaction and Error Handling
EXEC spSelectInsertUpdateDeleteOutputReturn 'S', '', '', '', '';
EXEC spSelectInsertUpdateDeleteOutputReturn 'I', 618, 305, '', '';
EXEC spSelectInsertUpdateDeleteOutputReturn 'U', 618, 306, '', '';
EXEC spSelectInsertUpdateDeleteOutputReturn 'D', '618', '', '', '';

DECLARE @facility_Name varchar(10)
EXEC spSelectInsertUpdateDeleteOutputReturn 'O', '', 305, @facility_Name OUTPUT, '';
SELECT @facility_Name AS ItemTypeName;

DECLARE @count int
EXEC @count = spSelectInsertUpdateDeleteOutputReturn 'R', 606, '', '', '';
SELECT @count AS RoomsFacilityCount;

-- With Error Handling
EXEC spSelectInsertUpdateDeleteWithErrorHandling 'I', '620', '305';

-- With Transaction
EXEC spSelectInsertUpdateDeleteWithTransaction 'I', '620', '305';

-- Multiple Action procedure with transaction and Error Handling
EXEC spSelectInsertUpdateDeleteOutputReturnWithTransactionAndError 'S', '', '', '', '';
EXEC spSelectInsertUpdateDeleteOutputReturnWithTransactionAndError 'I', 618, 308, '', '';
EXEC spSelectInsertUpdateDeleteOutputReturnWithTransactionAndError 'U', 618, 310, '', '';
EXEC spSelectInsertUpdateDeleteOutputReturnWithTransactionAndError 'D', '618', '', '', '';


-- DML-76. Justifying Functions
SELECT dbo.fnRoomFacilitiesCount(305);
PRINT 'Sum of Total Expense that is more than 4000: $' + CONVERT(varchar, dbo.fnPaymentTotal(), 1);

SELECT * FROM dbo.fnTopGuestsPayment(5000);
SELECT * FROM dbo.fnGuestBookingHistory(504);

EXEC sp_helptext fnGuestBookingHistoryEncryptSchemabindExecAsClause;


-- DML-77. Justify TRIGGER
-- INSTEAD OF trigger
SELECT * FROM Bookings;

UPDATE Bookings SET PerDayExpense = PerDayExpense + 10
WHERE GuestID = 524;

UPDATE Bookings SET PerDayExpense = PerDayExpense + 10
WHERE GuestID = 524 AND BookingID = 74;

DELETE FROM Bookings 
WHERE GuestID = 504;

-- AFTER trigger for a table
INSERT INTO Facilities 
VALUES (310, 'Free Food Service');
UPDATE Facilities SET FacilityName = 'Complimentary Breakfast'
WHERE FacilityID = 310;
SELECT * FROM Facilities;

DELETE Bookings
WHERE GuestID = 524;
TRUNCATE TABLE BookingsArchieve;
SELECT * FROM BookingsArchieve;

-- INSTEAD OF Trigger for a View
INSERT INTO vu_Shammi_Bookings (RoomID, CheckInDate, CheckOutDate, PerDayExpense)
VALUES (613, '2027-04-08', '2026-04-11', 450.00);

UPDATE vu_Shammi_Bookings
SET PerDayExpense = 300.00
WHERE BookingID = 5;

DELETE FROM vu_Shammi_Bookings 
WHERE BookingID = 42;

-- FOR Trigger
INSERT INTO GuestTypes
VALUES (407, 'Wellness & Eco-Conscious Travelers');