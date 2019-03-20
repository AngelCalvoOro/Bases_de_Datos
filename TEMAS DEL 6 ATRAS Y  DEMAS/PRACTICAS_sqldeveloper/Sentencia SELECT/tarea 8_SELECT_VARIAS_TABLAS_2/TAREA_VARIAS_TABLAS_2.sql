/*1.-Crear un listado único con todos los oficios que haya en el departamento 10.
Incluir la localidad del departamento en el resultado.*/
SELECT OFICIO, LOC
FROM EMPLE E,DEPART D
WHERE E.DEPT_NO = D.DEPT_NO
AND E.DEPT_NO=10;


/*4.-Mostrar el apellido, el nombre del departamento y 
el salario de cualquier empleado cuyo salario y comisión coincidan
con los de cualquier empleado que trabaje en Barcelona, incluidos los
que no tienen comisión.*/

SELECT E.APELLIDO, D.DNOMBRE, E.SALARIO,E.COMISION_PCT
FROM DEPART D, EMPLE E
WHERE D.DEPT_NO=E.DEPT_NO
AND (E.SALARIO,E.COMISION_PCT) IN (SELECT E.SALARIO, E.COMISION_PCT
                           FROM DEPART D, EMPLE E
                           WHERE E.DEPT_NO = D.DEPT_NO
                           AND UPPER(D.LOC)='BARCELONA');

/*Aquellos que tienen comision nula no aparecen*/
SELECT E.APELLIDO, D.DNOMBRE, E.SALARIO,E.COMISION_PCT
FROM DEPART D, EMPLE E
WHERE D.DEPT_NO=E.DEPT_NO
AND (E.SALARIO,NVL(E.COMISION_PCT,-1)) IN (SELECT E.SALARIO,NVL(E.COMISION_PCT,-1)
                           FROM DEPART D, EMPLE E
                           WHERE E.DEPT_NO = D.DEPT_NO
                           AND UPPER(D.LOC)='BARCELONA');

--POR ALGUNA RAZON LO DE LA COMISION FUNCIONA AL REVES