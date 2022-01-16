select top 3 productname from dbo.product

select top 3 c.customername from dbo.customer as c
inner join dbo.orderd as o
on c.customerid = o.customerid
order by o.totalamount

select top 3 c.customername from dbo.customer as c
inner join dbo.orderd as o
on c.customerid = o.customerid
order by o.totalamount

select distinct productname from dbo.product

select top 1 productname from dbo.product