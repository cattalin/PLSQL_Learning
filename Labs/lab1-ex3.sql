clear screen;

SET SERVEROUTPUT ON;

ACCEPT p_dep_id PROMPT 'Please enter the desired departments id';
DECLARE 
  v_dep_id NUMBER := &p_dep_id;
  v_dep_name DEPARTMENTS.DEPARTMENT_NAME%TYPE := '';
  v_nr_employees NUMBER := 0;
  
  v_hi_lim NUMBER := 30;
  v_lo_lim NUMBER := 10;
  
BEGIN
  SELECT COUNT(*)
  INTO v_nr_employeeS
  FROM EMPLOYEES
  WHERE DEPARTMENT_ID = v_dep_id;
  
  SELECT DEPARTMENT_NAME 
  INTO v_dep_name
  FROM DEPARTMENTS
  WHERE DEPARTMENT_ID = v_dep_id;
  
  IF (v_nr_employees < v_lo_lim) THEN
    DBMS_OUTPUT.PUT_LINE('There are JUST ' || v_nr_employees || ' employees in the ' || v_dep_name || ' department');
  ELSIF (v_nr_employees > v_hi_lim) THEN
    DBMS_OUTPUT.PUT_LINE('OMG There are ' || v_nr_employees || ' employees in the ' || v_dep_name || ' department');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Well, there are ' || v_nr_employees || ' employees in the ' || v_dep_name || ' department');
  END IF;
END;
/

SET SERVEROUTPUT OFF;