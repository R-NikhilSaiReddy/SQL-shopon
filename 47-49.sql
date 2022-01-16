select c.customerid,c.customername, o.orderdate, m.companyname,p.productname, i.qty, p.price, i.amount
from customer as c
inner join orderd as o
on c.customerid = o.customerid
inner join orderitem as i
on o.orderid = i.orderid
inner join  product as p
on p.productid = i.productid
inner join company as m
on m.companyid = p.companyid
where i.amount > 50000

select c.customerid,c.customername, a.city,m.companyname,p.productname, i.qty, p.price, i.amount
from customer as c
inner join customeraddress as a
on c.customerid = a.customerid
inner join orderd as o
on a.customerid = o.customerid
inner join orderitem as i
on o.orderid = i.orderid
inner join  product as p
on p.productid = i.productid
inner join company as m
on m.companyid = p.companyid

select *
from product as p
inner join company as m
on p.companyid = m.companyid




