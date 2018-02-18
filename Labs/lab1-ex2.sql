clear screen;

SET SERVEROUTPUT ON

DECLARE 
  v_avg_salary EMPLOYEES.SALARY%TYPE := 0;
  v_dep_id NUMBER := 50;
BEGIN
  SELECT AVG(SALARY)
  INTO v_avg_salary
  FROM EMPLOYEES
  WHERE DEPARTMENT_ID = v_dep_id;
  
  DBMS_OUTPUT.PUT_LINE('THE AVERAGE SALARY IS: ' || v_avg_salary);
END;
/

SET SERVEROUTPUT OFF