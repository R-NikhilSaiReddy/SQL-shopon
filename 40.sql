select p.productname,c.companyname from product p
inner join company c
on p.companyid = c.companyid