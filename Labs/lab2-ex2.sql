

SET SERVEROUTPUT ON

DECLARE
  TYPE jobs_table IS TABLE OF JOBS%ROWTYPE
  INDEX BY BINARY_INTEGER;
 
  all_jobs jobs_table;

BEGIN

    SELECT *
    BULK COLLECT INTO all_jobs
    FROM JOBS;
    
    FOR i IN 1..ALL_JOBS.COUNT LOOP
      DBMS_OUTPUT.PUT_LINE('JOB: ' || all_jobs(i).JOB_ID || ' TITLE: ' || all_jobs(i).JOB_TITLE || ' cu salariul: ' || (all_jobs(i).MIN_SALARY+all_jobs(i).MAX_SALARY)/2 || '$$$');  
    END LOOP;
    

END;
/


 
 
 
 
 