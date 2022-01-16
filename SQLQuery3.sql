select c.customername,o.orderid from dbo.customer
as c
inner join orderd as o
on c.customerid = o.customerid