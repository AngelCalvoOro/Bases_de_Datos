/*EJ-1
 Sacar la ciudad y el teléfono de las oficinas de Estados Unidos. 
 Obtén la salida ordenada alfabéticamente.
 */
SELECT  CIUDAD, TELEFONO
FROM OFICINAS
WHERE UPPER(PAIS) = 'EEUU' ORDER BY CIUDAD;

 /*EJ-2
 Obtener una lista con el código de oficina, ciudad, región y país de aquellas
 oficinas que estén en países que cuyo nombre empiece por “E”.
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
y el puesto de los empleados que no representan a ningún cliente.
*/
 SELECT NOMBRE, APELLIDO1 || ' ' || APELLIDO2 AS APELLIDOS , PUESTO
 FROM EMPLEADOS
 WHERE CODIGOEMPLEADO NOT IN(SELECT CodigoEmpleadoRepVentas
                              FROM CLIENTES);
 
 /*EJ-5
 Listar  el nombre y la ciudad de aquellos clientes que residan en 
 ciudades donde no hay oficinas. El resultado saldrá ordenado por la ciudad donde residen.
 */
 SELECT NOMBRECLIENTE, CIUDAD
 FROM CLIENTES
 WHERE CIUDAD NOT IN (SELECT CIUDAD FROM OFICINAS)ORDER BY CIUDAD;
 
 
 /*EJ-6
 Obtener un listado con los nombres de los clientes que han pedido más de 200 unidades
 de cualquier producto. El listado tendrá la cabecera “Nombre de los Clientes” y
 los nombres saldrá en formato Título, es decir la primera letra de cada palabra en mayúsculas.
 */
 SELECT NOMBRECLIENTE
 FROM CLIENTES
 WHERE CODIGOCLIENTE IN (SELECT CODIGOCLIENTE
                         FROM PEDIDOS P, DETALLEPEDIDOS D 
                         WHERE D.CODIGOPEDIDO = P.CODIGOPEDIDO 
                              AND D.CANTIDAD > 200);
 
 
 /*EJ-7
 Sacar un listado con el nombre de cada cliente y el nombre y dos apellidos
 de su representante de ventas bajo una cabecera única denominada Representante 
 (el nombre irá separado por coma de los apellidos).
 */
 SELECT NOMBRECLIENTE, APELLIDO1 || ' ' || APELLIDO2 || ', ' || NOMBRE AS REPRESENTANTE
 FROM CLIENTES C, EMPLEADOS E
 WHERE C.CODIGOEMPLEADOREPVENTAS = E.CODIGOEMPLEADO;
 
 /*EJ-8 (ESTA REPETIDO EL EJERCICIO)
 Sacar un listado con el nombre de cada cliente y el nombre y dos apellidos de su
 representante de ventas bajo una cabecera única denominada Representante 
 (el nombre irá separado por coma de los apellidos).
 */
  SELECT NOMBRECLIENTE, APELLIDO1 || ' ' || APELLIDO2 || ', ' || NOMBRE AS REPRESENTANTE
 FROM CLIENTES C, EMPLEADOS E
 WHERE C.CODIGOEMPLEADOREPVENTAS = E.CODIGOEMPLEADO;
 
 
 SELECT PESO*0.453 FROM JUGADOR;
 