/* ----------------------------------------------------------
Script 05: Cargar core desde staging (INSERT ... SELECT)
Proyecto : HR Employee Attrition
Autor    : Cristian Salinas
Fecha    : 2025-11-06
Objetivo :
  - Insertar datos en hr_core.employee transformando desde hr_stg.employee_raw
  - Convertir tipos (TRY_CONVERT) y mapear Yes/No a BIT (CASE)
Notas    :
  - Empezar con 5 columnas (flujo mínimo) y luego ampliar por tandas
  - Mantener NULLIF('','') para tratar vacíos como NULL
----------------------------------------------------------- */
