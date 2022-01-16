select distinct productname from product

select distinct p.productname, o.qty from product p 
inner join orderitem  o
on o.productid = p.productid