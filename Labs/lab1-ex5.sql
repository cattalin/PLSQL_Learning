clear screen;

SET SERVEROUTPUT ON;

-- More details -> read about substitution variables
--DEFINE p_dep_id = 50
--DEFINE p_cmsn = 10;


DECLARE 
  v_dep_id EMPLOYEES.DEPARTMENT_ID%TYPE := 50;
-- 2 NUMBERS FROM WHICH 2 ARE AFTER THE COMMA
  v_cmsn NUMBER(2,2) := .55;
BEGIN 
  UPDATE EMPLOYEES
  SET COMMISSION_PCT = v_cmsn
  WHERE DEPARTMENT_ID = v_dep_id;
  
  DBMS_OUTPUT.PUT_LINE('Updated ' || SQL%ROWCOUNT || ' rows');

END;
/

SET SERVEROUTPUT OFF;