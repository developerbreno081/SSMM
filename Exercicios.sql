
	/* QUERY SOBRE RESOLU��O DE EXERC�CIOS */  

	-- 01. Selecione a coluna de data de modifica��o da tabela Person.Person

	SELECT ModifiedDate 
	FROM Person.Person

	-- 02. Selecione as colunas de data de modifica��o, nome e sobrenome da tabela Person.Person

	SELECT
		FirstName, 
		LastName,
		ModifiedDate
	FROM Person.Person

	-- 03. Selecione todas as colunas da tabela Person.Person

	SELECT * FROM Person.Person

	-- 04. Selecione a coluna de sobrenome sem o DISTINCT da tabela Person.Person, 
	-- Selecione a coluna de sobrenome com o DISTINCT da tabela Person.Person

	SELECT
		LastName -- 19.972 rows
	FROM Person.Person

	SELECT DISTINCT
		LastName -- 1.206 rows
	FROM Person.Person

	SELECT 'Total:' AS 'Calculo', 19.972 - 1.206 AS 'Resultado' 
	
	-- 06. Fa�a um filtro da coluna [JobTitle] que pertence a tabela [HumanResources].[Employee] 
	-- e que o resultado seja tudo que for Engineering Manager ou Marketing Assistant

	SELECT 
		JobTitle
	FROM HumanResources.Employee
	WHERE JobTitle in ('Engineering Manager','Marketing Assistant') -- Utilizando o operador l�gico IN

	SELECT 
		JobTitle
	FROM HumanResources.Employee
	WHERE JobTitle = 'Engineering Manager' OR JobTitle = 'Marketing Assistant' -- Utilizando o operador l�gico OR

	--08. Ordene a coluna [ReorderPoint] de A-Z e do Z-A da tabela [Production].[Product]

	select ReorderPoint
	FROM [Production].[Product]
	order by ReorderPoint -- ASC


	select ReorderPoint
	FROM [Production].[Product]
	order by ReorderPoint DESC -- DESC

	--09. Use o comando de limita��o de linhas para trazer 10 rows da tabela person.person

	select top(10) *
	from Person.Person

	--10. Utilize a tabela [HumanResources].[Employee] para calcular a idade dos funcion�rios atr�ves do ano de nascimento 

	select
		datepart(year,getdate()) - datepart(YEAR,BirthDate) as Idade 
	from [HumanResources].[Employee] 

	--11. Fa�a a concatena��o das colunas FirtName e LastName da tabela Person.Person

	select
		FirstName + '' + ' ' + LastName
	from Person.Person -- revisar depois a concatena��o

	--12. Dar exemplo de como utilizar os operadores l�gicos

	-- OR
	Select *
	from Person.Person
	where FirstName = 'ken' OR FirstName = 'gail'

	-- BETWEEN
	Select *
	from Person.Person
	where ModifiedDate between '20090117' and '20101128'

	-- NOT
	Select *
	from Person.Person
	where FirstName not in ('ken','gail')

	-- LIKE
	Select *
	from Person.Person
	where FirstName like 'A%'

	-- 13. Dar exemplos com as fun��es agregadas

	select count(*)
	from Person.Person

	select max(ListPrice) as [Pre�o max]
	from Production.Product

	select min(ListPrice) as [Pre�o min]
	from Production.Product

	select avg(ListPrice) as [M�dia]
	from Production.Product

	-- 14. der exemplos utilizando o group by

	select 
	color,
	count(*)
	from Production.Product
	group by Color

	/*16. Depois verificar o seguinte cen�rio na tabela [HumanResources].[Employee] 
	temos a coluna JOBTITLE E GeNDER... Queremos trazer quantos o seguinte 
	exibi��o: Qtd M, Qtd F e Qtd Total, poss�vel resolu��o � utilizar um UNION*/

	SELECT
	  Jobtitle,
	  --COUNT(*) AS Contagem,
	  COUNT(CASE WHEN Gender = 'M' THEN 1 END) AS 'Contagem M', -- utiliza��o do COUNT CASE 
	  COUNT(CASE WHEN Gender = 'F' THEN 1 END) AS 'Contagem F'
	FROM HumanResources.Employee
	group by JobTitle
	order by [Contagem F] desc