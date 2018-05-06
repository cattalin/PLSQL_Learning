clear screen;

SET SERVEROUTPUT ON



DECLARE

    TYPE RCRD IS RECORD (
      TOTAL_SALARY NUMBER,
      DEPARTMENT_ID EMPLOYEES.DEPARTMENT_ID%TYPE
    );

    TYPE tablou_indexat IS TABLE OF RCRD
     INDEX BY BINARY_INTEGER;
     
     SALARIES_TABLE tablou_indexat;

BEGIN
    SELECT SUM(SALARY) AS TOTAL_SALARY, DEPARTMENT_ID
    BULK COLLECT INTO SALARIES_TABLE
    FROM EMPLOYEES
    GROUP BY DEPARTMENT_ID;


    FOR i IN 1..SALARIES_TABLE.COUNT LOOP
      DBMS_OUTPUT.PUT_LINE(SALARIES_TABLE(i).TOTAL_SALARY ||' ' || SALARIES_TABLE(i).DEPARTMENT_ID);
    END LOOP;

END;
/

