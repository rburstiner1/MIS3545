use AdventureWorks2012


/*1, Display the total amount collected from the orders for each order date. */
Select OrderDate, SUM(TotalDue) AS DailyAmount,
 Count(SalesOrderID) as Number_of_Orders
 from Sales.SalesOrderHeader
Group by OrderDate
Order by Sum(TotalDue) DESC;


/*2, Display the total amount collected from selling the products, 774 and 777. */
select ProductID, Sum(LineTotal)as Total_Amount,
AVG(UnitPrice) as Avg_Unit_Price,
Max(UnitPrice) as Max_Unit_Price,
Min(UnitPrice) as Min_Unit_Price
From Sales.SalesOrderDetail
Where ProductID = 774 or ProductID = 777
Group By ProductID;


select ProductID, Sum(LineTotal)
From Sales.SalesOrderDetail
Where ProductID IN(774,777)
Group By ProductID;
/*3, Write a query to display the sales person BusinessEntityID (Person.Person),
 last name and first name of all the sales persons and the name of 
 the territory (Sales.Territory)--CONNECTED BY SALES.SalesPerson to which they belong.*/
 Select P.BusinessEntityID, T.Name as Territory_Name,
 PP.LastName,PP.FirstName
 From Sales.SalesPerson As P 
 JOIN SALES.SalesTerritory as t 
 On P.TerritoryID=t.TerritoryID
 Join Person.Person as PP 
 On P.BusinessEntityID=PP.BusinessEntityID;

/*4,  Write a query to display the Business Entities of the 
customers that have the 'Vista' credit card. (Person.Person, Person.CreditCard,Sales.Credit Card*/
Select PP.BusinessEntityID, CC.CardType, PP.LastName, PP.FirstName
From Person.Person as PP JOIN
Sales.PersonCreditCard as PCC
ON PP.BusinessEntityID=PCC.BusinessEntityID
JOIN Sales.CreditCard as CC
ON PCC.CreditCardID=CC.CreditCardID
WHERE CC.CardType = 'Vista';

/*For each card type, how many customers?-- ONLY NEED Person CC and CC*/
Select CC.CardType, COUNT(PCC.BusinessEntityID)as Count_of_Customers
From Sales.PersonCreditCard as PCC
JOIN Sales.CreditCard as CC
ON PCC.CreditCardID=CC.CreditCardID
Group By CC.CardType;


/*5, Write a query to display all the country region codes along with 
their corresponding territory IDs-- tables Person.Countryregion, Sales.SalesTerritory*/
Select CR.CountryRegionCode,ST.TerritoryID, CR.Name
From Person.CountryRegion as CR 
FULL OUTER JOIN Sales.SalesTerritory as ST
ON CR.CountryRegionCode= ST.CountryRegionCode;

Select ST.TerritoryID, CR.CountryRegionCode, CR.Name
From Person.CountryRegion as CR 
Left Outer Join Sales.SalesTerritory as ST
ON CR.CountryRegionCode= ST.CountryRegionCode;

/* LIST WHERE TERRITORY ID Doesnt exist*/
Select ST.TerritoryID, CR.Name, CR.CountryRegionCode
From Person.CountryRegion as CR 
Left Outer Join Sales.SalesTerritory as ST
ON CR.CountryRegionCode= ST.CountryRegionCode
Where ST.TerritoryID is NULL;
/*6, Find out the average of the total dues of all the orders.*/
Select avg(TotalDue)
From Sales.SalesOrderHeader;
/*7, Write a query to report the sales order ID of those orders 
where the total value is greater than the average of the total values
of all the orders--USE SUBQUERY*/
Select SalesOrderID, TotalDue
From Sales.SalesOrderHeader
Where TotalDue > 
(Select avg(TotalDue) From Sales.SalesOrderHeader)
Order by TotalDue;