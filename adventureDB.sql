select * from DimEmployee;

-- Mitme avaldisega tabeliväärtusega funktsioonid

Create function ILTVF_GetEmployees()
returns table
as
return (select EmployeeKey, FirstName, CAST(BirthDate as Date) as DOB
from DimEmployee);

SELECT * FROM ILTVF_GetEmployees();

Create function MSTVF_GetEmployees()
returns @table table (EmployeeKey int, FirstName nvarchar(20), DOB date)
as
begin
insert into  @table
select EmployeeKey, FirstName, CAST(BirthDate as date)
from DimEmployee
Return
End;

SELECT * FROM MSTVF_GetEmployees();
Select * from ILTVF_GetEmployees()

update ILTVF_GetEmployees() set FirstName='sam1' Where EmployeeKey=1

update MSTVF_GetEmployees() set FirstName='sam1' Where EmployeeKey=1

-- Funktsiooniga seotud tähtsad kontseptsioonid

create function GetEmployeeNameById(@id int)
returns nvarchar(20)
as
begin
return (select FirstName from DimEmployee where EmployeeKey = @id)
end

select  dbo.GetEmployeeNameById(4);

alter function GetEmployeeNameById(@id int)
returns nvarchar(20)
with encryption
as
begin
return(select FirstName from DimEmployee where EmployeeKey=@id)
end

sp_helptext GetEmployeeNameById;

alter function GetEmployeeNameById(@id int)
returns nvarchar(20)
with schemabinding
as
begin
return(select FirstName from dbo.DimEmployee where EmployeeKey=@id)
end

drop table DimEmployee

--ajutised tabelid

Create Table #PersonDetails(Id int, Name nvarchar(20))
insert into #PersonDetails values (1,'mike')
insert into #PersonDetails values (2,'john')
insert into #PersonDetails values (3,'todd')
select * from #PersonDetails;

select name from tempdb..sysobjects where name like 'PersonDetails%';

DROP TABLE #PersonDetails

create procedure CreateLocalTempTable
as
begin
Create Table #PersonDetails(Id int, Name nvarchar(20))
insert into #PersonDetails values (1,'mike')
insert into #PersonDetails values (2,'john')
insert into #PersonDetails values (3,'todd')
select * from #PersonDetails;
end

exec CreateLocalTempTable

Create table ##EmployeeDetails(id int, Name varchar(20));
select * from ##EmployeeDetails;

--indeksid serveris

Select * from DimEmployee where BaseRate > 30 and BaseRate < 50;

create index IX_DimEmployee_BaseRate
on DimEmployee (BaseRate ASC);

exec sys.sp_helpindex @objname = 'DimEmployee'

drop index DimEmployee.IX_Name
