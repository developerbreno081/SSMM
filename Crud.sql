

	/*

	EXECUTANDO O CRUD OPERATIONS NO SQL SERVER: 

	CREATE
	READ 
	UPDATE
	DELETE

	*/

	-- ### CREATE ###
	CREATE DATABASE Escola -- Criando um Banco de Dados

	CREATE TABLE Alunos ( -- Criando uma Tabela
		ID_Aluno INT,
		Nome_Aluno VARCHAR (100),
		Data_Matricula DATE
	)

	INSERT INTO Alunos (ID_Aluno, Nome_Aluno, Data_Matricula) -- Inserindo dados na tabela (Bônus)
	VALUES
	(1,'Breno','2023-06-19'),
	(2,'João','2023-06-19'),
	(3,'Maria','2023-06-19')

	-- ### READ ###

	SELECT * FROM Alunos -- Lendo uma tabela 

	-- ### UPDATE ###

	UPDATE Alunos -- Atualizando Tabela
	SET Nome_Aluno = 'Bruno'
	WHERE ID_Aluno = 1

	-- ### DELETE ###

	DELETE FROM Alunos -- Deletando uma linha
	WHERE ID_Aluno = 3

	DROP TABLE Alunos -- Deletando uma Tabela (Bônus)
	DROP DATABASE Escola -- Deletando um Banco de Dados (Bônus)
	