
	/*	COMANDOS B�SICOS SQL	*/

	-- SELECT
	SELECT GETDATE() as [DataHoraAtual] -- Exibindo uma fun��o
	SELECT convert(varchar, getdate(), 5) -- Convertendo o getdate() para o formato dd/mm/aa 
	SELECT convert(varchar, getdate(), 8) -- Convertendo o getdate() para o formato hh/mm/ss 
	SELECT 8 + 8 -- Exibindo uma opera��o aritm�tica
	SELECT * FROM Person.Person -- Exibindo todas as colunas de uma tabela com o *
	SELECT FirstName, LastName FROM Person.Person -- Exibindo colunas de uma tabela
	SELECT FirstName + ' ' + LastName FROM Person.Person -- Concatena��o +
	SELECT CONCAT(FirstName, ' ', LastName) FROM Person.Person -- Fun��o CONCAT

	-- Sem utilizar o DISTINCT
	SELECT lastname
	FROM person.person -- 19.972 rows

	-- DISTINCT
	SELECT DISTINCT lastname -- Usar sempre ap�s o SELECT
	FROM person.person -- 1.206 rows
	SELECT '19.972 - 1.206 = ' as 'Calculo', 19.972 - 1.206 AS [LinhasAfetadas]

	-- WHERE
	SELECT JobTitle
	FROM [HumanResources].[Employee]
	WHERE JobTitle = 'Engineering Manager' 
	OR JobTitle = 'Marketing Assistant'

	-- ORDER BY A-Z
	SELECT [ReorderPoint]
	FROM [Production].[Product]
	ORDER BY [ReorderPoint] -- Por padr�o o ORDER BY � ASC

	-- ORDER BY Z-A
	SELECT [ReorderPoint]
	FROM [Production].[Product]
	ORDER BY [ReorderPoint] DESC 

	-- TOP (X)
	SELECT TOP (10) LastName 
	FROM Person.Person

	-- BETWEEN
	SELECT *
	FROM Person.Person
	WHERE ModifiedDate BETWEEN '2009-01-07' and '2011-08-01' -- Entre um periodo e outro
	ORDER BY ModifiedDate 

	------------------------------
	
	/*	FUN��ES DE AGREGA��O	*/

	-- COUNT
	SELECT COUNT(*) -- Com o * conta todas as linhas
	FROM Person.Person 

	-- MAX, MIN, AVG
	SELECT MAX(ReorderPoint) as [MAX], MIN(ReorderPoint) as [MIN], AVG(ReorderPoint) as [ME] 
	FROM Production.Product

	------------------------------

	-- GROUP BY 
	SELECT 
	Color,
	COUNT(Color) AS Qtde
	FROM Production.Product
	GROUP BY Color -- faz agrupamento

	-- UNION
	/*
	N�mero de colunas iguais;
	datatype igual;
	order by deve ser colocado no final da �ltima select.
	*/

	select 
		[Name],
		[ListPrice]
	from [Production].[Product]
	where ListPrice not in (0)

	UNION 
	
	select 
	'Total:',
	sum(ListPrice)
	from [Production].[Product]
	order by [ListPrice] 