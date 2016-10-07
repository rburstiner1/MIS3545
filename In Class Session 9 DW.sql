use AdventureWorksDW2012;


/*Employees whose birthday is in Feburary*/
select *
from DimEmployee
where MONTH(birthdate) = 2;

select*
From DimEmployee
Where BirthDate LIKE '%-02-%';



/*who are the Sales Representatives whose birthday is in Feburary?*/
select *
from DimEmployee
where MONTH(birthdate) = 2 
AND Title = 'Sales Representative';



/*List all the sales processed by these Sales Representatives- dollar amount- Factor Table */
Select s.*, e.FirstName,e.LastName
From FactResellerSales as s, DimEmployee as e
WHERE s.EmployeeKey= e.EmployeeKey
AND MONTH(birthdate) = 2 
AND Title = 'Sales Representative';



/*who is a better sales representative that was born in Feburary?*/
select sum(s.salesamount)as TotalSales, e.FirstName, e.LastName
From FactResellerSales as s join DimEmployee as e
on s.EmployeeKey= e.EmployeeKey
AND MONTH(birthdate) = 2 
AND Title = 'Sales Representative'
GROUP BY e.FirstName, e.LastName;



/*total Amount of off-line sales in Massachusetts- one factor and one dim-location*/


/*Sales Amount of Internet Sales in 1st quarter each year in each country- time*/