/* ----------------------------------------------------------
Script 03: Cargar (wizard) y validar staging
Proyecto : HR Employee Attrition
Autor    : Cristian Salinas
Fecha    : 2025-11-06
Objetivo :
  - Registrar la carga del CSV en hr_stg.employee_raw
  - Verificar que los datos se hayan cargado correctamente
  - Analizar (perfilar) los datos numéricos para decidir tipos reales
Notas :
  - Carga realizada con SSMS Import Wizard
  - Source: HR-Employee-Attrition.csv
  - Delimiter: coma (,)
  - Header row = true
  - Destino: portfolio.hr_stg.employee_raw
----------------------------------------------------------- */

------------------------------------------------------------
-- 1️⃣ VALIDACIÓN BÁSICA: CANTIDAD DE FILAS Y MUESTRA
------------------------------------------------------------
USE portfolio;
GO

SELECT COUNT(*) AS total_rows
FROM hr_stg.employee_raw;   -- Esperado: ~1470 filas

SELECT TOP (5) *
FROM hr_stg.employee_raw;   -- Muestra de los primeros registros


------------------------------------------------------------
-- 2️⃣ PERFILADO NUMÉRICO (TANDA 1: MAGNITUDES)
-- Objetivo:
--   * Confirmar que columnas como Age o Income son realmente numéricas
--   * Ver sus valores mínimos y máximos
--   * Detectar si existen valores “sucios” (texto, símbolos, etc.)
------------------------------------------------------------

SELECT 
    'Age' AS ColumnName,
    MIN(TRY_CONVERT(INT, NULLIF(Age,''))) AS MinValue,   --Dame el valor mínimo de la columna Age, tratando de convertirla en número, e ignorando los valores vacíos (‘’)
    MAX(TRY_CONVERT(INT, NULLIF(Age,''))) AS MaxValue,
    SUM(CASE WHEN NULLIF(Age,'') IS NOT NULL 
             AND TRY_CONVERT(INT, NULLIF(Age,'')) IS NULL THEN 1 ELSE 0 END) AS NonNumericCount,  --Este mide cuántos registros no se pueden convertir a número (es decir, valores sucios).
    COUNT(DISTINCT NULLIF(Age,'')) AS DistinctRawCount
FROM hr_stg.employee_raw

UNION ALL

SELECT 
    'MonthlyIncome',
    MIN(TRY_CONVERT(INT, NULLIF(MonthlyIncome,''))),
    MAX(TRY_CONVERT(INT, NULLIF(MonthlyIncome,''))),
    SUM(CASE WHEN NULLIF(MonthlyIncome,'') IS NOT NULL 
             AND TRY_CONVERT(INT, NULLIF(MonthlyIncome,'')) IS NULL THEN 1 ELSE 0 END),
    COUNT(DISTINCT NULLIF(MonthlyIncome,''))
FROM hr_stg.employee_raw

UNION ALL

SELECT 
    'MonthlyRate',
    MIN(TRY_CONVERT(INT, NULLIF(MonthlyRate,''))),
    MAX(TRY_CONVERT(INT, NULLIF(MonthlyRate,''))),
    SUM(CASE WHEN NULLIF(MonthlyRate,'') IS NOT NULL 
             AND TRY_CONVERT(INT, NULLIF(MonthlyRate,'')) IS NULL THEN 1 ELSE 0 END),
    COUNT(DISTINCT NULLIF(MonthlyRate,''))
FROM hr_stg.employee_raw

UNION ALL

SELECT 
    'DailyRate',
    MIN(TRY_CONVERT(INT, NULLIF(DailyRate,''))),
    MAX(TRY_CONVERT(INT, NULLIF(DailyRate,''))),
    SUM(CASE WHEN NULLIF(DailyRate,'') IS NOT NULL 
             AND TRY_CONVERT(INT, NULLIF(DailyRate,'')) IS NULL THEN 1 ELSE 0 END),
    COUNT(DISTINCT NULLIF(DailyRate,''))
FROM hr_stg.employee_raw

UNION ALL

SELECT 
    'DistanceFromHome',
    MIN(TRY_CONVERT(INT, NULLIF(DistanceFromHome,''))),
    MAX(TRY_CONVERT(INT, NULLIF(DistanceFromHome,''))),
    SUM(CASE WHEN NULLIF(DistanceFromHome,'') IS NOT NULL 
             AND TRY_CONVERT(INT, NULLIF(DistanceFromHome,'')) IS NULL THEN 1 ELSE 0 END),
    COUNT(DISTINCT NULLIF(DistanceFromHome,''))
FROM hr_stg.employee_raw;


------------------------------------------------------------
-- 3️⃣ PERFILADO DE COLUMNAS “YES/NO” (CANDIDATAS A BIT)
-- Objetivo:
--   * Confirmar si realmente solo tienen dos valores: Yes / No
--   * Si es así, luego las convertiremos a BIT (1/0) en la tabla limpia
------------------------------------------------------------

SELECT DISTINCT LTRIM(RTRIM(Attrition)) AS Attrition_values
FROM hr_stg.employee_raw;

SELECT DISTINCT LTRIM(RTRIM(OverTime)) AS OverTime_values
FROM hr_stg.employee_raw;


------------------------------------------------------------
-- 4️⃣ PERFILADO CATEGÓRICO (OPCIONAL - TEXTO)
-- Objetivo:
--   * Saber cuántos valores distintos existen por columna de texto
--   * Nos servirá para decidir el tamaño de VARCHAR más adelante
------------------------------------------------------------

SELECT 'Department' AS ColumnName, COUNT(DISTINCT Department) AS DistinctValues
FROM hr_stg.employee_raw
UNION ALL
SELECT 'JobRole', COUNT(DISTINCT JobRole)
FROM hr_stg.employee_raw
UNION ALL
SELECT 'EducationField', COUNT(DISTINCT EducationField)
FROM hr_stg.employee_raw
UNION ALL
SELECT 'MaritalStatus', COUNT(DISTINCT MaritalStatus)
FROM hr_stg.employee_raw
UNION ALL
SELECT 'BusinessTravel', COUNT(DISTINCT BusinessTravel)
FROM hr_stg.employee_raw
UNION ALL
SELECT 'Gender', COUNT(DISTINCT Gender)
FROM hr_stg.employee_raw;


/* ----------------------------------------------------------
Perfilado numérico — Tanda 2 (escalas cortas 1–5)
Proyecto : HR Employee Attrition
Autor    : Cristian Salinas
Fecha    : 2025-11-07
Objetivo :
  - Verificar los rangos mínimos y máximos de columnas tipo "escala"
  - Confirmar si los valores son 1–4 o 1–5 (para decidir TINYINT)
  - Detectar si existen valores fuera de rango o no numéricos
----------------------------------------------------------- */

SELECT 
    'Education' AS ColumnName,
    MIN(TRY_CONVERT(INT, NULLIF(Education,''))) AS MinValue,
    MAX(TRY_CONVERT(INT, NULLIF(Education,''))) AS MaxValue,
    SUM(CASE WHEN NULLIF(Education,'') IS NOT NULL 
             AND TRY_CONVERT(INT, NULLIF(Education,'')) IS NULL THEN 1 ELSE 0 END) AS NonNumericCount,
    COUNT(DISTINCT NULLIF(Education,'')) AS DistinctRawCount
FROM hr_stg.employee_raw

UNION ALL

SELECT 
    'JobSatisfaction',
    MIN(TRY_CONVERT(INT, NULLIF(JobSatisfaction,''))),
    MAX(TRY_CONVERT(INT, NULLIF(JobSatisfaction,''))),
    SUM(CASE WHEN NULLIF(JobSatisfaction,'') IS NOT NULL 
             AND TRY_CONVERT(INT, NULLIF(JobSatisfaction,'')) IS NULL THEN 1 ELSE 0 END),
    COUNT(DISTINCT NULLIF(JobSatisfaction,''))
FROM hr_stg.employee_raw

UNION ALL

SELECT 
    'EnvironmentSatisfaction',
    MIN(TRY_CONVERT(INT, NULLIF(EnvironmentSatisfaction,''))),
    MAX(TRY_CONVERT(INT, NULLIF(EnvironmentSatisfaction,''))),
    SUM(CASE WHEN NULLIF(EnvironmentSatisfaction,'') IS NOT NULL 
             AND TRY_CONVERT(INT, NULLIF(EnvironmentSatisfaction,'')) IS NULL THEN 1 ELSE 0 END),
    COUNT(DISTINCT NULLIF(EnvironmentSatisfaction,''))
FROM hr_stg.employee_raw

UNION ALL

SELECT 
    'JobInvolvement',
    MIN(TRY_CONVERT(INT, NULLIF(JobInvolvement,''))),
    MAX(TRY_CONVERT(INT, NULLIF(JobInvolvement,''))),
    SUM(CASE WHEN NULLIF(JobInvolvement,'') IS NOT NULL 
             AND TRY_CONVERT(INT, NULLIF(JobInvolvement,'')) IS NULL THEN 1 ELSE 0 END),
    COUNT(DISTINCT NULLIF(JobInvolvement,''))
FROM hr_stg.employee_raw

UNION ALL

SELECT 
    'PerformanceRating',
    MIN(TRY_CONVERT(INT, NULLIF(PerformanceRating,''))),
    MAX(TRY_CONVERT(INT, NULLIF(PerformanceRating,''))),
    SUM(CASE WHEN NULLIF(PerformanceRating,'') IS NOT NULL 
             AND TRY_CONVERT(INT, NULLIF(PerformanceRating,'')) IS NULL THEN 1 ELSE 0 END),
    COUNT(DISTINCT NULLIF(PerformanceRating,''))
FROM hr_stg.employee_raw

UNION ALL

SELECT 
    'WorkLifeBalance',
    MIN(TRY_CONVERT(INT, NULLIF(WorkLifeBalance,''))),
    MAX(TRY_CONVERT(INT, NULLIF(WorkLifeBalance,''))),
    SUM(CASE WHEN NULLIF(WorkLifeBalance,'') IS NOT NULL 
             AND TRY_CONVERT(INT, NULLIF(WorkLifeBalance,'')) IS NULL THEN 1 ELSE 0 END),
    COUNT(DISTINCT NULLIF(WorkLifeBalance,''))
FROM hr_stg.employee_raw

UNION ALL

SELECT 
    'StockOptionLevel',
    MIN(TRY_CONVERT(INT, NULLIF(StockOptionLevel,''))),
    MAX(TRY_CONVERT(INT, NULLIF(StockOptionLevel,''))),
    SUM(CASE WHEN NULLIF(StockOptionLevel,'') IS NOT NULL 
             AND TRY_CONVERT(INT, NULLIF(StockOptionLevel,'')) IS NULL THEN 1 ELSE 0 END),
    COUNT(DISTINCT NULLIF(StockOptionLevel,''))
FROM hr_stg.employee_raw;


/* ----------------------------------------------------------
Perfilado numérico — Tanda 3 (historial laboral y experiencia)
Proyecto : HR Employee Attrition
Autor    : Cristian Salinas
Fecha    : 2025-11-07
Objetivo :
  - Analizar campos que representan años, conteos o frecuencia.
  - Verificar rangos y valores anómalos.
  - Confirmar tipo de dato adecuado (INT o TINYINT según rango).
----------------------------------------------------------- */

SELECT 
    'YearsAtCompany' AS ColumnName,
    MIN(TRY_CONVERT(INT, NULLIF(YearsAtCompany,''))) AS MinValue,
    MAX(TRY_CONVERT(INT, NULLIF(YearsAtCompany,''))) AS MaxValue,
    COUNT(DISTINCT NULLIF(YearsAtCompany,'')) AS DistinctCount
FROM hr_stg.employee_raw

UNION ALL

SELECT 
    'YearsInCurrentRole',
    MIN(TRY_CONVERT(INT, NULLIF(YearsInCurrentRole,''))),
    MAX(TRY_CONVERT(INT, NULLIF(YearsInCurrentRole,''))),
    COUNT(DISTINCT NULLIF(YearsInCurrentRole,''))
FROM hr_stg.employee_raw

UNION ALL

SELECT 
    'YearsSinceLastPromotion',
    MIN(TRY_CONVERT(INT, NULLIF(YearsSinceLastPromotion,''))),
    MAX(TRY_CONVERT(INT, NULLIF(YearsSinceLastPromotion,''))),
    COUNT(DISTINCT NULLIF(YearsSinceLastPromotion,''))
FROM hr_stg.employee_raw

UNION ALL

SELECT 
    'YearsWithCurrManager',
    MIN(TRY_CONVERT(INT, NULLIF(YearsWithCurrManager,''))),
    MAX(TRY_CONVERT(INT, NULLIF(YearsWithCurrManager,''))),
    COUNT(DISTINCT NULLIF(YearsWithCurrManager,''))
FROM hr_stg.employee_raw

UNION ALL

SELECT 
    'TotalWorkingYears',
    MIN(TRY_CONVERT(INT, NULLIF(TotalWorkingYears,''))),
    MAX(TRY_CONVERT(INT, NULLIF(TotalWorkingYears,''))),
    COUNT(DISTINCT NULLIF(TotalWorkingYears,''))
FROM hr_stg.employee_raw

UNION ALL

SELECT 
    'NumCompaniesWorked',
    MIN(TRY_CONVERT(INT, NULLIF(NumCompaniesWorked,''))),
    MAX(TRY_CONVERT(INT, NULLIF(NumCompaniesWorked,''))),
    COUNT(DISTINCT NULLIF(NumCompaniesWorked,''))
FROM hr_stg.employee_raw

UNION ALL

SELECT 
    'TrainingTimesLastYear',
    MIN(TRY_CONVERT(INT, NULLIF(TrainingTimesLastYear,''))),
    MAX(TRY_CONVERT(INT, NULLIF(TrainingTimesLastYear,''))),
    COUNT(DISTINCT NULLIF(TrainingTimesLastYear,''))
FROM hr_stg.employee_raw;


/* ----------------------------------------------------------
TANDA 4: Validación de tipos y consistencia (pre-ETL)
Proyecto : HR Employee Attrition
Autor    : Cristian Salinas
Fecha    : 2025-11-07
Objetivo :
  - Validar que las columnas en staging sean consistentes con
    los tipos definidos en hr_core.employee.
  - Confirmar que no haya texto en columnas numéricas ni
    valores fuera de rango antes del INSERT final.
----------------------------------------------------------- */

USE portfolio;
GO

-- 🔹 Validación columnas numéricas (INT / TINYINT)
SELECT 
    'Age' AS Col, COUNT(*) TotalRows,
    SUM(CASE WHEN TRY_CONVERT(INT, Age) IS NULL AND Age NOT IN ('', ' ') THEN 1 ELSE 0 END) NonNumeric,
    MIN(TRY_CONVERT(INT, Age)) MinVal,
    MAX(TRY_CONVERT(INT, Age)) MaxVal
FROM hr_stg.employee_raw

UNION ALL
SELECT 
    'MonthlyIncome',
    COUNT(*),
    SUM(CASE WHEN TRY_CONVERT(INT, MonthlyIncome) IS NULL AND MonthlyIncome NOT IN ('', ' ') THEN 1 ELSE 0 END),
    MIN(TRY_CONVERT(INT, MonthlyIncome)),
    MAX(TRY_CONVERT(INT, MonthlyIncome))
FROM hr_stg.employee_raw

UNION ALL
SELECT 
    'DistanceFromHome',
    COUNT(*),
    SUM(CASE WHEN TRY_CONVERT(INT, DistanceFromHome) IS NULL AND DistanceFromHome NOT IN ('', ' ') THEN 1 ELSE 0 END),
    MIN(TRY_CONVERT(INT, DistanceFromHome)),
    MAX(TRY_CONVERT(INT, DistanceFromHome))
FROM hr_stg.employee_raw;

-- 🔹 Validación de banderas Yes/No
SELECT DISTINCT LTRIM(RTRIM(Attrition)) AS DistinctValues, COUNT(*) AS Freq
FROM hr_stg.employee_raw
GROUP BY LTRIM(RTRIM(Attrition));

SELECT DISTINCT LTRIM(RTRIM(OverTime)) AS DistinctValues, COUNT(*) AS Freq
FROM hr_stg.employee_raw
GROUP BY LTRIM(RTRIM(OverTime));

-- 🔹 Validación columnas textuales (longitud máxima)
SELECT 
    'Department' AS Col,
    MAX(LEN(Department)) AS MaxLen,
    COUNT(DISTINCT Department) AS DistinctCount
FROM hr_stg.employee_raw

UNION ALL
SELECT 
    'JobRole',
    MAX(LEN(JobRole)),
    COUNT(DISTINCT JobRole)
FROM hr_stg.employee_raw

UNION ALL
SELECT 
    'EducationField',
    MAX(LEN(EducationField)),
    COUNT(DISTINCT EducationField)
FROM hr_stg.employee_raw;
