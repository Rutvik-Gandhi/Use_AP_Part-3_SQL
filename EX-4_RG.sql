-- ex4_RG.sql
-- Winter 2023 Exercise 4
-- Revision History:
-- Rutvik Gandhi, Section 3, 2023.03.27: Created

Print 'W23 PROG8080 Section 3';
Print 'Exercise 4';
Print '';
Print 'Rutvik Gandhi';
Print '';
Print GETDATE();
Print '';

USE AP;

-- Question 1
Print '*** Question 1 ***';
Print '';

IF OBJECT_ID('VendorCopyRG') IS NOT NULL
	DROP TABLE VendorCopyRG;

SELECT *
INTO VendorCopyRG
FROM Vendors;

SELECT COUNT(*) AS [Number of rows in VendorCopyRG]
FROM VendorCopyRG;

-- Question 2
Print '*** Question 2 ***';
Print '';

IF OBJECT_ID('InvoiceBalancesRG') IS NOT NULL
	DROP TABLE InvoiceBalancesRG;

SELECT *
INTO InvoiceBalancesRG
FROM Invoices
WHERE InvoiceTotal - PaymentTotal - CreditTotal <> 0;

SELECT COUNT(*) AS [Number of rows in InvoiceBalancesRG]
FROM InvoiceBalancesRG;

-- Question 3
Print '*** Question 3 ***';
Print '';

INSERT INTO InvoiceBalancesRG
VALUES (86, '4591178', '2022-09-01', 9345.60, 0, 0, 1, '2022-10-01', NULL); 

SELECT * 
FROM InvoiceBalancesRG
WHERE VendorID = 86;

-- Question 4
Print '*** Question 4 ***';
Print '';

INSERT INTO InvoiceBalancesRG 
	(VendorID, InvoiceNumber, InvoiceTotal, PaymentTotal, CreditTotal,
	TermsID, InvoiceDate, InvoiceDueDate)
VALUES
    (30, 'COSTCO345', 2800.00, 0, 0, 1, GETDATE(), GETDATE() + 30); 

SELECT * 
FROM InvoiceBalancesRG
WHERE VendorID = 30;

-- Question 5
Print '*** Question 5 ***';
Print '';

UPDATE InvoiceBalancesRG
SET CreditTotal = 300
WHERE InvoiceNumber = 'COSTCO345';

SELECT * 
FROM InvoiceBalancesRG
WHERE InvoiceNumber = 'COSTCO345';

-- Question 6
Print '*** Question 6 ***';
Print '';

UPDATE InvoiceBalancesRG
SET CreditTotal = CreditTotal + 90
FROM (
	SELECT TOP 5 InvoiceID 
	FROM InvoiceBalancesRG 
	WHERE InvoiceTotal - PaymentTotal - CreditTotal > 900) AS TopInvoices
WHERE InvoiceBalancesRG.InvoiceID = TopInvoices.InvoiceID;

SELECT InvoiceID, InvoiceNumber, VendorID, InvoiceTotal, CreditTotal
FROM InvoiceBalancesRG;

-- Question 7
Print '*** Question 7 ***';
Print '';

DELETE InvoiceBalancesRG
WHERE InvoiceNumber = '4591178';

SELECT InvoiceID, InvoiceNumber, VendorID, InvoiceTotal, CreditTotal
FROM InvoiceBalancesRG;

-- Question 8
Print '*** Question 8 ***';
Print '';

SELECT COUNT(*) AS [VendorCopyRG Before Delete]
FROM VendorCopyRG;

DELETE VendorCopyRG
WHERE VendorID NOT IN
	(SELECT VendorID FROM InvoiceBalancesRG);

SELECT COUNT(*) AS [VendorCopyRG After Delete]
FROM VendorCopyRG;

-- Question 9
Print '*** Question 9 ***';
Print '';

BEGIN TRAN;

DECLARE @VendorId NVARCHAR(20) = 123;
DELETE InvoiceBalancesRG
WHERE VendorID = @VendorId;

IF @@ROWCOUNT > 1
    BEGIN
        ROLLBACK TRAN;
        PRINT 'More invoices than expected. Deletions rolled back.';
    END;
ELSE
    BEGIN
        COMMIT TRAN;
        PRINT 'Deletions committed to the database.';
    END;


SELECT COUNT(*) AS [Number of FedEx invoices]
FROM InvoiceBalancesRG
WHERE VendorID = @VendorId;

-- Question 10
Print '*** Question 10 ***';
Print '';

SELECT COUNT(*) AS [Number of Invoices]
FROM Invoices;

SELECT COUNT(*) AS [Number of InvoiceLineItems]
FROM InvoiceLineItems;

DECLARE @InvoiceID int;
BEGIN TRY
    BEGIN TRAN;
    INSERT Invoices
      VALUES (34,'ZXA-080','2020-03-01',14092.59,0,0,3,'2020-03-31',NULL);
    SET @InvoiceID = @@IDENTITY;
    INSERT InvoiceLineItems VALUES (@InvoiceID,1,160,4447.23,'HW upgrade');
    INSERT InvoiceLineItems
      VALUES (@InvoiceID,2,167,9645.36,'OS upgrade');
    COMMIT TRAN;
END TRY
BEGIN CATCH
    ROLLBACK TRAN;
END CATCH;


SELECT COUNT(*) AS [Number of Invoices]
FROM Invoices;

SELECT COUNT(*) AS [Number of InvoiceLineItems]
FROM InvoiceLineItems;