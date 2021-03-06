/*EJERCICIO1*/
Select APELLIDO,OFICIO,LOC
from emple, depart
where emple.dept_no = depart.DEPT_NO AND UPPER(oficio)='ANALISTA';

/*EJERCICIO2*/
Select emple.EMP_NO,emple.APELLIDO,emple.OFICIO, depart.loc
from emple,depart
where depart.loc IN ('MADRID','BARCELONA')
and emple.dept_no = depart.DEPT_NO;

/*EJERCICIO3*/
SELECT EMPLEADO.EMP_NO, EMPLEADO.APELLIDO AS EMPLEADO,JEFE.APELLIDO AS JEFE
FROM EMPLE EMPLEADO, EMPLE JEFE
WHERE EMPLEADO.ID_JEFE = JEFE.EMP_NO
ORDER BY EMPLEADO.EMP_NO;

/*EJERCICIO4*/
Select apellido,oficio,loc
FROM EMPLE, DEPART
WHERE EMPLE.DEPT_NO= DEPART.DEPT_NO
and UPPER(oficio)='ANALISTA';

/*EJERCICIO5*/
SELECT EMPLEADO.EMP_NO, EMPLEADO.APELLIDO AS EMPLEADO,JEFE.APELLIDO AS JEFE
FROM EMPLE EMPLEADO, EMPLE JEFE
WHERE EMPLEADO.ID_JEFE = JEFE.EMP_NO(+)
ORDER BY EMPLEADO.EMP_NO;

/*EJERCICIO6*/
SELECT APELLIDO,DEPART.DEPT_NO
FROM EMPLE,DEPART
WHERE EMPLE.DEPT_NO(+)=DEPART.DEPT_NO;

