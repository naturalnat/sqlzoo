-- 1. Show the first name and the email address of customer with CompanyName 'Bike World'

SELECT FirstName, EmailAddress
FROM Customer
WHERE CompanyName = 'Bike World';

-- 2.  Show the CompanyName for all customers with an address in City 'Dallas'. 

SELECT CompanyName
FROM Customer
JOIN CustomerAddress
    ON Customer.CustomerID = CustomerAddress.CustomerID
  JOIN Address
    ON CustomerAddress.AddressID = Address.AddressID
WHERE Address.City = 'Dallas';

-- 3. How many items with ListPrice more than $1000 have been sold?

SELECT COUNT(*) AS count
FROM SalesOrderDetail
JOIN Product
ON SalesOrderDetail.ProductID = Product.ProductID
WHERE Product.ListPrice > 1000;

-- 4. Give the CompanyName of those customers with orders over $100000. Include the subtotal plus tax plus freight.

SELECT Customer.CompanyName
FROM SalesOrderHeader
JOIN Customer
ON SalesOrderHeader.CustomerID = Customer.CustomerID
WHERE SalesOrderHeader.SubTotal + SalesOrderHeader.TaxAmt + SalesOrderHeader.Freight > 100000;
 

 --5. Find the number of left racing socks ('Racing Socks, L') ordered by CompanyName 'Riding Cycles'

SELECT SUM(SalesOrderDetail.OrderQty) 
FROM SalesOrderDetail
JOIN Product
ON SalesOrderDetail.ProductID = Product.ProductID
JOIN SalesOrderHeader
ON SalesOrderDetail.SalesOrderID = SalesOrderHeader.SalesOrderID
JOIN Customer
ON SalesOrderHeader.CustomerID = Customer.CustomerID
WHERE Product.Name = 'Racing Socks, L' AND Customer.CompanyName = 'Riding Cycles';
