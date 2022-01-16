create procedure sp_getclientdetails
@ClientName nvarchar(25)
as
begin
select c.customername as clientname
       a.stName as state
from dbo.customer as c
inner join dbo.customeraddress as a
on c.customerid = a.customerid
end