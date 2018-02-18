clear screen;
--  WITH LOCAL VARIABLE

SET SERVEROUTPUT ON
DECLARE 
  v_city_name locations.city%TYPE := '';
BEGIN
  
    SELECT city 
    INTO v_city_name
    FROM locations 
    WHERE LOCATION_ID = (SELECT location_id 
                          FROM departments 
                          where department_id = 30);
 
    
    DBMS_OUTPUT.PUT_LINE(v_city_name);
    
END;
/

SET SERVEROUTPUT OFF


--  WITH GLOBAL VARIABLE

VARIABLE g_city_name VARCHAR2(20);
BEGIN
    SELECT city 
    INTO :g_city_name
    FROM locations 
    WHERE LOCATION_ID = (SELECT location_id 
                          FROM departments 
                          where department_id = 30);
 
END;
/
PRINT g_city_name;