use AdventureWorks2012;

SELECT t.Name, 
max(month(OrderDate)) as Month, 
max(Year(OrderDate)) as Year,
sum(h.totaldue)as TotalDue

FROM Sales.SalesOrderHeader AS h join Sales.SalesTerritory AS t
on h.territoryid=t.territoryid
Where Month(h.orderdate) like 8 and year(h.Orderdate) like 2007 
Group by t.Name
ORDER BY t.Name ASC;

Select v.Name, count(pv.productid) as NumberofProducts
From purchasing.Vendor as v join purchasing.productvendor as pv
on v.BusinessEntityID=pv.BusinessEntityID
group by v.Name
having count(pv.productid)>3
order by count(pv.productid) desc;


Select Name, ProductNumber, ListPrice 
From Production.Product
Where ListPrice >500
Order by ListPrice ASC;


SELECT t.Name, 
sum(h.totaldue)as TotalDue

FROM Sales.SalesOrderHeader AS h join Sales.SalesTerritory AS t
on h.territoryid=t.territoryid
Where Month(h.orderdate) like 8 and year(h.Orderdate) like 2007 
Group by t.Name
ORDER BY t.Name ASC;
