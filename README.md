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

![SQL Server](https://img.shields.io/badge/SQL%20Server-T%20SQL-CC2927?logo=microsoft-sql-server&logoColor=white)
![ETL](https://img.shields.io/badge/Process-ETL-blue?logo=database&logoColor=white)
![EN&ES](https://img.shields.io/badge/EN%20%26%20ES-Bilingual-darkgreen)
![Last Commit](https://img.shields.io/github/last-commit/Crisfunky01/HR-Employee-Attrition-SQL-ETL?color=brightgreen)
![Repo Size](https://img.shields.io/github/repo-size/Crisfunky01/HR-Employee-Attrition-SQL-ETL?color=blue)


## ⚙️ ETL PROCESS OVERVIEW / FLUJO DEL PROCESO ETL

### EN — ETL Process

**1️⃣ Extract**  
Import the original CSV file **(`HR-Employee-Attrition.csv`)** into a staging schema (`hr_stg.employee_raw`).  
At this stage, the dataset is loaded *as-is*, preserving its original structure for inspection and profiling.

**2️⃣ Transform (Profiling & Structuring)**  
Perform data profiling to understand column types, value ranges, and categorical distributions.  
Define appropriate SQL data types (`INT`, `TINYINT`, `BIT`, `NVARCHAR`) and prepare the mapping logic for the core table.  
No data cleaning or modification was applied — the focus was on structure validation and type consistency.

**3️⃣ Load**  
Create the clean and typed table **(`hr_core.employee`)** with well-defined columns.  
Insert data directly from the staging table while converting types safely using functions like `TRY_CONVERT` and `NULLIF`.

---

### ES — Proceso ETL

**1️⃣ Extracción**  
Se importa el archivo CSV original **(`HR-Employee-Attrition.csv`)** al esquema staging (`hr_stg.employee_raw`).  
En esta etapa, el dataset se carga tal como está, conservando su estructura original para inspección y perfilado.

**2️⃣ Transformación (Perfilado y Estructuración)**  
Se realiza un perfilado de datos para comprender los tipos de columna, rangos de valores y distribuciones categóricas.  
Se definen los tipos de datos adecuados en SQL (`INT`, `TINYINT`, `BIT`, `NVARCHAR`) y la lógica de mapeo hacia la tabla core.  
No se aplicó limpieza de datos — el foco estuvo en validar la estructura y consistencia de tipos.

**3️⃣ Carga**  
Se crea la tabla limpia y tipificada **(`hr_core.employee`)** con columnas bien definidas.  
Los datos se insertan directamente desde la tabla staging utilizando conversiones seguras con `TRY_CONVERT` y `NULLIF`.



## 🎬 ETL Process in Action / Proceso ETL en Acción  

EN — Example of the ETL flow in SQL Server, showing data validation and loading from the staging area to the core table.  
ES — Ejemplo del flujo ETL en SQL Server, mostrando la validación y carga de datos desde la capa staging hacia la tabla core.  

![ETL Animation](./assets/Animation.gif)

 ## 📁 PROJECT STRUCTURE / ESTRUCTURA DEL PROYECTO
 
 <pre> ``` HR-Employee-Attrition-SQL-ETL/ │
      ├── 📁 sql_scripts/ │ 
        ├── 01_create_database_and_schemas.sql │
        ├── 02_create_staging_table.sql │ 
        ├── 03_load_and_validate_staging.sql │ 
        ├── 04_profile_and_define_core_structure.sql │ 
        └── 05_load_core_from_staging.sql │
      ├── 📁 dataset/ │ 
        └── HR-Employee-Attrition.csv │
  ├── 📄 README.md 
  └── 📄 LICENSE ``` </pre>


# 📊 HR Employee Attrition — SQL ETL Project  

![HR Employee Attrition Dataset](./assets/HR-Employee-Attrition.png)

## 🧰 TOOLS & TECHNOLOGIES / HERRAMIENTAS Y TECNOLOGÍAS

### EN — Tools Used
-  **SQL Server (T-SQL)** — Main environment for database creation, profiling, and ETL logic.  
-  **SQL Server Management Studio (SSMS)** — Used to manage scripts, run profiling queries, and inspect results.  
-  **Import Wizard (SSMS)** — For initial CSV data load into the staging schema.  
-  **Core SQL functions:** `TRY_CONVERT`, `NULLIF`, `CASE`, `UNION ALL`, and `INFORMATION_SCHEMA` for validation, conversion, and metadata inspection.  
-  **Power BI** *(planned next step)* — For connecting and visualizing the cleaned dataset.

---

### ES — Herramientas Utilizadas
-  **SQL Server (T-SQL)** — Entorno principal para la creación de bases de datos, perfilado y lógica ETL.  
-  **SQL Server Management Studio (SSMS)** — Utilizado para ejecutar scripts, consultas de validación y revisar resultados.  
-  **Asistente de Importación de SSMS** — Usado para cargar el archivo CSV inicial en el esquema staging.  
-  **Funciones SQL principales:** `TRY_CONVERT`, `NULLIF`, `CASE`, `UNION ALL` e `INFORMATION_SCHEMA` para validación, conversión y revisión de metadatos.  
-  **Power BI** *(planificado como siguiente etapa)* — Para conectar y visualizar el dataset limpio.



## DATA VALIDATION / VALIDACIÓN DE DATOS

EN

Each stage includes checks for numeric ranges, categorical consistency, and valid logical mappings before loading into the core schema.
These steps ensure clean, standardized data — free from text artifacts, null inconsistencies, or out-of-range values.

ES

Cada etapa incluye validaciones de rangos numéricos, consistencia categórica y mapeos lógicos válidos antes de cargar los datos en el esquema core.
Estos pasos garantizan datos limpios y estandarizados, libres de errores de texto, nulos inconsistentes o valores fuera de rango.
##  Key Sql Commands Used / Comandos Sql Clave Utilizados

EN — Core SQL Techniques

## 🧩 Key SQL Commands Used / Comandos SQL Clave Utilizados

### EN — Core SQL Techniques

| Command | Purpose |
|----------|----------|
| `CREATE SCHEMA` | Defines logical layers (staging, core) to organize data pipelines. |
| `TRY_CONVERT()` | Safely converts text to numeric types; returns `NULL` for invalid data. |
| `NULLIF()` | Replaces empty strings (`''`) with `NULL` to avoid conversion errors. |
| `CASE WHEN` | Used for logical mapping (e.g., `Yes/No → 1/0`). |
| `INFORMATION_SCHEMA.COLUMNS` | Metadata check for table structures. |
| `UNION ALL` | Combines results from multiple profiling queries. |
| `COUNT(DISTINCT ...)` | Evaluates cardinality of categorical columns. |
| `LTRIM(RTRIM())` | Cleans text fields by removing leading and trailing spaces. |


### ES — Técnicas SQL Principales

| Comando | Propósito |
|----------|------------|
| `CREATE SCHEMA` | Define capas lógicas (staging, core) para organizar los flujos de datos. |
| `TRY_CONVERT()` | Convierte texto a valores numéricos de forma segura; devuelve `NULL` si no puede hacerlo. |
| `NULLIF()` | Reemplaza cadenas vacías (`''`) por `NULL` para evitar errores de conversión. |
| `CASE WHEN` | Se usa para mapear valores lógicos (por ejemplo, `Yes/No → 1/0`). |
| `INFORMATION_SCHEMA.COLUMNS` | Permite revisar la estructura de las tablas creadas. |
| `UNION ALL` | Une resultados de varias consultas de perfilado. |
| `COUNT(DISTINCT ...)` | Calcula cuántos valores únicos tiene una columna categórica. |
| `LTRIM(RTRIM())` | Limpia espacios en blanco antes y después del texto. |

## 💡 NEXT STEPS / PRÓXIMOS PASOS

### EN — Next Steps
-  **Create a Power BI dashboard** connected to the cleaned SQL dataset to visualize key HR indicators such as Attrition Rate and Satisfaction Levels.  
-  **Add more data validation layers**, including detection of outliers and null-pattern analysis directly in SQL.  
-  **Expand the ETL process** to include automated refresh or incremental loads (using SSMS jobs or Python scripts).  
-  **Document data lineage and assumptions** to make the project reproducible for analytical use.

---

### ES — Próximos Pasos
-  **Crear un dashboard en Power BI** conectado al dataset limpio en SQL para visualizar indicadores clave como Tasa de Rotación y Niveles de Satisfacción.  
-  **Agregar más validaciones de datos**, incluyendo detección de valores atípicos y análisis de patrones nulos directamente en SQL.  
-  **Ampliar el proceso ETL** para incluir actualizaciones automáticas o cargas incrementales (usando tareas en SSMS o scripts en Python).  
-  **Documentar el linaje de datos y supuestos** para que el proyecto sea reproducible y útil en análisis futuros.



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

















