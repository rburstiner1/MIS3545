use AdventureWorks2012;
/*Find out info of all the customers*/
 Select * FROM Sales.Customer; 

/*Find out info of all the sales orders*/
SELECT * FROM Sales.SalesOrderHeader;

/*Find out sales info about productID 843*/
Select * FROM Sales.SalesOrderDetail WHERE ProductID=843;


/* Sales info of all the products of which unit price is between 100 and 200*/
Select * FROM Sales.SalesOrderDetail WHERE UnitPrice BETWEEN 100 AND 200;
/* WHERE UnitPrice >=100 and <=200;*/

/*All the store names*/
Select Name From Sales.Store;

/*Find out store names that contain "Bike" */
Select Name from Sales.Store where Name like '%Bike%';


/*info of all the credit cards*/
Select * From Sales.CreditCard;

/* A list of credit card types*/
Select Distinct CardType from Sales.CreditCard;