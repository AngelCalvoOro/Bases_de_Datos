/*2.-Crea una tabla denominada ERRORES, que contendrá 3 columnas:
    • id, numérico de tres posiciones, autoincremental. 
      Además esta columna identificará los elementos de la tabla.
    • numero, numérico de cuatro posiciones, 
      que contendrá el código del empleado erróneo
    • descripcion varchar2(60)
*/
DROP TABLE ERRORES CASCADE CONSTRAINTS; 

CREATE TABLE  ERRORES(
  ID NUMBER(3) GENERATED ALWAYS AS IDENTITY,
  NUMERO NUMBER(4),
  DESCRIPCION VARCHAR2(60),
  CONSTRAINT ERROR_PK PRIMARY KEY (ID);
);

--COMPROBACIONES
DESC ERRORES;

SELECT *
FROM USER_TABLES
WHERE UPPER(TABLE_NAME) ='ERRORES';

SELECT C.USER_TABLES
FROM USER_CONSTRAINS C, USER_CONS_COLUMNS COL
WHERE C.USER_TABLES='ERRORES'
AND UPPER(TABLE_NAME) ='ERRORES';


/*3.-Genera un procedimiento, llamado aumentar_salario,  
     al que se le pasen dos parámetros (un nº de empleado y 
     el aumento del salario) que incremente el salario del
     empleado en cuestión, pero:
     
    • Si no existe el empleado, meter en la tabla de ERRORES,
      creada en el apartado anterior, el nº del empleado y 
      el mensaje de no encontrado.
    • Si no tiene salario, meter en la tabla de errores el
      nº del empleado y el mensaje de salario nulo, y
      además visualizar ambos datos por pantalla.
*/

/*4.-Realiza los siguientes pasos para ejecutar tu procedimiento:
Select * from emple;

EXECUTE aumentar_salario(7839,100);
Select * from errores;
Select * from emple
where EMP_NO=7839;

EXECUTE aumentar_salario(2222,1);
Select * from errores;

EXECUTE aumentar_salario(1111,100);
Select * from errores;

EXECUTE aumentar_salario(6666,100);
Select * from errores;

EXECUTE aumentar_salario(7934,100);
Select * from errores;
Select * from emple
where EMP_NO=7934;
*/