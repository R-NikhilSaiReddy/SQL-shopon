select * from product where (categoryid != 10001 or categoryid != 10003) 
having price > 30000 and productname like '6%'
group by productname
