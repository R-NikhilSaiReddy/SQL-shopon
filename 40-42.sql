select p.productname,c.companyname from product p
inner join company c
on p.companyid = c.companyid

select c.companyid, c.companyname, p.price, p.productname 
from company c
inner join product p
on c.companyid = p.companyid

select c.customername,a.stName,a.city from customer c
inner join customeraddress a
on c.customerid = a.customerid