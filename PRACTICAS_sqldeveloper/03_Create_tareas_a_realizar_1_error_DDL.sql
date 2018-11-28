REM **** Borrado de las tablas

drop table employees cascade constraints;
drop table departments cascade constraints;
drop table articulos cascade constraints;
drop table fabricantes cascade constraints;
drop table tiendas cascade constraints;
drop table pedidos cascade constraints;
drop table ventas cascade constraints;


REM **** Creación de las tablas

create table departments(
   department_id NUMBER(2),
   department_name VARCHAR2(30) CONSTRAINT dept_name_nn NOT NULL, 
   manager_id NUMBER(3),
   location_id NUMBER(4),
CONSTRAINT dept_id_pk PRIMARY KEY(deparment_id)
);

create table employees(
   employee_id NUMBER(6),
   first_name VARCHAR2(25) NOT NULL ,
   last_name VARCHAR2(25),
   email VARCHAR2(25)
      		CONSTRAINT emp_email_uk UNIQUE,
   phone_number NUMBER(12),
   hire_date DATE  DEFAULT SYSDATE ,
   job_id VARCHAR2(10),
   salary NUMBER(8,2),
   comission_pct NUMBER(5,2),
   manager_id NUMBER(3),
   department_id NUMBER(2),
      		CONSTRAINT emp_id_pk PRIMARY KEY(employee_id),
     		CONSTRAINT emp_dept_fk FOREIGN KEY(department_id)               
      		      REFERENCES departments(departmentes_id)
);

CREATE TABLE fabricantes (
cod_fabricante VARCHAR(3) ,
nombre  VARCHAR2(15),
pais VARCHAR2(15), 
CONSTRAINT fab_cod_fab_pk PRIMARY KEY(cod_fabricante),
CONSTRAINT fab_nombre_mayusculas_ck CHECK(nombre = upper(nombre)),
CONSTRAINT fab_pais_mayusculas_ck CHECK(pais= upper(pais))
);

CREATE TABLE articulos (
articulo VARCHAR2(20) ,
cod_fabricante VARCHAR2(3) ,
peso NUMBER(3),
categoria VARCHAR2(10),
precio_venta NUMBER(4),
precio_costo NUMBER(4),
existencias NUMBER(5),
CONSTRAINT art_pk PRIMARY KEY(articulo, cod_fabricante, peso, categoria),
CONSTRAINT art_fab_fk FOREIGN KEY(cod_fabricante) REFERENCES fabricantes(cod_fabricante),
CONSTRAINT art_precioventa_ck CHECK(precio_venta>0),
CONSTRAINT art_preciocosto_ck CHECK (precio_costo>0),
CONSTRAINT art_peso_ck CHECK (peso >0),
CONSTRAINT art_categoria CHECK (categoria IN('primero','segundo','tercero'))
);

CREATE TABLE tiendas (
nif VARCHAR2(10) CONSTRAINT tie_nif_pk PRiMARY KEY,
nombre VARCHAR2(20),
direccion  VARCHAR2(20),
poblacion  VARCHAR2(20),
provincia  VARCHAR2(20),
codpostal  VARCHAR2(5),
CONSTRAINT tie_upper_ck CHECK(provincia = upper(provincia))
);

CREATE TABLE pedidos (
nif VARCHAR2 (10),
articulo VARCHAR2 (20),
cod_fabricante VARCHAR2 (3),
peso NUMBER(3),
categoria VARCHAR2 (10),
fecha_pedido DATE DEFAULT SYSDATE,
unidades_pedidas NUMBER(4),
CONSTRAINT ped_pk PRIMARY KEY(nif,articulo,cod_fabricante,peso,categoria,fecha_pedido),
CONSTRAINT ped_fk FOREIGN KEY (cod_fabricante) REFERENCES fabricantes(cod_fabricante),
CONSTRAINT ped_unidades_ck CHECK (unidades_pedidas>0),
CONSTRAINT ped_categoria_ck CHECK (categoria  IN('primero','segundo','tercero')),
CONSTRAINT ped_art_fk FOREIGN KEY (articulo,cod_fabricante,peso,categoria) REFERENCES articulos(articulo,peso,categoria),
CONSTRAINT ped_tie_fk FOREIGN KEY (nif) REFERENCES tiendas(nif)
);

CREATE TABLE ventas(
nif VARCHAR2(10) ,
articulo VARCHAR2(20) ,
cod_fabricante VARCHAR2(3) ,
peso NUMBER(3),
categoria VARCHAR2(10),
fecha_venta DATE DEFAULT SYSDATE,
unidades_vendidas NUMBER(4), 
CONSTRAINT ven_pk PRIMARY KEY(nif, articulo, cod_fabricante, peso, categoria, fecha_venta),
CONSTRAINT ven_fab_fk FOREIGN KEY(cod_fabricante) REFERENCES fabricantes(cod_fafricante),
CONSTRAINT ven_unidadesvendidas_ck CHECK (unidades_vendidas>0),
CONSTRAINT ven_categoria_ck CHECK (categoria IN('primero','segundo','tercero')),
CONSTRAINT ven_art_fk FOREIGN KEY(articulo, cod_fabricante, peso, categoria) REFERENCES articulos(articulo, cod_fabricante, peso, categoria),
CONSTRAINT ven_tie_fk FOREIGN KEY(nif) REFERENCES tiendas(nif)
);


--Ejercicio 3
--parte 3
Alter TABLE tiendas ADD CONSTRAINT tien_nombre_ck CHECK (nombre=INITCAP(nombre));
--parte 5
ALTER TABLE pedidos MODIFY (unidades_pedidas NUMBER(6));
ALTER TABLE ventas MODIFY (unidades_vendidas NUMBER(6));
--parte 6
Alter TABLE tiendas ADD CONSTRAINT tien_prov_ck CHECK (provincia != 'TOLEDO');
--parte 7
ALTER TABLE pedidos ADD PVP NUMBER(4) DEFAULT 0;
ALTER TABLE ventas ADD PVP NUMBER(4) DEFAULT 0;
--parte 8
ALTER TABLE pedidos DROP (PVP);
ALTER TABLE ventas DROP (PVP);

