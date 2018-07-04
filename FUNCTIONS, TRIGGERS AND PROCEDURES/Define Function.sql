CREATE FUNCTION 
ufn_IsWordComprised(@setOfLetters varchar(max),@word varchar(max))
RETURNS BIT AS
BEGIN
 DECLARE @isComprised int = 0;
 DECLARE @IndexWord int = 1;
 DECLARE @CurrentChar char;

 WHILE(@IndexWord <= LEN(@word))
 BEGIN
 SET @CurrentChar = SUBSTRING(@word,@IndexWord,1);
  IF(CHARINDEX(@CurrentChar,@setOfLetters) = 0)
   BEGIN
    RETURN 0;
   END
   SET @IndexWord +=1;
 END

 RETURN 1;
END


--dbo.ufn_IsWordComprised