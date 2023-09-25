create table tblEmployee (
Id int primary key,
Name nvarchar(30),
Salary int,
Gender nvarchar(10),
DepartmentId int
)

create table tblDepartment
(
DeptId int primary key,
DeptName nvarchar(20))

insert into tblDepartment values (1, 'IT');
insert into tblDepartment values (2, 'Payroll');
insert into tblDepartment values (3, 'HR');
insert into tblDepartment values (4, 'Admin');

insert into tblEmployee values (1, 'John', 5000,'Male',3);
insert into tblEmployee values (2, 'Mike', 3400,'Male',2);
insert into tblEmployee values (3, 'Pam', 6000,'Female',1);
insert into tblEmployee values (4, 'Todd', 4800,'Male',4);
insert into tblEmployee values (5, 'Sara', 3200,'female',1);
insert into tblEmployee values (6, 'Ben', 4800,'Male',3);

select Id, Name, Salary, Gender, DeptName from tblEmployee
join tblDepartment on tblEmployee.DepartmentId = tblDepartment.DeptId

Create view vWEmployeeByDepartment
as
select Id, Name, Salary, Gender, DeptName from tblEmployee
join tblDepartment on tblEmployee.DepartmentId = tblDepartment.DeptId

select * from vWEmployeeByDepartment

Create view vWITDepartment_Employees
as
select Id, Name, Salary, Gender, DeptName from tblEmployee
join tblDepartment on tblEmployee.DepartmentId = tblDepartment.DeptId
where tblDepartment.DeptName='IT'

select * from vWITDepartment_Employees

Create view vWEmployeesNonConfidentialData
as
select Id, Name, Gender, DeptName from tblEmployee
join tblDepartment on tblEmployee.DepartmentId = tblDepartment.DeptId

select * from vWEmployeesNonConfidentialData

Create view vWEmployeesCountByDepartment
as
select DeptName, COUNT(Id) as TotalEmployees from tblEmployee
join tblDepartment on tblEmployee.DepartmentId = tblDepartment.DeptId
group by DeptName

select * from vWEmployeesCountByDepartment

Create view vWEmployeesDataExceptSalary
as
select Id, Name, Gender, DepartmentId
from tblEmployee


select * from vWEmployeesDataExceptSalary

Update vWEmployeesDataExceptSalary
set Name = 'Mikey' where Id = 2

delete from vWEmployeesDataExceptSalary where Id = 2;
insert into vWEmployeesDataExceptSalary values (2, 'Mikey', 'Male', 2);

Create view vWEmployeesDetailsByDepartment
as
select Id, Name, Salary, Gender, DeptName from tblEmployee
join tblDepartment on tblEmployee.DepartmentId = tblDepartment.DeptId

select * from vWEmployeesDetailsByDepartment

Update vWEmployeesDetailsByDepartment
set DeptName = 'IT' where Name = 'John';

select * from vWEmployeesDetailsByDepartment

create table tblProduct (
ProductId int Primary key,
Name nvarchar(20),
UnitPrice int)

insert into tblProduct values (1, 'books', 20)
insert into tblProduct values (2, 'pens', 14)
insert into tblProduct values (3, 'pencils', 11)
insert into tblProduct values (4, 'clips', 10)

select * from tblProduct

create table tblProductSales
(
ProductId int,
QuantitySold int
)

insert into tblProductSales values (1,10);
insert into tblProductSales values (3,23);
insert into tblProductSales values (4,21);
insert into tblProductSales values (2,12);
insert into tblProductSales values (1,13);
insert into tblProductSales values (3,12);
insert into tblProductSales values (4,13);
insert into tblProductSales values (1,11);
insert into tblProductSales values (2,12);
insert into tblProductSales values (1,14);

select * from tblProductSales

create view vWTotasalesByProduct
with SchemaBinding
as
select Name
SUM(ISNULL((QuantitySold * UnitPrice),0)) as TotalSales,
COUNT_BIG (*) as TotalTransactions 
from dbo.tblProductSales
join dbo.tblProduct
on dbo.tblProduct.ProductId = dbo.tblProductsales.ProductId
group by name

select * from vWTotasalesByProduct
