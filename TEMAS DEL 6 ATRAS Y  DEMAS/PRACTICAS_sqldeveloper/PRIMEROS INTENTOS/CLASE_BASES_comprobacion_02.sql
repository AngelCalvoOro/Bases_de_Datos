--Consultar la vista del diccionario USER_TABLES:SELECT
SELECT table_name
FROM USER_TABLES
WHERE UPPER(table_name) IN ('DEPART','EMPLE');

--Comprobar las columnas de cada tabla:DESC
DESC emple
DESC depart
--Comprobar las restrucciones(USER_CONSTRAINTS) y sus columnas(USER_CONS_COLUMNS):SELECT
SELECT table_name,constraint_name,constraint_type
FROM USER_CONSTRAINTS
WHERE UPPER(table_name) IN ('DEPART','EMPLE');

SELECT *
FROM USER_CONS_COLUMNS
WHERE UPPER(table_name) IN ('DEPART','EMPLE');

--Comprobar que hay datos(=filas) en las tablas: SELECT
SELECT *
FROM EMPLE;

SELECT * FROM DEPART;