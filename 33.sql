select c.customername from dbo.customer as c
inner join dbo.customeraddress as a
on c.customerid = a.customerid
where (select productname from dbo.product where productname like '%Apple I-Pad Mini%')
and a.city = 'bangalore'