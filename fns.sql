declare @Name varchar(10)
set @Name = 'Nikhil'
select @Name as EmpName

select * from trainee
alter table dbo.trainee
add foreign key(traineeid) references trainer(traineeid)

declare @n1 int,
        @n2 int = 20,
		@total int
select ISNULL(@n1,0)
select ISNULL(@n2,0)
set @total = @n1 + @n2
select @total as total

declare @n1 int,
        @n2 int = 20,
		@n3 int =50,
		@total int

select coalesce(@n1,@n2,@n3)

select convert(int,25.64)
select cast(25.3 as varchar)
select cast('2022-10-06' as datetime)

select convert(varchar,getdate(),109) as 'today''s date'

select IIF(100>500,'yes','no')

select ISNUMERIC('nik')

select CHARINDEX('ni','nikhil')


select len('nikhil' + 'reddy')

select rtrim('  nikhil   ')+'reddy'

select QUOTENAME('nikhil')



