select c.customerid,c.customername,o.orderdate,c.companyname,p.prooductname,i.qty,i.amount,


select c.customername,a.city 
from dbo.customer as c
inner join dbo.customeraddress as a
on c.customerid = a.customerid
where productname = null
