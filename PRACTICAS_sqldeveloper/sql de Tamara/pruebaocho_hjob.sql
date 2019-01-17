/*1.	Seleccionar de la tabla EMPLE aquellos empleados del departamento 20 y cuyo oficio sea �ANALISTA�.
La consulta se ha de ordenar de modo descendente por APELLIDO y tambi�n de manera descendente por n�mero de empleado.*/

SELECT *
FROM EMPLE
WHERE DEPT=20 AND
    UPPER(OFICIO) = 'ANALISTA'
ORDER BY APELLIDO DESC, NUMEMPLE DESC;

/*2.	Mostrar el apellido, oficio y fecha de alta de los empleados contratados entre los meses de mayo y setiembre del a�o 1981.
Obtener la salida ordenada por fecha de alta.*/

SELECT APELLIDO,OFICIO,FECHA_ALTA
FROM EMPLEADO
WHERE FECHA_ALTA BETWEEN TO_DATE(01/05/1981,'DD/MM/YYYY') AND TO_DATE(30/09/1981,'DD/MM/YYYY')
ORDER BY FECHA_ALTA;

/*3. Mostrar los apellidos de los empleados concatenados con el oficio, separados por una coma y un espacio en blanco y
ordenados por el apellido. Llamar a la columna 'EMPLE y OFI'.*/

SELECT APELLIDO || ',' || OFICIO || "EMPLE y OFI"
FROM EMPLE
ORDER BY APELLIDO;


--------------------------

/*1.	 Averigua la estructura de la tabla EMPLE,  sus restricciones y las columnas que forman parte de cada restricci�n,
ya que se pretende crear una tabla de trabajo a partir de ella. Crear la tabla denominada EMPLEADOS30 con la misma estructura
de la tabla EMPLE pero con los datos de los empleados del departamento 30 de la tabla EMPLE.  Para ello utiliza CREATE TABLE �
AS SELECT �. �Se crean todas las restricciones? */

DESC EMPLE;

/*PARA CONOCER LAS RESTRICCIONES DE LAS TABLAS*/
SELECT CONSTRAINT_NAME,CONSTRAINT_TYPE
FROM USER_CONSTRAINTS
WHERE UPPER(TABLE_NAME)='EMPLE';

/*PARA CONOCER LAS RESTRICCIONES DE LAS COLUMNAS*/
SELECT *
FROM USER_CONS_COLUMNS
WHERE UPPER(TABLE_NAME)='EMPLE';


SELECT USER_CONSTRAINTS.CONSTRAINT_TYPE,USER_CONS_COLUMNS.*
FROM USER_CONSTRAINTS,USER_CONS_COLUMNS
WHERE USER_CONSTRAINTS.TABLE_NAME=USER_CONS_COLUMNS.TABLE_NAME
      AND UPPER(USER_CONS_COLUMNS.TABLE_NAME)='EMPLE';
      
      /*PARA CONOCER LAS RESTRICCIONES DE TIPO PK,FK..
      SI FUESE SOLAMENTE PARA UN CK VALDR�A CON EL USER_CONSTRAINTS*/


CREATE TABLE EMPLEADOS30 AS SELECT EMPLE FROM EMPLE,DEPART WHERE EMPLE.DEPT_NO = DEPART.DEPT_NO AND DEPT_NO=30;


/*2.	Vamos a realizar una �transacci�n� que tiene los siguientes pasos. Comprobaremos cada paso. Los pasos son::

1.	 Insertar en la tabla EMPLE a un empleado de apellido 'SAAVEDRA' con n�mero de empleado 2000. La fecha de alta ser� la
fecha actual, el SALARIO ser� el mismo salario que el del empleado de apellido 'SALA' m�s el 20 por 100 y el resto de datos
ser�n los mismos que los datos del empleado de apellido 'SALA'. Hazlo en un s�lo paso.*/

INSERT INTO EMPLE (NUMEMPLE,APELLIDO,FECHA_ALTA,SALARIO,COMISION_PCT,DEPT_NO)
SELECT (2000,'SAAVEDRA',SYSDATE,SALARIO= SALARIO + (SALARIO*0.2),COMISION_PCT,DEPT_NO
FROM EMPLE
WHERE UPPER(APELLIDO)='SALA';

SELECT *
FROM EMPLE;


/*2.	Actualiza la tabla EMPLE, cambiando el n�mero de departamento, para todos los empleados que tenga el mismo oficio que el
empleado 7566, por el n�mero de departamento actual del empleado 7499.*/

UPDATE EMPLE
SET DEPT_NO = (SELECT DEPT_NO 
                FROM EMPLE 
                WHERE EMP_NO=7499) 
WHERE OFICIO = (SELECT OFICIO 
                FROM EMPLE
                WHERE EMP_NO=7566);

/*3.	Borrar todos los departamentos de la tabla DEPART para los cuales no existan empleados en EMPLE.*/

DELETE FROM DEPART
WHERE DEPT_NO NOT IN (SELECT DISTINCT DEPT_NO
                FROM EMPLE);
              
              --NO HEMOS PUESTO EL WHERE DENTRO DE LA SUBCONSULTA PORQUE NO HAY NINGUN EMP_NO QUE NO TENGA VALOR PORQUE ES PK
              --PONEMOS NOT IN PORQUE AL FINAL QUEREMOS ELIMINAR LOS DATOS QUE NO EST�N DENTRO DE ESOS DEPARTAMENTOS

/*4.	Eliminar a todos los empleados que est�n en un departamento cuyo nombre contiene una 'O'.*/

SELECT * FROM EMPLE;

SELECT DEPT_NO
FROM DEPART
WHERE UPPER(DNOMBRE) LIKE '%O%';

DELETE FROM EMPLE
WHERE DEPT_NO IN (SELECT DEPT_NO -- PONEMOS EL IN PORQUE AL EJECUTARLO NOS PONE "SINGLE-ROW SUBQUERY RETURNS MORE THAN ONE ROW"
                  FROM DEPART
                  WHERE UPPER(DNOMBRE) LIKE '%O%'); 
                  
SELECT * FROM DEPART;

/*5.	Incrementa el salario del empleado de apellido REY. Su nuevo salario ser� el que ten�a antes m�s un importe 
que corresponde con la comisi�n que tiene ARROYO.*/

SELECT * FROM EMPLE WHERE UPPER(APELLIDO)='REY';

SELECT NVL(COMISION_PCT,0) --EN CASO DE QUE FUESE NULO LE PONEMOS EL NVL PARA QUE NO SE QUEDE REY SIN SALARIO
FROM EMPLE 
WHERE UPPER(APELLIDO)='ARROYO';

UPDATE EMPLE
SET SALARIO = SALARIO + (SELECT COMISION_PCT 
                          FROM EMPLE
                          WHERE UPPER(APELLIDO)='ARROYO')
WHERE UPPER(APELLIDO)='REY';


/*3.	Deshaz toda la transacci�n.*/

ROLLBACK;


--------------------------------
/*https://gist.github.com/uclides/0d044299785ba007adc4

OTRAS ARIKETAS PARA HACER*/


------------------


/*1.	La Gerencia desea contar con informaci�n de los jefes a cargo de cada empleado.
Para ello se requiere que construya una consulta que muestre el apellido del empleado 
con el alias empleado y la identificaci�n de su jefe con la cabecera jefe. 
Si el empleado NO posee jefe se debe mostrar el mensaje NO TIENE JEFE. 
La informaci�n se debe mostrar ordenada en forma
descendente por  identificaci�n del jefe. */

SELECT APELLIDO AS EMPLEADO,ID_JEFE AS JEFE
FROM EMPLE
WHERE ID_JEFE IS NULL
ORDER BY ID_JEFE DESC;

/*2.	 Los empleados han planteado la necesidad de que se les aumente el valor de movilizaci�n mensual que se les debe pagar por ley.
Por ello, la Gerencia ha definido que el valor de movilizaci�n ser� un porcentaje del salario mensual del empleado. 
Este porcentaje corresponder� por cada 1000 del salario de cada empleado es decir, si el salario del empleado es 8200 el porcentaje
de aumento de movilizaci�n ser� de 8%, si el salario del empleado es de 15000 el porcentaje de aumento ser� de 15% etc.
Como primera etapa se debe generar un informe que muestre la identificaci�n del empleado, su salario actual y el porcentaje del 
salario que le corresponder� como movilizaci�n. Dar a cada columna de salida las cabeceras empleado, salario y "porcentaje de
movilizaci�n� respectivamente.*/



/*3.	 La empresa ha decido modificar las pol�ticas de asignaci�n de usuario y clave a acceso del personal a los diferentes 
sistemas inform�ticos que existen. Desde el pr�ximo mes la pol�tica de asignaci�n de nombres de usuarios y claves ser�:

?	Nombre de Usuario: corresponder� a las tres primeras letras del apellido del empleado (la primera en may�scula y 
las otras dos en min�sculas), seguido de la longitud del apellido y de la identificaci�n del trabajo que desempe�a.

?	Clave del Usuario: corresponder� al mes y a�o (en 4 d�gitos) de contrato del empleado seguido de las dos �ltimas letras
de su apellido en may�sculas.

Se nos pide construir una consulta que permita obtener el nombre del empleado, su apellido, identificaci�n de su trabajo,
nombre de usuario y clave. La informaci�n se requiere ordenada por apellido en forma ascendente*/




/*1.	 La empresa desea que se automatice algunos de los procesos involucrados en el c�lculo de las remuneraciones mensuales 
de los empleados. En un esfuerzo por mejorar las necesidades econ�micas de los empleados, se desea saber el costo que significar�a
efectuar un aumento en sus salarios. Para ello, se ha pensado que el porcentaje de reajuste corresponder� al primer d�gito del
salario actual de cada empleado es decir, si el empleado posee un salario de 24000 su aumento ser� de 2%, si su salario es de 7500
su aumento ser� de 7% etc. Se requiere de un informe que muestre el nombre y apellido del empleado concatenado, salario actual y 
porcentaje de reajuste. Dar a cada columna de salida el alias correspondiente y formato a los valores del salario 999,999.999 y
el reajuste 9,999.999.

NOTA: Tener en cuenta si nuestra base de datos utiliza o no el sistema anglosajon a la hora de elaborar la mascara formato de salida.*/





/*2.	Se nos pide que realicemos una consulta que implementar el c�lculo de las comisiones y  salario total de cada uno de
los empleados considerando las siguientes especificaciones:

?	Si el empleado posee porcentaje de comisi�n se debe mostrar, de lo contrario se debe mostrar el literal 'SIN COMISION'.


?	El valor de la comisi�n  corresponder� al valor del salario actual multiplicado por el porcentaje de comisi�n. Si el empleado
no posee porcentaje de comisi�n se debe mostrar el valor cero.


?	 El valor salario total corresponder� a la suma del valor del salario actual m�s el valor de la comisi�n. Si el empleado 
no posee omisi�n el salario total ser� igual al valor del salario actual.


En esta primera etapa, solo se requiere de un listado que muestre  la identificaci�n del empleado con el alias id_emp,
el valor del salario actual, el porcentaje de comisi�n, el valor de la comisi�n calculada y el valor del salario total calculado.*/



/*1.	Mostrar el n�mero de empleado, la fecha de alta en la empresa, el n�mero de meses que lleva empleado, la fecha de revisi�n
de los 6 meses, el primer viernes tras la fecha de alta y el �ltimo d�a del mes de contrataci�n para todos los trabajadores que 
llevan menos de 460 meses.
Nota: Mira en la teor�a las funciones: MONTHS_BETWEEN, ADD_MONTH, NEXT_DAY,  y LAST_DAY.*/



------------------------------

/*1.	Mostrar la media, salario mayor, menor y suma de salarios mensuales de todos los comerciales.*/

SELECT AVG (SALARIO), MAX(SALARIO), MIN (SALARIO), COUNT (SALARIO)
FROM COMERCIALES;

/*2.	Mostrar la fecha de mayor antig�edad y la de menor antig�edad.*/

SELECT LEAST(FECHA),GREATEST (FECHA)
FROM EMPLE;

/*3.	Mostrar el primer apellido y el �ltimo de la lista alfab�tica de todos los empleados.*/


/*4.	Mostrar el n�mero de empleados del departamento 40.*/

SELECT COUNT(NUM_EMPLE)
FROM EMPLE
WHERE DEPT = 40;

/*5.	Mostrar el n�mero de empleados del departamento 30 que pueden percibir comisi�n.*/

SELECT COUNT (NUM_EMPLE)
FROM EMPLE
WHERE DEPT_NO = 30 AND COMISION_PCT IS NOT NULL;

/*6.	Visualizar la cantidad de departamento distintos que hay en la tabla empleados.*/

SELECT DISTINCT DEPT_NOMBRE
FROM EMPLE;

/*7.	Visualizar el n�mero de empleados que hay en cada departamento. Mostrar las columnas n� departamento y n� de empleados
-cantidad-.*/

SELECT COUNT (NUM_EMPLE)
FROM EMPLE,DEPART
WHERE EMPLE.--- = DEPART.---;

/*8.	Visualizar ( n� departamento y n� de empleados -cantidad-) s�lo de los departamentos con m�s de 4 empleados.*/

SELECT COD_DEPART,COUNT (NUM_EMPLE)
FROM EMPLE
WHERE COUNT(NUM_EMPLE)>4;

/*    1. Visualizar ( n� departamento y n� de empleados) s�lo los departamentos con m�s de 4 empleados,
pero ordenar la salida en descendente por n�mero de empleados. */



/*  2. Partiendo de la tabla EMPLE, obtener la suma de salarios, el salario m�ximo y el salario 
m�nimo por cada departamento (n� departamento).*/

SELECT COUNT(SALARIO),MAX(SALARIO),MIN(SALARIO),DEPT_NO
FROM EMPLE;


/*  3. Calcular el n�mero de empleados que realizan cada oficio por departamento.
Los datos que se visualizan son: departamento, oficio y n�mero de empleados.*/

SELECT NUM_EMPLE

/*  4. Visualizar el valor num�rico que nos indique el n�mero de empleados que hay en el
departamento que m�s empleados hay.*/


/*  5. Mostrar los n�meros de departamento y el salario medio para los departamentos cuyos
salarios m�ximos sean mayores de 250000.*/


/*  6. Visualizar el salario medio m�ximo por  departamento.*/


/*    7. Escribir una consulta para mostrar el n�mero de personas con el mismo oficio.*/


/*    8. Mostrar el n�mero de director y el salario del empleado peor pagado para ese director.
Excluir los empleados de los que se desconozca el director. Excluir los grupos en los que el
salario m�nimo sea 200000 o menos. Ordenar el resultado por salario de forma descendente.*/