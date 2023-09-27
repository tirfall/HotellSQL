execute sp_helpindex tblEmployee

Create Clustered index IX_DimEmployee_Name ON tblEmployee(Name)

Create table [tblEmployee](
[Id] int primary key,
[FirstName] nvarchar(50),
[LastName] nvarchar(50),
[Salary] int,
[Gender] nvarchar(10),
[City] nvarchar(50))

insert into tblEmployee values (1,'John','San',4500,'Male','New York');
insert into tblEmployee values (2,'Sam','Menco',2500,'Male','London');
insert into tblEmployee values (3,'Sara','Bar',5500,'Female','Tokyo');
insert into tblEmployee values (4,'Todd','Grove',3100,'Male','Toronto');
insert into tblEmployee values (5,'Pam','Mirch',6500,'Female','Sydney');

Select * from tblEmployee

drop index tblEmployee.PK__tblEmplo__3214EC079008365C

create clustered index IX_tblEmployee_Gender_Salary on tblEmployee(Gender DESC, Salary ASC);

create nonclustered index IX_tblEmployee_Salary on tblEmployee (Salary ASC)

drop table tblEmployee



Create Unique NonClustered Index UIX_tblEmployee_FirstName_LastName
On tblEmployee(FirstName, LastName)

ALTER TABLE tblEmployee 
ADD CONSTRAINT UQ_tblEmployee_City 
UNIQUE NONCLUSTERED (City)

EXECUTE SP_HELPCONSTRAINT tblEmployee

CREATE UNIQUE INDEX IX_tblEmployee_City
ON tblEmployee(City)
WITH IGNORE_DUP_KEY

select * from tblEmployee where Salary > 4000 and Salary <8000;

delete from tblEmployee where Salary = 2500;
update tblEmployee set Salary = 9000 where Salary = 6500;

select * from tblEmployee order by Salary

select * from tblEmployee order by Salary DESC

select Salary,COUNT (Salary) as Total from tblEmployee group by Salary
