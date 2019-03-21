-- EJERCICIO 1

DESC EMPLE 
/*MUESTRA LA ESTRUCTURA DE EMPLE*/


SELECT CONSTRAINT_TYPE, CONSTRAINT_NAME
FROM USER_CONSTRAINTS
WHERE upper(TABLE_NAME)='EMPLE';

--Para conocer las columnas que forman la restriccion
SELECT *
FROM USER_CONS_COLUMNS
WHERE upper(TABLE_NAME)='EMPLE';

/*CREAMOS LA TABLA EMPLEADOS30 con la misma estructura de la tabla EMPLE
pero con los datos de los empleados del departamento 30 de la tabla EMPLE.*/
DROP TABLE EMPLEADOS30;
/*CON ESTO ELIMINAMOS UNA POSIBLE TABLA LLAMADA EMPLEADOS30 
Y EN LA LINEA SIGUIENTE LA CREAMOS CON LA MISMA ESTRUCTURA QUE EMPLE*/
CREATE TABLE EMPLEADOS30
AS SELECT EMP_NO,APELLIDO,OFICIO,ID_JEFE,FECHA_ALTA,SALARIO,COMISION_PCT,DEPT_NO
FROM EMPLE
WHERE DEPT_NO=30;

SELECT * FROM EMPLEADOS30;
/*CON ESTO PODREMOS VER LA TABLA DE EMPLEADOS30 Y QUE LOS DATOS DE DEPT_NO 
PONE EN TODOS 30*/


SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME='EMPLEADOS30';

/*CREAR RESTRICCIONES QUE NO SE HAN CREADO AUTOMATICAMENTE*/
ALTER TABLE EMPLEADOS30
ADD CONSTRAINT emple30_empno_PK PRIMARY KEY(emp_no);

ALTER TABLE EMPLEADOS30
ADD CONSTRAINT EMPLE30_DEPART_FK FOREIGN KEY(dept_no)
                                 REFERENCES depart ON DELETE CASCADE;
ALTER TABLE EMPLEADOS30
ADD CONSTRAINT empleados30_id_jefe_fk FOREIGN KEY(id_jefe)
                                 REFERENCES EMPLEADOS30 ON DELETE CASCADE;

UPDATE EMPLEADOS30
SET JEFE=NULL
WHERE EMP_NO!= 7696;

SELECT * FROM EMPLEADOS30;

COMMIT;

ALTER TABLE EMPLEADOS30
ADD CONSTRAINT emple30_empno_jefe_fk FOREIGN KEY(jefe)
                                 REFERENCES EMPLEADOS30 ON DELETE SET NULL;

--EJERCICIO 2

--2.1

SELECT * FROM EMPLE;

INSERT INTO EMPLE (APELLIDO, FECHA_ALTA, EMP_NO, SALARIO, COMISION_PCT)
SELECT 'SAAVEDRA', SYSDATE, 2000, salario + salario * 0.2, COMISION_PCT, DEPT_NO
FROM EMPLE
WHERE upper(apellido)='SALA';

SELECT *
FROM EMPLE;


--2.2
UPDATE EMPLE
SET DEPT_NO=( SELECT DEPT_NO
              FROM EMPLE
              WHERE EMP_NO= 7499)
WHERE OFICIO =( SELECT OFICIO
                FROM EMPLE
                WHERE EMP_NO= 7566);

--EJERCICIO 3
DELETE FROM depart
WHERE dept_no NOT IN (SELECT DISTINCT dept_no
FROM emple);

--EJERCICIO 4
select * from depart;

DELETE FROM EMPLE
WHERE DEP_NO IN ( SELECT DEPT_NO
FROM DEPART
WHERE upper (DNOMBRE) like '%O%');

SELECT * FROM depart;
COMMIT;

--EJERCICIO 5
SELECT *
FROM emple
WHERE upper(apellido)='REY';

SELECT nvl(COMISION_PCT,0)
FROM emple
WHERE upper(apellido)='ARROYO';

--EXTRA
SELECT USER_CONSTRAINTS.CONSTRAINT_TYPE,USER_CONS_COLUMNS.*
FROM USER_CONSTRAINTS,USER_CONS_COLUMNS
WHERE USER_CONSTRAINTS.TABLE_NAME=USER_CONS_COLUMNS.TABLE_NAME
      AND UPPER(USER_CONS_COLUMNS.TABLE_NAME)='EMPLE';


------------------------------------------------------------------

DROP TABLE ALUMNOS CASCADE CONSTRAINTS;

CREATE TABLE ALUMNO (
DNI VARCHAR2 (10),
NOMBRE VARCHAR2B (30) NOT NULL,
NUMERO)

DESC ALUMNOS

DESC USER_CONTRAITS 

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, SEARCH_CONDITION
FROM USER_CONSTRAINTS
WHERE UPPER(TABLE_NAME)='ALUMNOS';

ALTER TABLE ALUMNOS ADD(
SEXO VARCHAR2 (1) NOT NULL
IMPORTE NUMBER(10,2)DEFAULT 0,
CONSTRAINT ALUMNO_SEXO_CK CHECK (SEXO IN ( 'M', 'F')));

DESC ALUMNOS;

SELECT * FROM ALUMNOS;
ALTER TABLE ALUMNOS DROP (EDAD);
SELECT * ALUMNOS;
ALTER TABLE ALUMNOS RENAME IMPORTE TO TASA;

SELECT * FROM ALUMNOS;