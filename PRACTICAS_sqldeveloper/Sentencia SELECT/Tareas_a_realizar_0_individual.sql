/*
1. Seleccionar de la tabla EMPLE aquellos empleados del departamento 20 y cuyo oficio
sea ‘ANALISTA’. La consulta se ha de ordenar de modo descendente por APELLIDO y 
también de manera descendente por número de empleado.
*/
SELECT *
FROM EMPLE
WHERE DEPT_NO ='20' AND UPPER(OFICIO)='ANALISTA'
ORDER BY APELLIDO DESC, EMP_NO DESC;

/*
2. Mostrar el apellido, oficio y fecha de alta de los empleados contratados entre
los meses de mayo y setiembre del año 1981. Obtener la salida ordenada por fecha de alta.
*/
SELECT APELLIDO, OFICIO, FECHA_ALTA
FROM EMPLE
WHERE FECHA_ALTA BETWEEN TO_DATE('01/05/1981','DD/MM/YYYY') 
                         AND TO_DATE ('30/09/1981','DD/MM/YYYY')
ORDER BY FECHA_ALTA DESC;
/*
3.  Mostrar los apellidos de los empleados concatenados con el oficio, separados 
por una coma y un espacio en blanco y ordenados por el apellido. Llamar a la columna 'EMPLE y OFI'.
*/
SELECT APELLIDO || ', ' ||OFICIO AS "EMPLE,OFI"
FROM EMPLE OFI;