select * from product where price > 30000

select * from product where (categoryid = 2001 or categoryid = 2003) and (price > 30000)

select * from orderd where (customerid = 1 or customerid = 4) and (orderdate = '2013-02-02' 
or orderdate = '2013-02-07')