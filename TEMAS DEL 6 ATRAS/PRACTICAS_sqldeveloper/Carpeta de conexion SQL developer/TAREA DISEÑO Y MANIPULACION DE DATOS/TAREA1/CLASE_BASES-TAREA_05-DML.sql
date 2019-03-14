/*
    3. Utiliza las tablas depart y emple para:
        1. Añadir un nuevo departamento: 'Calidad', con localización Santander y código 11. 
           Añadir un empleado vinculado al departamento recién creado sus datos son:  7230, Aguirre, empleado.
           
        2. Aplicar un recorte presupuestario del 10% a todos los sueldos.
        
        3. Reasignar a los empleados del departamento de contabilidad (código 10) al departamento de producción  (código 40).
        
        4. Modificar a todos los empleados cuyo director es el  7566, pasan a ser subordinados del jefe de tovar.
        
        5. A los trabajadores cuyo oficio sea empleado se les adjudicara el mismo sueldo que tiene MUÑOZ.
        
        6. Todos los trabajadores cuyo departamento este localizado en Santander tendrán una comisión de 300€.
        
        7. Despedir a todos los empleados que trabajan para el departamento de ventas (código 30).
           
*/

/*1*/
INSERT INTO DEPART (DEPT_NO, DNOMBRE, LOC) VALUES( 11, 'CALIDAD', 'SANTANDER');
SELECT * FROM DEPART;
INSERT INTO EMPLE (EMP_NO, APELLIDO, OFICIO, SALARIO, DEPT_NO) VALUES (7230, 'Aguirre', 'empleado', 10000, SYSDATE, 11);

--no podemos poner null,porque esta la restriccion NOT NULL en la create
insert into EMPLE VALUES(7230, 'Aguirre', 'empleado', NULL, NULL, 0, NULL, (SELECT DEPT_NO FROM DEPART WHERE UPPDER(DNOMBRE)='CALIDAD'));
SELECT * FROM EMPLE;

/*2*/
SELECT EMP_NO, SALARIO FROM EMPLE;
UPDATE EMPLE SET SALARIO = SALARIO * 0.9;

--SALARIO= SALARIO-(SALARIO*0.1)

SELECT EMP_NO, SALARIO FROM EMPLE;

COMMIT;

/*3*/
SELECT EMP_NO, DEPT_NO FROM EMPLE WHERE DEPT_NO IN(10,40);

UPDATE EMPLE SET DEPT_NO = 40 WHERE DEPT_NO = 10;

/*---------------INDICAR CUANDO SE PONDRIA-----------
UPDATE EMPLE
  SET DEPT_NO=(SELECT DEPT_NO
      FROM DEPART
      WHERE UPPDER(DNOMBRE)='CONTABILIDAD')
WHERE DEPT_NO = (SELECT DEPT_NO
      FROM DEPART
      WHERE UPPER(DNOMBRE)='PRODUCCION')      
*/
SELECT EMP_NO, DEPT_NO FROM EMPLE WHERE DEPT_NO = 40;
COMMIT;

/*4*/
SELECT EMP_NO, ID_JEFE FROM EMPLE WHERE ID_JEFE=7566;

SELECT EMP_NO, ID_JEFE FROM EMPLE WHERE UPPDER(APELLIDO)='TOVAR';

--MODIFICACION
UPDATE EMPLE SET ID_JEFE=(SELECT ID_JEFE FROM EMPLE WHERE UPPDER(APELLIDO)='TOVAR') WHERE ID_JEFE=7566;

--PARA COMPROBAR LA MODIFICACION
SELECT EMP_NO, ID_JEFE FROM EMPLE WHERE ID_JEFE=(SELECT ID_JEFE FROM EMPLE WHERE UPPDER(APELLIDO)='TOVAR');

--FINAL TRANSACCION
COMMIT; --SI HA IDO OK

/*5*/
--CONOCER LA FILAS A MODIFICAR
SELECT EMP_NO,SALARIO FROM EMPLE WHERE UPPDER(OFICIO)='EMPLEADO';
SELECT EMP_NO,SALARIO FROM EMPLE WHERE UPPDER(APELLIDO)='MUÑOZ' ;

--MODIFICACION
UPDATE EMPLE SET SALARIO=(SELECT SALARIO FROM EMPLE WHERE UPPDER(APELLIDO)='MUÑOZ') WHERE UPPER(OFICIO)='EMPLEADO';

--PARA COMPROBAR LA MODIFICACION
SELECT EMP_NO,SALARIO FROM EMPLE WHERE UPPDER(OFICIO)='EMPLEADO';
SELECT EMP_NO,SALARIO FROM EMPLE WHERE UPPDER(APELLIDO)='MUÑOZ' ;

--FINAL TRANSACCION
COMMIT; --SI HA IDO OK

/*6*/
SELECT DEPT_NO
    FROM DEPART
    WHERE INITCAP(LOC)='Santander';
    
SELECT EMP_NO,DEPT_NO,COMISION_PCT
    FROM EMPLE
    WHERE DEPT_NO=(SELECT DEPT_NO
                    FROM DEPART
                    WHERE iNITCAP(LOC)='Santander');
--FALTA TERMINAR EL 6 Y HACER EL 7