INSERT INTO DEPART VALUES (50,'INFORMATICA');
INSERT INTO DEPART VALUES (50,'INFORMATICA',null);
ROLLBACK;
desc depart
INSERT INTO DEPART(DEPT_NO,DNOMBRE)VALUES(50,'INFORMATICA');
INSERT INTO DEPART(DNOMBRE,DEPT_NO)VALUES('INFORMATICA',50);
UPDATE depart
SET 
 LOC=default
WHERE dept_no=50;

DELETE FROM DEPART
WHERE dept_no=50;
select * from depart;