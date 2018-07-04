--DROP PROC usp_SubmitReview

CREATE PROC usp_SubmitReview(@CustomerID int,@ReviewContent varchar(255),
@ReviewGrade int,@AirlineName varchar(30)) AS
BEGIN
 BEGIN TRAN

 IF(@AirlineName NOT IN (SELECT  AirlineName FROM Airlines))
 BEGIN
 RAISERROR('Airline does not exist.',16,1);
 ROLLBACK;
 RETURN;
 END
 
 DECLARE @ReviewID int= (SELECT COUNT(*) FROM CustomerReviews) + 1;
 DECLARE @AirlineID int = (SELECT AirlineID FROM Airlines WHERE AirlineName = @AirlineName);
 INSERT INTO CustomerReviews(ReviewID,CustomerID,ReviewContent,ReviewGrade,AirlineID)
 VALUES (@ReviewID,@CustomerID,@ReviewContent,@ReviewGrade,@AirlineID)

 COMMIT;
END

--EXEC usp_SubmitReview 5,'a',5,'Royal Airline';