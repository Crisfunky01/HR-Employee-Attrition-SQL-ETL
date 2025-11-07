# 📊 HR Employee Attrition — SQL ETL Project


EN:
The HR Employee Attrition dataset contains information about employees such as satisfaction, performance, and demographics.
The goal is to understand which factors contribute most to employee turnover and to prepare data for predictive modeling or BI dashboards.

ES:
El dataset HR Employee Attrition contiene información sobre empleados, como satisfacción, desempeño y datos demográficos.
El objetivo es identificar los factores que más influyen en la rotación de personal y preparar los datos para análisis predictivos o dashboards BI.
##  🧩 DESCRIPTION / DESCRIPCIÓN

EN

This project demonstrates a complete ETL (Extract, Transform, Load) process built in SQL Server using the HR Employee Attrition dataset.
The goal was to design a clean, structured, and reliable core database ready for analytical use in tools like Power BI.

Through this project, I applied Data Engineering and Data Quality principles to transform raw HR data into a trusted source of insights.
It includes staging and core layers, data profiling, type validation, and clean loading scripts.

ES

Este proyecto demuestra un proceso ETL completo (Extracción, Transformación y Carga) desarrollado en SQL Server utilizando el dataset HR Employee Attrition.
El objetivo fue diseñar una base de datos limpia, estructurada y confiable, lista para el análisis en herramientas como Power BI.

Durante el proyecto se aplicaron principios de Ingeniería de Datos y Calidad de Datos, transformando datos de RR.HH. en una fuente confiable de información analítica.
Incluye capas staging y core, perfilado de datos, validación de tipos y carga final limpia.
## ETL PROCESS OVERVIEW / FLUJO DEL PROCESO ETL

EN — ETL Process

Extract: Import the raw CSV file (HR-Employee-Attrition.csv) into a staging schema (hr_stg.employee_raw).

Transform: Validate and clean numeric, categorical, and logical fields using SQL functions such as TRY_CONVERT, NULLIF, and CASE.

Load: Create the final clean table (hr_core.employee) with appropriate data types, inserting transformed data from staging.

ES — Proceso ETL

Extracción: Se importa el archivo CSV original (HR-Employee-Attrition.csv) al esquema staging (hr_stg.employee_raw).

Transformación: Se validan y limpian campos numéricos, categóricos y lógicos utilizando funciones SQL como TRY_CONVERT, NULLIF y CASE.

Carga: Se crea la tabla final (hr_core.employee) con los tipos de datos adecuados, cargando los datos transformados desde staging.

## 🎬 ETL Process in Action / Proceso ETL en Acción  

EN — Example of the ETL flow in SQL Server, showing data validation and loading from the staging area to the core table.  
ES — Ejemplo del flujo ETL en SQL Server, mostrando la validación y carga de datos desde la capa staging hacia la tabla core.  

![ETL Animation](./assets/Animation.gif)

## 🗂️ PROJECT STRUCTURE / ESTRUCTURA DEL PROYECTO

HR-Employee-Attrition-SQL-ETL/
│
├── 📁 sql_scripts/
│   ├── 01_create_database_and_schemas.sql
│   ├── 02_create_staging_table.sql
│   ├── 03_load_and_validate_staging.sql
│   ├── 04_profile_and_define_core_structure.sql
│   └── 05_load_core_from_staging.sql
│
├── 📁 dataset/
│   └── HR-Employee-Attrition.csv
│
├── 📄 README.md
└── 📄 LICENSE




# 📊 HR Employee Attrition — SQL ETL Project  

![HR Employee Attrition Dataset](./assets/HR-Employee-Attrition.png)


## TOOLS & TECHNOLOGIES / HERRAMIENTAS Y TECNOLOGÍAS

EN — Tools Used

SQL Server (T-SQL)

SSMS Import Wizard

TRY_CONVERT, NULLIF, CASE, UNION ALL, INFORMATION_SCHEMA

Power BI (for future visualization)

ES — Herramientas Utilizadas

SQL Server (T-SQL)

Asistente de Importación de SSMS

TRY_CONVERT, NULLIF, CASE, UNION ALL, INFORMATION_SCHEMA

Power BI (para visualización futura)
## DATA VALIDATION / VALIDACIÓN DE DATOS

EN

Each stage includes checks for numeric ranges, categorical consistency, and valid logical mappings before loading into the core schema.
These steps ensure clean, standardized data — free from text artifacts, null inconsistencies, or out-of-range values.

ES

Cada etapa incluye validaciones de rangos numéricos, consistencia categórica y mapeos lógicos válidos antes de cargar los datos en el esquema core.
Estos pasos garantizan datos limpios y estandarizados, libres de errores de texto, nulos inconsistentes o valores fuera de rango.
##  Key Sql Commands Used / Comandos Sql Clave Utilizados

EN — Core SQL Techniques

Command	Purpose
CREATE SCHEMA	Define logical layers (staging, core) to organize data pipelines.
TRY_CONVERT()	Safely converts text to numeric types; returns NULL for invalid data.
NULLIF()	Replaces empty strings ('') with NULL to avoid conversion errors.
CASE WHEN	Used for logical mapping (e.g., Yes/No → 1/0).
INFORMATION_SCHEMA.COLUMNS	Metadata check for table structures.
UNION ALL	Combines results from multiple profiling queries.
COUNT(DISTINCT ...)	Evaluates cardinality of categorical columns.
LTRIM(RTRIM())	Cleans text fields by removing leading and trailing spaces.


ES — Técnicas SQL Principales

Comando	Propósito
CREATE SCHEMA	Define capas lógicas (staging, core) para organizar los flujos de datos.
TRY_CONVERT()	Convierte texto a valores numéricos de forma segura; devuelve NULL si no puede hacerlo.
NULLIF()	Reemplaza cadenas vacías ('') por NULL para evitar errores de conversión.
CASE WHEN	Utilizado para mapear valores lógicos (por ejemplo, Yes/No → 1/0).
INFORMATION_SCHEMA.COLUMNS	Permite revisar la estructura de las tablas creadas.
UNION ALL	Une resultados de varias consultas de perfilado.
COUNT(DISTINCT ...)	Calcula cuántos valores únicos tiene una columna categórica.
LTRIM(RTRIM())	Limpia espacios en blanco antes y después del texto
## 💡 NEXT STEPS / PRÓXIMOS PASOS

EN

Develop a Power BI dashboard using the cleaned dataset.

Add data quality KPIs and extended ETL automation with Python or SSIS.

Expand the structure to other HR datasets.

ES

Desarrollar un dashboard en Power BI con el dataset limpio.

Agregar KPIs de calidad de datos y automatización ETL con Python o SSIS.

Extender la estructura a otros datasets de RR.HH.
## LICENSE / LICENCIA

EN

This project is distributed under the MIT License, allowing free use for learning and reuse.

ES

Este proyecto se distribuye bajo la Licencia MIT, permitiendo su uso libre para aprendizaje y reutilización.
## About the Author / Sobre el Autor

## 👤 About the Author / Sobre el Autor  

**Cristian Salinas** — Industrial Engineer & Data Analyst  

🔗 **LinkedIn:** [https://www.linkedin.com/in/ingcrissalinas/](https://www.linkedin.com/in/ingcrissalinas/)  
🌐 **Portfolio:** [https://www.ingsalinas.com/](https://www.ingsalinas.com/)  
📂 **GitHub:** [https://github.com/Crisfunky01](https://github.com/Crisfunky01)





