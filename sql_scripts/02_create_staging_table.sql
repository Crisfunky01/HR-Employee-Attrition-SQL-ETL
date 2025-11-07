/* ----------------------------------------------------------
Script 02: Crear tabla staging (hr_stg.employee_raw)
Proyecto : HR Employee Attrition
Autor    : Cristian Salinas
Fecha    : 2025-11-06
Objetivo :
  - Definir tabla staging como copia cruda del CSV (todo texto)
  - Preparar estructura para cargas repetibles sin errores de tipo
Notas    :
  - Todas las columnas NVARCHAR para admitir datos sucios y vacíos
  - La tabla puede recrearse en cada ejecución (staging es desechable)
----------------------------------------------------------- */


USE portfolio;
GO

-- Staging: copia cruda del CSV (todo texto)
IF OBJECT_ID('hr_stg.employee_raw','U') IS NOT NULL
    DROP TABLE hr_stg.employee_raw;

CREATE TABLE hr_stg.employee_raw (
    Age                      NVARCHAR(50)  NULL,
    Attrition                NVARCHAR(50)  NULL,
    BusinessTravel           NVARCHAR(100) NULL,
    DailyRate                NVARCHAR(50)  NULL,
    Department               NVARCHAR(100) NULL,
    DistanceFromHome         NVARCHAR(50)  NULL,
    Education                NVARCHAR(50)  NULL,
    EducationField           NVARCHAR(100) NULL,
    EmployeeCount            NVARCHAR(50)  NULL,
    EmployeeNumber           NVARCHAR(50)  NULL,
    EnvironmentSatisfaction  NVARCHAR(50)  NULL,
    Gender                   NVARCHAR(20)  NULL,
    HourlyRate               NVARCHAR(50)  NULL,
    JobInvolvement           NVARCHAR(50)  NULL,
    JobLevel                 NVARCHAR(50)  NULL,
    JobRole                  NVARCHAR(100) NULL,
    JobSatisfaction          NVARCHAR(50)  NULL,
    MaritalStatus            NVARCHAR(50)  NULL,
    MonthlyIncome            NVARCHAR(50)  NULL,
    MonthlyRate              NVARCHAR(50)  NULL,
    NumCompaniesWorked       NVARCHAR(50)  NULL,
    Over18                   NVARCHAR(10)  NULL,
    OverTime                 NVARCHAR(10)  NULL,
    PercentSalaryHike        NVARCHAR(50)  NULL,
    PerformanceRating        NVARCHAR(50)  NULL,
    RelationshipSatisfaction NVARCHAR(50)  NULL,
    StandardHours            NVARCHAR(50)  NULL,
    StockOptionLevel         NVARCHAR(50)  NULL,
    TotalWorkingYears        NVARCHAR(50)  NULL,
    TrainingTimesLastYear    NVARCHAR(50)  NULL,
    WorkLifeBalance          NVARCHAR(50)  NULL,
    YearsAtCompany           NVARCHAR(50)  NULL,
    YearsInCurrentRole       NVARCHAR(50)  NULL,
    YearsSinceLastPromotion  NVARCHAR(50)  NULL,
    YearsWithCurrManager     NVARCHAR(50)  NULL
);
