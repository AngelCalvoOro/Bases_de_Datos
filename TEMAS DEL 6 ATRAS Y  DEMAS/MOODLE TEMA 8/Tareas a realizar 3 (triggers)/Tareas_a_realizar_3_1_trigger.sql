--EJ.1

/*
AL EJECUTAR DIRA ERROR EN LA INSERT SI LA HORA ESTA ENTRE LA HORA(09:30 Y 17:30)
O ES (SABADO O DOMINGO)
NOTA: EL CONTENIDO POR PRECAUCION SE PONE EN INGLES.
*/
CREATE OR REPLACE TRIGGER ins_emple
BEFORE INSERT ON emple
begin
    if (TO_CHAR(sysdate,'HH24:MI') not between '09:30' and '17:30') OR
        (TO_CHAR (sysdate, 'DY') IN ('SAT','SUN')) then
         RAISE_APPLICATION_ERROR (-20001, 'Solo se puede añadir personal entre las 9:30 y 17:30');
    end if;
end;

INSERT INTO EMPLE VALUES (7934,'MUÑOZ','EMPLEADO',7782,'23/01/1982',169000,NULL,10);

--ES UN TRIGGER A NIVEL DE TABLA

--LA SIGUIENTE LINEA DESACTIBA EL TRIGGER(para habilitarlo cambiar DISABLE por ENABLE)

ALTER TRIGGER ins_emple DISABLE;

--EJ.2

CREATE OR REPLACE TRIGGER  ctrl_save
AFTER INSERT OR DELETE OR UPDATE ON emple
for each row
begin
case
    when INSERTING then
      INSERT INTO Ctrl_Empleados (TABLA,USUARIO,FECHA,OPER) VALUES (table,user,sysdate,'insert');
    when updating then
      INSERT INTO Ctrl_Empleados (TABLA,USUARIO,FECHA,OPER) VALUES ('emple',user,sysdate,'update');
    when deleting then
      INSERT INTO Ctrl_Empleados (TABLA,USUARIO,FECHA,OPER) VALUES ('emple',user,sysdate,'delete');
    else
      RAISE_APPLICATION_ERROR(-20001,'ERROR DESCONOCIDO');
END CASE;
END;

SELECT * FROM emple
WHERE EMP_NO = 7934;

INSERT INTO EMPLE VALUES (7934,'MUÑOZ','EMPLEADO',7782,'23/01/1982',169000,NULL,10);
select * from Ctrl_Empleados;


UPDATE EMPLE 
  SET SALARIO = 100
  WHERE EMP_NO = 7934;
select * from Ctrl_Empleados;


DELETE FROM EMPLE 
WHERE EMP_NO = 7934;
select * from Ctrl_Empleados;

ROLLBACK;

