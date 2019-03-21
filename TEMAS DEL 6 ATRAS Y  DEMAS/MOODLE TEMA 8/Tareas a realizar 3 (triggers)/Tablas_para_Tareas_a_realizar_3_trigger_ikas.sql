/** EJERCICIO  **/
/* Creo las tablas */
DROP TABLE CTRL_EMPLEADOS;
CREATE TABLE CTRL_EMPLEADOS (
    TABLA VARCHAR(30),
    USUARIO  varchar2(20),
    FECHA DATE,
    OPER VARCHAR(30)
);

/** EJERCICIO 2 **/

-- Creo las tablas usando AUTOINCREMENTAL 
DROP TABLE PRECIOS_PRODUCTOS2 CASCADE CONSTRAINTS;
DROP TABLE PRODUCTOS2;

CREATE TABLE PRODUCTOS2 (
    CO_PRODUCTO NUMBER (4)
    GENERATED ALWAYS AS IDENTITY 
                        --MINVALUE 1 
                        --MAXVALUE 9999
                        --INCREMENT BY 1 
                        --START WITH 1  
                        --NOORDER  
                        --NOCYCLE  NOT NULL ENABLE
    ,
    NO_PRODUCTO VARCHAR(100),
    CONSTRAINT Prod_CO_PRODUCTO_PK PRIMARY KEY(CO_PRODUCTO)
);

CREATE TABLE PRECIOS_PRODUCTOS2 (
    CO_PRODUCTO NUMBER (4),
    PRECIO NUMBER (6),
    FECHA_ACTUALIZACION DATE,
    CONSTRAINT PProd_pk PRIMARY KEY(CO_PRODUCTO,FECHA_ACTUALIZACION),
    CONSTRAINT PProd_CO_PRODUCTO_fk FOREIGN KEY(CO_PRODUCTO)  REFERENCES PRODUCTOS2(CO_PRODUCTO)
);

/** EJERCICIO  5**/
DROP VIEW EmpleadoDpto;
--Creo la vista
CREATE VIEW EmpleadoDpto as
SELECT E.emp_no, E.apellido,D.DNombre FROM Emple E, Depart D
WHERE E.Dept_no = D.dept_no;