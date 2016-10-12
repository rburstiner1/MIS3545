use AdventureWorksDW2012;

/*Question 4A*/

select p.englishproductname as ProductName, 
sum(s.OrderQuantity)as TotalOrderQty,
 avg(s.UnitPrice) as AveragePrice
from DimProduct as p join 
FactInternetSales as s
on p.ProductKey=s.ProductKey
group by p.EnglishProductName;

/*Question 4B*/

select p.EnglishProductName, 
c.Gender, 
c.MaritalStatus, 
sum(s.OrderQuantity)as TotalOrderQty
from DimCustomer as c join 
FactInternetSales as s
on c.customerkey=s.customerkey 
join DimProduct as p 
on p.ProductKey= s.ProductKey
group by p.EnglishProductName,c.Gender, c.MaritalStatus;

/*4C Extra Credit*/ 

SELECT EnglishProductName, [F] AS Female, [M] AS Male
FROM 
(SELECT EnglishProductName, OrderQuantity, Gender
FROM DimCustomer as c join 
FactInternetSales as s
on c.customerkey=s.customerkey 
join DimProduct as p 
on p.ProductKey= s.ProductKey ) as ft
PIVOT
(
sum(OrderQuantity)
FOR [Gender] IN
( [F], [M])
) AS pvt;