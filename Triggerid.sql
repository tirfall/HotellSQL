--Järgnev trigger käivitab vastuseks CREATE_TABLE DDL sündmuse
create trigger trMyfirstTrigger
ON Database
for CREATE_TABLE
AS
BEGIN
print 'New table created'
END

create table Test1 (Id int)
	
--trigger käivitatakse mitu korda nagu muuda ja kustuta tabel
ALTER TRIGGER trMyfirstTrigger
ON Database
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
BEGIN
print 'A table has just been created, modified or deleted'
END

--kuidas ära hoida kasutajatel loomaks, muutmaks või kustatamiseks tabelit
ALTER TRIGGER trMyfirstTrigger
ON Database
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
BEGIN
rollback
print 'A table has just been created, modified or deleted'
END

create table Test2 (Id int)

disable trigger trMyfirstTrigger ON database
drop trigger trMyfirstTrigger ON database

--trigger käivitab sp_rename
CREATE TRIGGER trRenameTable
on database
FOR RENAME
AS
BEGIN
print'You just renamed something'
END
sp_rename 'Test', 'NewTestTable' 
sp_rename 'NewTestTable.Id' , 'NewId', 'column'

--fail 93

-- Trigger ei luba luua, muuta ja kustutada tabeleid andmebaasist sinna, kuhu see on loodud.
create trigger tr_DatabaseScopeTrigger
ON DATABASE
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
BEGIN
rollback
print 'You cannot create, alter or drop a table in the current database'
END
create table test5(Id int)

-- Trigger ei luba luua, muuta ja kustutada tabeleid serverist.
create trigger tr_DatabaseScopeTrigger
ON ALL SERVER
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
BEGIN
rollback
print 'You cannot create, alter or drop a table in any table on the server'
END

DISABLE TRIGGER tr_DatabaseScopeTrigger ON ALL SERVER
create table test5(Id int)

DISABLE TRIGGER tr_DatabaseScopeTrigger ON DATABASE
SELECT * FROM test5

ENABLE TRIGGER tr_DatabaseScopeTrigger ON ALL SERVER
create table test6(Id int)

DROP TRIGGER tr_DatabaseScopeTrigger ON ALL SERVER
create table test6(Id int)

--fail 94

create trigger tr_DatabaseScopeTrigger
ON DATABASE
FOR CREATE_TABLE
AS
BEGIN
print 'Database Scope Trigger'
END
GO

create trigger tr_ServerScopeTrigger
ON ALL SERVER
FOR CREATE_TABLE
AS
BEGIN
print 'Server Scope Trigger'
END
GO


--Kasutame sp_settriggerorder stored procedurit, milles saame seadistada käivitamise järjekorda serveri ja andmebaasi ulatuses oleva trigeriga
EXEC sp_settriggerorder 
@triggername = 'tr_DatabaseScopeTrigger',
@order = 'First',
@stmttype = 'CREATE_TABLE',
@namespace = 'DATABASE'
GO

create table test10 (Id int)

--fail 96

--Järgmine triger limiteerib maksimum arvu avatud ühendustega kasutajaid kolme peale.
CREATE TRIGGER tr_LogonAuditTriggers
ON ALL SERVER
FOR LOGON
AS BEGIN
	DECLARE @LoginName NVARCHAR (100)

	set @LoginName = ORIGINAL_LOGIN()

	IF (SELECT COUNT(*) FROM sys.dm_exec_sessions
		WHERE is_user_process = 1
		AND original_login_name = @LoginName) >3
	BEGIN
		print'Fourth connection of' + @LoginName + 'blocked'
		rollback
	END
END

--Eemaldame päästiku, sest see ei lase vealogisid näha. Seejärel avame käsuga vigadega logisid
drop trigger tr_LogonAuditTriggers ON ALL SERVER
execute sp_readerrorlog 
