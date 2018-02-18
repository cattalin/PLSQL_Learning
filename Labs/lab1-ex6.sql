clear screen;

SET SERVEROUTPUT ON;

ACCEPT p_day_index PROMPT 'Please enter the current day';

DECLARE 
  v_day VARCHAR2(10);
BEGIN 

--  HERE MISSES A VALIDATION FOR &p_day_index... OR ERROR HANDLING AT THE BOTTOM
    CASE &p_day_index
      WHEN 1 THEN v_day := 'Monday';
      WHEN 2 THEN v_day := 'Tuesday';
      WHEN 3 THEN v_day := 'Wednesday';
      WHEN 4 THEN v_day := 'Thursday';
      WHEN 5 THEN v_day := 'Friday';
      WHEN 6 THEN v_day := 'Saturday';
      WHEN 7 THEN v_day := 'Sunday';
      ELSE v_day := 'Error';
    END CASE;
    
    IF(v_day = 'Error') THEN 
      DBMS_OUTPUT.PUT_LINE('Please put a valid date');
    ELSE
      DBMS_OUTPUT.PUT_LINE('You have selected ' || v_day);
    END IF;
END;
/

SET SERVEROUTPUT OFF;