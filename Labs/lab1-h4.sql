clear screen;

SET SERVEROUTPUT ON;

ACCEPT p_job_id PROMPT 'Please specify a job_id ';

DECLARE
  v_sum NUMBER(8) := 0;
BEGIN
  SELECT SUM(SALARY)
  INTO v_sum
  FROM EMPLOYEES
-- absolutely fucking retarded satanic line of code below. needed to surround jobid in quotes 
  WHERE JOB_ID = '&p_job_id';
  
  DBMS_OUTPUT.PUT_LINE(v_sum);
END;
/



SET SERVEROUTPUT OFF;


