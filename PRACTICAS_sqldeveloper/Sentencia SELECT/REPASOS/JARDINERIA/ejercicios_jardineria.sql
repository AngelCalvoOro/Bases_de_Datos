/*EJ-1
 Sacar la ciudad y el tel�fono de las oficinas de Estados Unidos. 
 Obt�n la salida ordenada alfab�ticamente.
 */
SELECT  CIUDAD, TELEFONO
FROM OFICINAS
WHERE UPPER(PAIS) = 'EEUU' ORDER BY CIUDAD;

 /*EJ-2
 Obtener una lista con el c�digo de oficina, ciudad, regi�n y pa�s de aquellas
 oficinas que est�n en pa�ses que cuyo nombre empiece por �E�.
 */
 SELECT CODIGOOFICINA, CIUDAD,REGION,PAIS
 FROM OFICINAS
 WHERE UPPER(PAIS) LIKE 'E%';
 
 /*EJ-3
 Obtener los distintos estados por los que puede pasar un pedido.
 */
 SELECT DISTINCT UPPER(ESTADO)
 FROM PEDIDOS;
 
 /*EJ-4
Obtener el nombre, los dos apellidos concatenados bajo la cabecera apellidos 
y el puesto de los empleados que no representan a ning�n cliente.
*/
 SELECT NOMBRE, APELLIDO1 || ' ' || APELLIDO2 AS APELLIDOS , PUESTO
 FROM EMPLEADOS
 WHERE CODIGOEMPLEADO NOT IN(SELECT CodigoEmpleadoRepVentas
                              FROM CLIENTES);
 
 /*EJ-5
 Listar  el nombre y la ciudad de aquellos clientes que residan en 
 ciudades donde no hay oficinas. El resultado saldr� ordenado por la ciudad donde residen.
 */
 SELECT NOMBRECLIENTE, CIUDAD
 FROM CLIENTES
 WHERE CIUDAD NOT IN (SELECT CIUDAD FROM OFICINAS)ORDER BY CIUDAD;
 
 
 /*EJ-6
 Obtener un listado con los nombres de los clientes que han pedido m�s de 200 unidades
 de cualquier producto. El listado tendr� la cabecera �Nombre de los Clientes� y
 los nombres saldr� en formato T�tulo, es decir la primera letra de cada palabra en may�sculas.
 */
 SELECT NOMBRECLIENTE
 FROM CLIENTES
 WHERE CODIGOCLIENTE IN (SELECT CODIGOCLIENTE
                         FROM PEDIDOS P, DETALLEPEDIDOS D 
                         WHERE D.CODIGOPEDIDO = P.CODIGOPEDIDO 
                              AND D.CANTIDAD > 200);
 
 
 /*EJ-7
 Sacar un listado con el nombre de cada cliente y el nombre y dos apellidos
 de su representante de ventas bajo una cabecera �nica denominada Representante 
 (el nombre ir� separado por coma de los apellidos).
 */
 SELECT NOMBRECLIENTE, APELLIDO1 || ' ' || APELLIDO2 || ', ' || NOMBRE AS REPRESENTANTE
 FROM CLIENTES C, EMPLEADOS E
 WHERE C.CODIGOEMPLEADOREPVENTAS = E.CODIGOEMPLEADO;
 
 /*EJ-8 (ESTA REPETIDO EL EJERCICIO)
 Sacar un listado con el nombre de cada cliente y el nombre y dos apellidos de su
 representante de ventas bajo una cabecera �nica denominada Representante 
 (el nombre ir� separado por coma de los apellidos).
 */
  SELECT NOMBRECLIENTE, APELLIDO1 || ' ' || APELLIDO2 || ', ' || NOMBRE AS REPRESENTANTE
 FROM CLIENTES C, EMPLEADOS E
 WHERE C.CODIGOEMPLEADOREPVENTAS = E.CODIGOEMPLEADO;
 
 
 SELECT PESO*0.453 FROM JUGADOR;
 