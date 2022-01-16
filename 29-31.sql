select customername from customer c inner join customeraddress s 
on c.customerid = s.customerid
where s.city like 'bangalore'

select customername from customer c inner join customeraddress s 
on c.customerid = s.customerid
where s.city not like 'bangalore'

select customername from customer c inner join orderd o
on c.customerid = o.customerid
where o.orderdate like '2013-02-02'

