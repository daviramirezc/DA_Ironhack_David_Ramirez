CREATE DATABASE IronHack_Gambling;
USE IronHack_Gambling;

SELECT * FROM account;

SELECT * FROM betting;

SELECT COUNT(*) FROM betting;

SELECT * FROM customer;

SELECT * FROM product;

SELECT * FROM school;

SELECT * FROM student;

-- Pregunta numero 1
SELECT Title, FirstName, LastName, DateOfBirth
FROM customer;

-- Pregunta numero 2
SELECT CustomerGroup, COUNT(*) AS NumberOfCustomers
FROM Customer
GROUP BY CustomerGroup;

-- Pregunta numero 3
SELECT c.*, a.CurrencyCode
FROM Customer c
JOIN Account a ON c.CustId = a.CustId;

-- Pregunta numero 4
SELECT p.product, b.BetDate, SUM(b.Bet_Amt) AS TotalBet
FROM Betting b
JOIN Product p ON b.ClassId = p.CLASSID AND b.CategoryId = p.CATEGORYID
GROUP BY p.product, b.BetDate;

-- Pregunta numero 5
SELECT p.product, b.BetDate, SUM(b.Bet_Amt) AS TotalBet
FROM Betting b
JOIN Product p ON b.ClassId = p.CLASSID AND b.CategoryId = p.CATEGORYID
WHERE b.BetDate >= '2012-11-01' AND p.product = 'Sportsbook'
GROUP BY p.product, b.BetDate;

-- Pregunta numero 6
SELECT p.product, a.CurrencyCode, c.CustomerGroup, SUM(b.Bet_Amt) AS TotalBet
FROM Betting b
JOIN Account a ON b.AccountNo = a.AccountNo
JOIN Customer c ON a.CustId = c.CustId
JOIN Product p ON b.ClassId = p.CLASSID AND b.CategoryId = p.CATEGORYID
WHERE b.BetDate > '2012-12-01'
GROUP BY p.product, a.CurrencyCode, c.CustomerGroup;

-- Pregunta numero 7
SELECT *
FROM Betting
WHERE MONTH(STR_TO_DATE(BetDate, '%m/%d/%Y')) = 11
  AND YEAR(STR_TO_DATE(BetDate, '%m/%d/%Y')) = 2012;


SELECT c.Title, c.FirstName, c.LastName, COALESCE(SUM(b.Bet_Amt), 0) AS TotalBetNovember
FROM Customer c
LEFT JOIN Account a ON c.CustId = a.CustId
LEFT JOIN Betting b ON a.AccountNo = b.AccountNo 
AND STR_TO_DATE(b.BetDate, '%m/%d/%Y') BETWEEN '2012-11-01' AND '2012-11-30'
GROUP BY c.Title, c.FirstName, c.LastName;




-- Pregunta numero 8 Consulta 1
SELECT a.CustId, COUNT(DISTINCT p.product) AS NumberOfProducts
FROM Betting b
JOIN Account a ON b.AccountNo = a.AccountNo
JOIN Product p ON b.ClassId = p.CLASSID AND b.CategoryId = p.CATEGORYID
GROUP BY a.CustId;

-- Pregunta numero 8 Consulta 2
SELECT a.CustId
FROM Betting b
JOIN Account a ON b.AccountNo = a.AccountNo
JOIN Product p ON b.ClassId = p.CLASSID AND b.CategoryId = p.CATEGORYID
WHERE p.product IN ('Sportsbook', 'Vegas')
GROUP BY a.CustId
HAVING COUNT(DISTINCT p.product) = 2;

-- Pregunta numero 9
SELECT a.CustId, SUM(b.Bet_Amt) AS TotalBetSportsbook
FROM Betting b
JOIN Account a ON b.AccountNo = a.AccountNo
JOIN Product p ON b.ClassId = p.CLASSID AND b.CategoryId = p.CATEGORYID
WHERE p.product = 'Sportsbook' AND b.Bet_Amt > 0
GROUP BY a.CustId
HAVING COUNT(DISTINCT p.product) = 1;

-- Pregunta numero 10
SELECT a.CustId, p.product, SUM(b.Bet_Amt) AS TotalBet
FROM Betting b
JOIN Account a ON b.AccountNo = a.AccountNo
JOIN Product p ON b.ClassId = p.CLASSID AND b.CategoryId = p.CATEGORYID
GROUP BY a.CustId, p.product
ORDER BY a.CustId, TotalBet DESC;

-- Pregunta numero 11
SELECT student_id, student_name, GPA
FROM student
ORDER BY GPA DESC
LIMIT 5;

-- Pregunta 12
SELECT sch.school_id, sch.school_name, COUNT(ss.student_id) AS NumberOfStudents
FROM school sch
LEFT JOIN student ss ON sch.school_id = ss.school_id
GROUP BY sch.school_id, sch.school_name;


-- Pregunta numero 13
WITH RankedStudents AS (
    SELECT student_id, student_name, school_id, GPA,
           ROW_NUMBER() OVER (PARTITION BY school_id ORDER BY GPA DESC) AS student_rank
    FROM student
)
SELECT student_id, student_name, school_id, GPA
FROM RankedStudents
WHERE student_rank <= 3;
















