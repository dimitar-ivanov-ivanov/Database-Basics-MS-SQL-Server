UPDATE Payments
SET TaxRate -= TaxRate  * 3/100

SELECT TaxRate FROM Payments

UPDATE Payments
SET TaxAmount = AmountCharged * TaxRate

UPDATE Payments
SET PaymentTotal = AmountCharged + TaxAmount