CREATE PROC udp_ChangePassword(@email varchar(30),@newPass varchar(20)) AS
BEGIN
 IF(@email NOT IN (SELECT Email FROM Credentials))
 BEGIN
  RAISERROR('The email does''t exist!',16,1);
 END
 ELSE 
 BEGIN
   UPDATE Credentials
   SET Password = @newPass
   WHERE Email = @email
 END
END