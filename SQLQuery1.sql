SELECT 
a.BusinessEntityID as ID, 
FirstName + ' ' + LastName as NomeCompleto,
b.EmailAddress as Email,
SUBSTRING(c.LoginID,17,50) as [LoginSystem],
c.JobTitle,
CONCAT(DATEPART(YEAR,GETDATE())-DATEPART(YEAR,C.BirthDate), N' ', 'anos')  as Idade,
d.PhoneNumber

FROM Person.Person a

inner join Person.EmailAddress b
on a.BusinessEntityID = b.BusinessEntityID

inner join HumanResources.Employee c
on a.BusinessEntityID = c.BusinessEntityID

inner join Person.PersonPhone d
on a.BusinessEntityID = d.BusinessEntityID

