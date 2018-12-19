/*EJERCICIO21*/
/*Select EMP_NO, APELLIDO,OFICIO,DNOMBRE,LOC
from emple, depart
where emple.dept_no = depart.DEPT_NO;*/

/*EJERCICIO2*/
Select emple.EMP_NO,emple.APELLIDO,emple.OFICIO, depart.loc
from emple,depart
where depart.loc IN ('MADRID','BARCELONA')
and emple.dept_no = depart.DEPT_NO;