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