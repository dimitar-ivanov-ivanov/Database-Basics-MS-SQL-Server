CREATE PROC udp_ChangePassword(@email varchar(30),@password varchar(20))
AS
BEGIN
  IF(@email NOT IN (SELECT Email FROM  Credentials))
  BEGIN
   RAISERROR('The email does''t exist!', 16, 1);
  END
  ELSE
  BEGIN
   UPDATE Credentials
   SET Password = @password WHERE Email =@email
  END
END

--exec udp_ChangePassword 'abarnes0@sogou.com','new_pass'