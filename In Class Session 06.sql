use AdventureWorks2012;
/*Using the humanresource.employee table, provide a count of the number of employees
by job titly. The query should consider only current employees (the CurrentFlag must be equal
to 1.)*/
select JobTitle, Count(BusinessEntityID) as Number
From HumanResources.Employee 
Where CurrentFlag = 1
Group by JobTitle; 

/*Modify the query you created in Activity 1 so that the output shows 
only those job titles for which there is more than 1 employee.  
Copy the SQL you used to create this query and append it to the 
Word document you created for Activity 1. 
*/

select JobTitle, Count(BusinessEntityID) as Number
From HumanResources.Employee 
Where CurrentFlag = 1
Group by JobTitle
Having Count(BusinessEntityID) >1
Order by Count(BusinessEntityiD) Desc; 

/*For each product, show its ProductID and Name 
(from the ProductionProduct table) and the location of its inventory 
(from the Product.Location table) and amount of 
inventory held at that location 
(from the Production.ProductInventory table). */

Select pp.ProductID, pp.Name as Product_Name, l.Name as Location, i.Quantity 
From Production.Product AS pp JOIN Production.ProductInventory AS i
ON pp.ProductID = i.ProductID
JOIN Production.Location AS l 
ON l.LocationID = i.LocationID;

/*To do this, first do an outer join between the Production.Product
 table and the Production.ProductModel table in such a way that the ID
  from the ProductModel table always shows, even if there is no product
   associate with it.-- Product Model doesn't have a product yet- in developement?  */
   Select m.ProductModelID
   From Production.Product AS p RIGHT OUTER JOIN Production.ProductModel AS m ON 
   p.ProductModelID = m.ProductModelID
   WHERE ProductID is Null;
