select * from dbo.customer;

select max(price),productname from dbo.product
group by productname


update product 
set availablestatus = 'n'
where productname like 'Real'

select avg(price) from product


inner join orderd as ot
on o.orderid = ot.orderid
o 
