clear screen;

SET SERVEROUTPUT ON


CREATE OR REPLACE PROCEDURE list_employees(CMP_DATE IN DATE)
IS

--  CURSOR MY_CURSOR IS
--  SELECT FIRST_NAME, HIRE_DATE
--  FROM EMPLOYEES
--  WHERE HIRE_DATE > '13-JAN-93';
--
--BEGIN
--
--  FOR employee IN my_cursor LOOP
--    
--    DBMS_OUTPUT.PUT_LINE(' -- ' || employee.FIRST_NAME || ' -- ' || employee.HIRE_DATE);
--    
--  END LOOP;

 CURSOR MY_CURSOR IS
  SELECT COUNT(*) AS ENTRIES
  FROM EMPLOYEES
  WHERE HIRE_DATE >  CMP_DATE;

BEGIN


DBMS_OUTPUT.PUT_LINE(' -- ' || CMP_DATE || ' -- ' ||  TO_CHAR(CMP_DATE, 'YYYY-MM-DD') || ' -- ' || TO_DATE(TO_CHAR(CMP_DATE, 'YYYY-MM-DD'), 'YYYY-MM-DD'));

  FOR employee IN my_cursor LOOP
    
    DBMS_OUTPUT.PUT_LINE(' -- ' || employee.ENTRIES);
    
  END LOOP;

END list_employees;
/


DECLARE

BEGIN
  
  list_employees('10-NOV-97');
  
END;
/
