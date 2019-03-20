/*EJ-1
Obt�n la relaci�n de todos los jugadores espa�oles o eslovenos de los Lakers.
NOTA: Las nacionalidades est�n en ingl�s.
*/
SELECT CODIGO,NOMBRE,PROCEDENCIA,ALTURA,PESO,POSICION,ID_EQUIPO
FROM JUGADORES
WHERE UPPER(PROCEDENCIA) IN ('SPAIN','SLOVENIA')
AND ID_EQUIPO IN(SELECT ID
                  FROM EQUIPOS
                  WHERE UPPER(NOMBRE) = 'LAKERS');
/*EJ-2
Seleccionar los jugadores cuyo peso est� entre 150 y 300 libras. 
Para cada jugador informa de su nombre, el nombre del equipo en el que juegan y su peso.
Saca el peso en Kilogramos teniendo en cuenta que una libra equivale a 0.4535 kilos.
NOTA: Recuerda que esta en ingl�s.
*/
SELECT J.NOMBRE,E.NOMBRE AS "NOMBRE EQUIPO",J.PESO*0.4535 AS PESO
FROM JUGADORES J, EQUIPOS E
WHERE J.PESO BETWEEN 150 AND 300
AND J.ID_EQUIPO = E.ID;
/*EJ-3
Averigua la relaci�n de jugadores cuya procedencia es desconocida,
indicando el nombre del jugador y el nombre del equipo.
*/
SELECT J.NOMBRE,E.NOMBRE AS "NOMBRE EQUIPO",J.PROCEDENCIA
FROM JUGADORES J, EQUIPOS E
WHERE J.ID_EQUIPO = E.ID
AND J.PROCEDENCIA = NULL;
/*EJ-4
Obt�n la relaci�n de equipos cuyos nombres tengan 7 caracteres,
empiecen por R y terminen por S. Indica el nombre del equipo 
y a que conferencia pertenecen.
*/

/*EJ-5
Se necesita escoger a 25 jugadores para una campa�a. 
Se ha decidido que ser�n los 25 primeros jugadores que devuelva el sistema.
NOTA: Hay que usar la pseudo columna del sistema rownum en Oracle y Limit en Mysql.
*/

/*EJ-6
Obt�n la divisi�n y los equipos de la conferencia oeste ordenados por divisi�n, 
y dentro de cada divisi�n los equipos aparecer�n ordenados alfab�ticamente.
*/

/*EJ-7
Saca los nombres de los jugadores de la divisi�n SouthEast.
*/

/*EJ-8
Indica las divisiones de la NBA donde juegan jugadores espa�oles.
*/

/*EJ-9
Jos� Calderon ha fichado por otro equipo los Pistons de Detroit 
de la conferencia:este, divisi�n Central, actualiza para dicho jugador este dato.
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
