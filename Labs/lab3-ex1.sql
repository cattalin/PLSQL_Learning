clear screen;

SET SERVEROUTPUT ON


DECLARE

--  country COUNTRIES%ROWTYPE;
  TYPE country_record IS RECORD (
    COUNTRY_ID     COUNTRIES.COUNTRY_ID%TYPE,
    COUNTRY_NAME   COUNTRIES.COUNTRY_NAME%TYPE,
    REGION_NAME    REGIONS.REGION_NAME%TYPE
  );
  
  country country_record := null;

  CURSOR country_selector IS 
  SELECT COUNTRY_ID, COUNTRY_NAME, REGION_NAME
  FROM COUNTRIES
  INNER JOIN REGIONS
  ON COUNTRIES.REGION_ID = REGIONS.REGION_ID
  WHERE REGIONS.REGION_NAME = 'Asia';
  
BEGIN
  
  OPEN country_selector;
  
  LOOP
  
    EXIT WHEN country_selector%NOTFOUND;
  
    FETCH country_selector
    INTO country;
    
    DBMS_OUTPUT.PUT_LINE( country.COUNTRY_ID || ' --- ' || country.REGION_NAME || ' --- ' || country.COUNTRY_NAME || ' --- ');  
    
  END LOOP;
  
  CLOSE country_selector;

  DBMS_OUTPUT.PUT_LINE( ' ---------- Second Attempt ------------ '  );  

  FOR country_row IN country_selector LOOP
  
    DBMS_OUTPUT.PUT_LINE( country_row.COUNTRY_ID || ' --- ' || country_row.REGION_NAME || ' --- ' || country_row.COUNTRY_NAME || ' --- ');  
  
  END LOOP;
  
END;
/
