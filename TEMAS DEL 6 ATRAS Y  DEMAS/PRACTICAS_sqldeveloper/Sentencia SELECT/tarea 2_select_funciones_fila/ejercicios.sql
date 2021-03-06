/* EJERCICIO 1*/
SELECT APELLIDO AS "EMPLEADO",
NVL(TO_CHAR(ID_JEFE),'NO TIENE JEFE') AS "Jefe"
FROM EMPLE
ORDER BY ID_JEFE DESC;

/* EJERCICIO 2*/
SELECT EMP_NO empleado, SALARIO salario,
  TRUNC(SALARIO/1000) as "PORCENTAJE DE MOVILIZACION"
FROM EMPLE;

/* EJERCICIO 3*/
SELECT APELLIDO apellido, OFICIO AS "trabajo",
      INITCAP(SUBSTR(APELLIDO,1,3)) || LENGTH(APELLIDO) || OFICIO AS nombre_usuario,
      TO_CHAR(FECHA_ALTA,'MMYYYY') || UPPER(SUBSTR(APELLIDO,-2)) AS "CLAVE USUARIO"
FROM EMPLE
ORDER BY APELLIDO;

/* EJERCICIO 4*/
SELECT APELLIDO AS "NOMBRE EMPLEADO",
    TO_CHAR(SALARIO,'999,999.999') AS salario,
    TO_CHAR((SALARIO * SUBSTR(SALARIO,1,1)/100),'9,999.999') reajuste
FROM emple;

/* EJERCICIO 5*/
SELECT EMP_NO "ID EMPLEADO", SALARIO "SALARIO SIN COMISION",
      NVL(TO_CHAR(COMISION_PCT),'SIN COMISION') AS "PORC. COMISION",
      NVL2(COMISION_PCT,SALARIO*COMISION_PCT,0) AS "VALOR COMISION",
      NVL2(COMISION_PCT,SALARIO+(SALARIO*COMISION_PCT),SALARIO) "SALARIO TOTAL"
FROM EMPLE;

/* EJERCICIO 6*/
SELECT EMP_NO,FECHA_ALTA,
      TRUNC(MONTHS_BETWEEN(SYSDATE,FECHA_ALTA),0) AS MESES,
      ADD_MONTHS(FECHA_ALTA,6) AS REVISION, NEXT_DAY(FECHA_ALTA,'VIERNES'),
      LAST_DAY(FECHA_ALTA)
FROM EMPLE
WHERE MONTHS_BETWEEN(SYSDATE,FECHA_ALTA)<460;