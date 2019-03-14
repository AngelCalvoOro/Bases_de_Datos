/*EJ-1
Obtén la relación de todos los jugadores españoles o eslovenos de los Lakers.
NOTA: Las nacionalidades están en inglés.
*/
SELECT CODIGO,NOMBRE,PROCEDENCIA,ALTURA,PESO,POSICION,ID_EQUIPO
FROM JUGADORES
WHERE UPPER(PROCEDENCIA) IN ('SPAIN','SLOVENIA')
AND ID_EQUIPO IN(SELECT ID
                  FROM EQUIPOS
                  WHERE UPPER(NOMBRE) = 'LAKERS');
/*EJ-2
Seleccionar los jugadores cuyo peso esté entre 150 y 300 libras. 
Para cada jugador informa de su nombre, el nombre del equipo en el que juegan y su peso.
Saca el peso en Kilogramos teniendo en cuenta que una libra equivale a 0.4535 kilos.
NOTA: Recuerda que esta en inglés.
*/
SELECT J.NOMBRE,E.NOMBRE AS "NOMBRE EQUIPO",J.PESO*0.4535 AS PESO
FROM JUGADORES J, EQUIPOS E
WHERE J.PESO BETWEEN 150 AND 300
AND J.ID_EQUIPO = E.ID;
/*EJ-3
Averigua la relación de jugadores cuya procedencia es desconocida,
indicando el nombre del jugador y el nombre del equipo.
*/
SELECT J.NOMBRE,E.NOMBRE AS "NOMBRE EQUIPO",J.PROCEDENCIA
FROM JUGADORES J, EQUIPOS E
WHERE J.ID_EQUIPO = E.ID
AND J.PROCEDENCIA = NULL;
/*EJ-4
Obtén la relación de equipos cuyos nombres tengan 7 caracteres,
empiecen por R y terminen por S. Indica el nombre del equipo 
y a que conferencia pertenecen.
*/

/*EJ-5
Se necesita escoger a 25 jugadores para una campaña. 
Se ha decidido que serán los 25 primeros jugadores que devuelva el sistema.
NOTA: Hay que usar la pseudo columna del sistema rownum en Oracle y Limit en Mysql.
*/

/*EJ-6
Obtén la división y los equipos de la conferencia oeste ordenados por división, 
y dentro de cada división los equipos aparecerán ordenados alfabéticamente.
*/

/*EJ-7
Saca los nombres de los jugadores de la división SouthEast.
*/

/*EJ-8
Indica las divisiones de la NBA donde juegan jugadores españoles.
*/

/*EJ-9
José Calderon ha fichado por otro equipo los Pistons de Detroit 
de la conferencia:este, división Central, actualiza para dicho jugador este dato.
*/
UPDATE JUGADORES
SET ID_EQUIPO=(SELECT ID
                FROM EQUIPOS
                WHERE UPPER(NOMBRE) LIKE '%PISTONS%')
WHERE UPPER(NOMBRE) LIKE '%CALDERON%';
/*EJ-10
Jorge Garbajosa ya no juega en la NBA, actualiza los datos.
*/
DELETE FROM ESTARISTICAS
WHERE JUGADOR=(SELECT CODIGO
                FROM JUGADORES
                WHERE UPPER(NOMBRE)='JORGE GARBAJOSA');
                
DELETE FROM JUGADORES
WHERE UPPER(NOMBRE) = 'JORGE GARBAJOSA';
