

SET SERVEROUTPUT ON

DECLARE
  TYPE tabelas IS RECORD (
    ID      JOBS.JOB_ID%TYPE,
    NAME    JOBS.JOB_TITLE%TYPE,
    SALARY  JOBS.MIN_SALARY%TYPE
  );
  
  angajat tabelas;
  
  angajat2 JOBS%ROWTYPE;

BEGIN
  
--  SELECT * FROM JOBS
--  INTO tabelas;
    
    angajat.ID     := 'Asistent';
    angajat.name   := 'Manager';
    angajat.salary := 123;
    
    SELECT JOB_ID, JOB_TITLE, MIN_SALARY
    INTO angajat
    FROM JOBS
    WHERE JOB_ID = 'FI_MGR';
    
    SELECT *
    INTO angajat2
    FROM JOBS
    WHERE JOB_ID = 'FI_MGR';
    
    DBMS_OUTPUT.PUT_LINE('Angajat: ' || angajat.name || ' ID: ' || angajat.ID || ' cu salariul: ' || angajat.salary || '$$$');
    
    DBMS_OUTPUT.PUT_LINE('Angajat: ' || angajat2.JOB_ID || ' TITLE: ' || angajat2.JOB_TITLE || ' cu salariul: ' || (angajat2.MIN_SALARY+angajat2.MAX_SALARY)/2 || '$$$');

END;
/
