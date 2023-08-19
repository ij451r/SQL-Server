--SQL PROJECT I
--Mohammad Jasir - mohammedjasir660@gmail.com
--Project: Querying a Large Relational Database

--1. Download File AdventureWorks2012


--2. Restore Database

USE AdventureWorks2012;

SELECT *
FROM INFORMATION_SCHEMA.TABLES
order by TABLE_NAME;

--3. Perform the following with help of the above database:
--a. Get all the details from the person table including email ID, phone
--number and phone number type
select COLUMN_NAME from information_schema.columns where table_name = 'Person';

select P.BusinessEntityID, P.FirstName, P.LastName, E.EmailAddress, Ph.PhoneNumber, PhT.Name as [Phone Number Type]
from Person.Person P
join Person.EmailAddress E on P.BusinessEntityID=E.BusinessEntityID
join Person.PersonPhone Ph on P.BusinessEntityID=Ph.BusinessEntityID
join Person.PhoneNumberType PhT on Ph.PhoneNumberTypeID=PhT.PhoneNumberTypeID;

--b. Get the details of the sales header order made in May 2011
select * 
from Sales.SalesOrderHeader
where YEAR(OrderDate)='2011' and MONTH(OrderDate)='05';

--c. Get the details of the sales details order made in the month of May
--2011
select * 
from Sales.SalesOrderDetail SOD
join Sales.SalesOrderHeader SOH on SOD.SalesOrderID=SOH.SalesOrderID
where YEAR(SOH.OrderDate)='2011' and MONTH(SOH.OrderDate)='05';

--d. Get the total sales made in May 2011
select count(*) as total_sales 
from Sales.SalesOrderDetail SOD
join Sales.SalesOrderHeader SOH on SOD.SalesOrderID=SOH.SalesOrderID
where YEAR(SOH.OrderDate)='2011' and MONTH(SOH.OrderDate)='05';

--e. Get the total sales made in the year 2011 by month order by
--increasing sales
select DATENAME(mm,SOH.OrderDate) as Month, count(*) as TOTAL_SALES
from Sales.SalesOrderDetail SOD
join Sales.SalesOrderHeader SOH on SOD.SalesOrderID=SOH.SalesOrderID
where YEAR(SOH.OrderDate)='2011' 
group by DATENAME(MM,SOH.OrderDate)
order by COUNT(*) asc;

--f. Get the total sales made to the customer with FirstName='Gustavo'
--and LastName='Achong'
select *
from Sales.Customer C
join Person.Person P on C.PersonID=P.BusinessEntityID
where P.FirstName='Gustavo' and P.LastName='Achong';
