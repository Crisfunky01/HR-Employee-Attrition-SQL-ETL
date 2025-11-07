/* ----------------------------------------------------------
Script 04: Definir estructura de tabla core (hr_core.employee)
Proyecto : HR Employee Attrition
Autor    : Cristian Salinas
Fecha    : 2025-11-07
Objetivo :
  - Crear la tabla limpia con tipos de datos correctos.
  - Se incluyen 34 columnas (1 descartada: EmployeeCount).
  - Basado en análisis y perfilado de etapas previas.
----------------------------------------------------------- */

USE portfolio;
GO

IF OBJECT_ID('hr_core.employee','U') IS NOT NULL
    DROP TABLE hr_core.employee;
GO

CREATE TABLE hr_core.employee (
    -- 🔹 Identificador principal
    EmployeeNumber          INT PRIMARY KEY,      -- ID único del empleado

    -- 🔹 Variables numéricas generales
    Age                     TINYINT NULL,
    DailyRate               INT NULL,
    DistanceFromHome        TINYINT NULL,
    MonthlyIncome           INT NULL,
    MonthlyRate             INT NULL,
    PercentSalaryHike       TINYINT NULL,

    -- 🔹 Variables ordinales (escalas de satisfacción y nivel)
    Education               TINYINT NULL,
    JobLevel                TINYINT NULL,
    JobSatisfaction         TINYINT NULL,
    EnvironmentSatisfaction TINYINT NULL,
    JobInvolvement          TINYINT NULL,
    PerformanceRating       TINYINT NULL,
    WorkLifeBalance         TINYINT NULL,
    StockOptionLevel        TINYINT NULL,
    RelationshipSatisfaction TINYINT NULL,

    -- 🔹 Variables de historial laboral y experiencia
    YearsAtCompany           TINYINT NULL,
    YearsInCurrentRole       TINYINT NULL,
    YearsSinceLastPromotion  TINYINT NULL,
    YearsWithCurrManager     TINYINT NULL,
    TotalWorkingYears        TINYINT NULL,
    NumCompaniesWorked       TINYINT NULL,
    TrainingTimesLastYear    TINYINT NULL,

    -- 🔹 Variables categóricas textuales
    BusinessTravel           NVARCHAR(100) NULL,
    Department               NVARCHAR(100) NULL,
    EducationField           NVARCHAR(100) NULL,
    Gender                   NVARCHAR(20) NULL,
    JobRole                  NVARCHAR(100) NULL,
    MaritalStatus            NVARCHAR(50) NULL,

    -- 🔹 Variables de control y banderas
    Attrition                BIT NULL,          -- Yes/No → 1/0
    OverTime                 BIT NULL,          -- Yes/No → 1/0
    Over18                   NVARCHAR(5) NULL,  -- constante actual, se mantiene por potencial uso futuro
    StandardHours            TINYINT NULL,      -- constante actual, se mantiene
    HourlyRate               INT NULL           -- posible uso analítico futuro
);
GO

SELECT *
FROM hr_core.employee


USE portfolio;
GO

SELECT TABLE_SCHEMA, TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'hr_core';

-- Para revisar la estructura (las columnas y tipos)

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'hr_core' AND TABLE_NAME = 'employee';


