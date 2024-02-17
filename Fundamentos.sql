
	/*	COMANDOS BÁSICOS SQL	*/

	-- SELECT
	SELECT GETDATE() as [DataHoraAtual] -- Exibindo uma função
	SELECT convert(varchar, getdate(), 5) -- Convertendo o getdate() para o formato dd/mm/aa 
	SELECT convert(varchar, getdate(), 8) -- Convertendo o getdate() para o formato hh/mm/ss 
	SELECT 8 + 8 -- Exibindo uma operação aritmética
	SELECT * FROM Person.Person -- Exibindo todas as colunas de uma tabela com o *
	SELECT FirstName, LastName FROM Person.Person -- Exibindo colunas de uma tabela
	SELECT FirstName + ' ' + LastName FROM Person.Person -- Concatenação +
	SELECT CONCAT(FirstName, ' ', LastName) FROM Person.Person -- Função CONCAT

	-- Sem utilizar o DISTINCT
	SELECT lastname
	FROM person.person -- 19.972 rows

	-- DISTINCT
	SELECT DISTINCT lastname -- Usar sempre após o SELECT
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
	ORDER BY [ReorderPoint] -- Por padrão o ORDER BY é ASC

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
	
	/*	FUNÇÕES DE AGREGAÇÃO	*/

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
	Número de colunas iguais;
	datatype igual;
	order by deve ser colocado no final da última select.
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