--DROP PROC usp_PurchaseTicket

CREATE PROC usp_PurchaseTicket(@CustomerID int,@FlightID int,@TicketPrice decimal(8,2),
@Class varchar(6),@Seat varchar(5)) AS
BEGIN
 DECLARE @accountBalance decimal(10,2) = (SELECT Balance FROM CustomerBankAccounts
 WHERE CustomerID = @CustomerID);


 IF(@accountBalance < @TicketPrice)
 BEGIN
  RAISERROR('Insufficient bank account balance for ticket purchase',16,1);
    RETURN;
 END
  BEGIN TRAN

 DECLARE @ticketID int = (SELECT COUNT(*) FROM Tickets) + 1;

 INSERT INTO Tickets(TicketID,CustomerID,FlightID,Price,Class,Seat)
 VALUES (@ticketID,@CustomerID,@FlightID,@TicketPrice,@Class,@Seat)

 UPDATE CustomerBankAccounts
 SET Balance -= @TicketPrice WHERE CustomerID = @CustomerID

 COMMIT;
END

EXEC usp_PurchaseTicket 2,5,15,'First','234-A'