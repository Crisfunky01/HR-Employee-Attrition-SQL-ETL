/* Script 01: Create DB + Schemas (portfolio / hr_stg / hr_core) */
IF DB_ID('portfolio') IS NULL
    CREATE DATABASE portfolio;

/* ----------------------------------------------------------
Script 01: Crear base de datos y esquemas
Proyecto : HR Employee Attrition
Autor    : Cristian Salinas
Fecha    : 2025-11-06
Objetivo :
  - Crear la base de datos 'portfolio'
  - Crear los esquemas 'hr_stg' (staging) y 'hr_core' (core)
Notas    :
  - Script idempotente (se puede ejecutar múltiples veces)
----------------------------------------------------------- */



GO

USE portfolio;
GO

-- Schemas (staging y core)
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'hr_stg')
    EXEC('CREATE SCHEMA hr_stg');

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'hr_core')
    EXEC('CREATE SCHEMA hr_core');
GO
