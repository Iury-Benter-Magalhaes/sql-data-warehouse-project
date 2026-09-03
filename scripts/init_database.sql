/*
=============================================================
Criação do Banco de Dados e Schemas
=============================================================
Objetivo do Script:
    Este script cria um novo banco de dados chamado 'DataWarehouse' após verificar se ele já existe.
    Caso o banco já exista, ele é excluído e recriado. Além disso, o script cria três schemas
    dentro do banco: 'bronze', 'silver' e 'gold'.

AVISO:
    Executar este script irá excluir todo o banco de dados 'DataWarehouse', caso ele já exista.
    Todos os dados do banco serão permanentemente apagados. Prossiga com cautela
    e certifique-se de ter os backups necessários antes de executar este script.
*/

USE master;
GO

-- Excluir e recriar o banco de dados 'DataWarehouse'
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

-- Criar o banco de dados 'DataWarehouse'
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Criar Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
