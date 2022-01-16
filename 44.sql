select c.customerid, c.customername, o.orderdate
from customer c
inner join orderd o
on c.customerid = o.customerid