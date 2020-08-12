-- Multi-Table Query Practice
-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.


select
  categoryname,
  productname
from category
join product on category.id = product.CategoryId 


-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.


select
  [order].id,
  shipper.CompanyName
from [order]
join shipper on [order].shipvia = shipper.Id
where
  [order].orderdate < '2012-08-09' 
  
  
  -- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName.
  -- Shows 3 records.


select
  orderid,
  quantity,
  product.ProductName
from orderdetail
join product on orderdetail.ProductId = product.Id
where
  orderid = 10251 
  
  
  --    Display the OrderID,
  --    Customer's Company Name and
  --    the employee's LastName for every order.
  --    All columns should be labeled clearly. Displays 16,789 records.


select
  id as orderid,
  customer.CompanyName as "Customer's company name",
  employee.LastName as " employee's last name"
from [order]
join customer on [order].customerid = customer.id
join employee on [order].employeeid = employee.Id 

-- /////  STRETCH TASKS COMPLETED:
  -- - Display OrderID
  -- and a column called ItemCount that shows the total number of products placed on the order.Shows 196 records.
  
select
  orderid,
  sum(quantity) as ItemCount
from orderdetails
group by
  orderid