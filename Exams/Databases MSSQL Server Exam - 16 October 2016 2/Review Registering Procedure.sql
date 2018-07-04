CREATE PROC usp_SubmitReview(@CustomerID int,@ReviewContent varchar(255),
@ReviewGrade int,@AirlineName varchar(30)) AS
BEGIN
 BEGIN TRANSACTION
   IF(@AirlineName NOT IN 
   (SELECT AirlineName FROM Airlines))
   BEGIN
    RAISERROR('Airline does not exist',16,1);
	ROLLBACK;
	RETURN;
   END
   ELSE
   BEGIN
    DECLARE @ReviewID int = (SELECT COUNT(*) FROM CustomerReviews) + 1;
    DECLARE @AirlineID int = (SELECT AirlineID FROM Airlines WHERE AirlineName = @AirlineName);
    INSERT INTO CustomerReviews(ReviewID,CustomerID,ReviewContent,ReviewGrade,
    AirlineID)
    VALUES(@ReviewID,@CustomerID,@ReviewContent,@ReviewGrade,@AirlineID)
   END
 COMMIT;
END 