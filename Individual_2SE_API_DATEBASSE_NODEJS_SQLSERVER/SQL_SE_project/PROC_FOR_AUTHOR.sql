--SQL Craete PROC for API
--AUTHOR
------------GET AUTHORS WITHOUT CONDICTION------------------
-- get all authors
CREATE
--ALTER
PROC getAuthors
AS
BEGIN
	SELECT * FROM AUTHOR
END

EXEC getAuthors

------------SEARCH AUTHORS WITH CONDITION-----------------
--get all author by id
CREATE
--ALTER
PROC getAuthorsByID
	@authorid char(10)
AS
BEGIN
	SELECT *FROM AUTHOR WHERE AUTHORID = @authorid
END
EXEC getAuthorsByID  '14554     '

-- get author by "like name"
CREATE
--ALTER
PROC getAuthorsByLikeName
	@condiction varchar(30)
AS
BEGIN
	declare @vcondiction varchar(35)
	set @vcondiction = '%' + @condiction + '%'
	SELECT *FROM AUTHOR WHERE AUTHORNAME LIKE @vcondiction;
END
EXEC getAuthorsByLikeName 'hob'

----------------------CREATE AUTHOR----------------------
CREATE
--ALTER
PROC createAuthor
	@authorid char(10),
	@adminid char(10),
	@editorid char(10),
	@password char(15),
	@authorname char(20),
	@email char(30),
	@address char(30),
	@phonenumber char(15),
	@accountnumber char(15),
	@salary int
AS
BEGIN TRAN
	IF EXISTS(SELECT AUTHORID FROM AUTHOR WITH(XLOCK) WHERE AUTHORID = @authorid)
	BEGIN
		SELECT 'Author Already Exists' AS 'ERROR'
		ROLLBACK TRAN
		RETURN 0
	END
	IF(@adminid IS NULL OR @editorid IS NULL OR @password IS NULL
	OR @authorname IS NULL OR @email IS NULL OR @address IS NULL 
	OR @phonenumber IS NULL OR @accountnumber IS NULL OR @salary IS NULL)
	BEGIN
		SELECT 'INFORMATION OF AUTHOR IS NOT NULL' AS 'ERROR'
		ROLLBACK TRAN
		RETURN 0
	END
	INSERT AUTHOR VALUES(@authorid, @adminid, @editorid, @password, @authorname, @email, @address, @phonenumber, @accountnumber, @salary,null)
	-- RETURN AUTHOR IF INSERT SCCESSFULLY
	SELECT * FROM AUTHOR WHERE AUTHORID = @authorid
COMMIT TRAN
RETURN 1
GO

EXEC createAuthor '20021', '51627', '11004', 'p@ssword', 'Pham Vuong', 'phamvuong@gmail.com', '793 district 7 HCM', '+84 48908485','123456' ,989000
exec getAuthorsByID '20022'

------------------------UPADTE AUTHOR-----------------------

CREATE
--ALTER
PROC updateAuthor
	@authorid char(10),
	@adminid char(10),
	@editorid char(10),
	@password char(15),
	@authorname char(20),
	@email char(30),
	@address char(30),
	@phonenumber char(15),
	@accountnumber char(15),
	@salary int, 
	@unpair int

AS
BEGIN TRAN
	IF(@authorid IS NULL)
	BEGIN
		SELECT 'AUTHOR ID IS UNKNOWN' AS 'ERROR'
		ROLLBACK TRAN
		RETURN 0
	END

	IF NOT EXISTS( SELECT AUTHORID FROM AUTHOR WITH(XLOCK) WHERE AUTHORID = @authorid)
	BEGIN
		SELECT 'AUTHOR ID IS NOT FOUND' AS 'ERROR'
		ROLLBACK
		RETURN 0
	END
	
	-- update--
	IF(@adminid IS NOT NULL) --ADMINID
		BEGIN
			IF EXISTS(SELECT ADMINID FROM ADMIN WITH(XLOCK) WHERE ADMINID = @adminid)
			BEGIN	
				UPDATE AUTHOR
				SET ADMINID = @adminid
				WHERE AUTHORID = @authorid
			END
			ELSE
			BEGIN
				SELECT 'ADMIN ID IS NOT FOUND' AS 'ERROR'
				ROLLBACK TRAN
				RETURN 0
			END
		END

	IF(@editorid IS NOT NULL) --EDITORID
		BEGIN
			IF EXISTS(SELECT EDITORID FROM EDITOR WITH(XLOCK) WHERE EDITORID = @editorid)
			BEGIN	
				UPDATE AUTHOR
				SET EDITORID = @editorid
				WHERE AUTHORID = @authorid
			END
			ELSE
			BEGIN
				SELECT 'EDITOR ID IS NOT FOUND' AS 'ERROR'
				ROLLBACK TRAN
				RETURN 0
			END
		END

	IF(@password IS NOT NULL) --PASSWORD
		BEGIN
			UPDATE AUTHOR
			SET PASSWORD = @password
			WHERE AUTHORID = @authorid
		END

	IF(@authorname IS NOT NULL) --AUTHORNAME
		BEGIN
			UPDATE AUTHOR
			SET AUTHORNAME = @authorname
			WHERE AUTHORID = @authorid
		END
	
	IF(@email IS NOT NULL) --EMAIL
		BEGIN
			UPDATE AUTHOR
			SET EMAIL = @email
			WHERE AUTHORID = @authorid
		END

	IF(@address IS NOT NULL) --ADDRESS
		BEGIN
			UPDATE AUTHOR
			SET ADDRESS = @address
			WHERE AUTHORID = @authorid
		END

	IF(@phonenumber IS NOT NULL) --PHONENUMBER
		BEGIN
			UPDATE AUTHOR
			SET PHONENUMBER = @phonenumber
			WHERE AUTHORID = @authorid
		END
	
	IF(@accountnumber IS NOT NULL) --ACCOUNTNUMBER
		BEGIN
			IF NOT EXISTS(SELECT ACCOUNTNUMBER FROM AUTHOR WHERE ACCOUNTNUMBER = @accountnumber)
			BEGIN
				UPDATE AUTHOR
				SET ACCOUNTNUMBER = @accountnumber
				WHERE AUTHORID = @authorid
			END
			ELSE
			BEGIN
				SELECT 'ACCOUNT NUMBER Already Exists' AS 'ERROR'
				ROLLBACK TRAN
				RETURN 0
			END
		END

	IF(@salary IS NOT NULL) --SALARY
		BEGIN
			UPDATE AUTHOR
			SET SALARY = @salary
			WHERE AUTHORID = @authorid
		END
		
	IF(@unpair IS NOT NULL) --UNPAIR
		BEGIN
			UPDATE AUTHOR
			SET UNPAID_ = @unpair
			WHERE AUTHORID = @authorid
		END

	SELECT *FROM AUTHOR WITH(XLOCK) WHERE AUTHORID = @authorid

COMMIT TRAN
RETURN 1

DECLARE @authorid char(10) , @adminid char(10), @editorid char(10), @password char(15), @authorname char(20),
		@email char(30), @address char(30), @phonenumber char(15), @accountnumber char(15), @salary int, @unpair int
set @authorid = '20021'
set @adminid = null
set @editorid = null
set @password = null
set @authorname = null
set @authorname = null
set @email = null
set @address = null
set @phonenumber = null
set @accountnumber = null
set @salary = null
set @unpair = null

EXEC getAuthorsByID '20021'
EXEC updateAuthor @authorid , @adminid, @editorid, @password , 
					@authorname, @email , @address, @phonenumber, @accountnumber, @salary, @unpair


--------------------DELETE ATHOR ----------------------
CREATE 
--ALTER
PROC deleteAuthor
	@authorid char(10)
AS
BEGIN TRAN
	IF NOT EXISTS(SELECT AUTHORID FROM AUTHOR WHERE AUTHORID = @authorid)
	BEGIN
		SELECT 'AUTHOR ID IS NOT FOUND' AS 'ERROR'
		ROLLBACK TRAN
		RETURN 0
	END
	IF EXISTS (SELECT AUTHORID FROM CHAPTER WHERE AUTHORID = @authorid)
	OR EXISTS (SELECT AUTHORID FROM SALARYSTATUS WHERE AUTHORID = @authorid)
	OR EXISTS (SELECT AUTHORID FROM STORY WHERE AUTHORID = @authorid)
	OR EXISTS (SELECT AUTHORID FROM OUTLINE WHERE AUTHORID = @authorid)
	BEGIN
		SELECT 'CAN NOT DELETE AUTHOR HAD COMPOSITIONS' AS 'ERROR'
		ROLLBACK TRAN
		RETURN 0
	END

	DELETE AUTHOR
	WHERE AUTHORID = @authorid
	SELECT 'DELETE AUTHORID: ' + CAST(@authorid AS VARCHAR) +  ' SUCCESSFULLY' AS '1'
COMMIT TRAN
RETURN 1

EXEC getAuthorsByID '20023'
EXEC deleteAuthor '20023'