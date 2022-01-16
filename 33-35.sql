select p.productname from dbo.product as p
inner join dbo.customer as c
inner 
where c.customername like 'amrutha'



select p.productname from dbo.product as p
inner join dbo.customer as c
where c.customername like 'gotham'

select c.customername from dbo.customer as c
inner join dbo.customeraddress as a
on c.customerid = a.customerid
where (select productname from dbo.product where productname like '%Apple I-Pad Mini%')


