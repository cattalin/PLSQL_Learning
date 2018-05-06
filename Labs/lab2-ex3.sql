clear screen;

SET SERVEROUTPUT ON


DECLARE
   TYPE tablou_indexat IS TABLE OF employees%ROWTYPE
   INDEX BY BINARY_INTEGER;
   t tablou_indexat;
BEGIN
  -- stergere din tabel si salvare in tablou
   DELETE FROM employees
   WHERE ROWNUM<= 2
   RETURNING employee_id, first_name, last_name, email, phone_number,
   hire_date, job_id, salary, commission_pct, manager_id,
   department_id
   BULK COLLECT INTO t;

--    SELECT *
--    BULK COLLECT INTO t
--    FROM EMPLOYEES;


    FOR i IN 1..t.COUNT LOOP
      DBMS_OUTPUT.PUT_LINE(t(i).employee_id ||' ' || t(i).last_name);
    END LOOP;

 END;
 /
 
 
 
 ROLLBACK;