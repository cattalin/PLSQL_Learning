clear screen;

SET SERVEROUTPUT ON;

BEGIN
EXECUTE IMMEDIATE 
  'DROP TABLE ORG_TAB_PNU';
COMMIT;
END;
/

-- Re-creates the table each time we run this script
BEGIN
EXECUTE IMMEDIATE 
  'CREATE TABLE ORG_TAB_PNU 
  (
    COD NUMBER(20),
    TEXT VARCHAR2(20)
  )';
COMMIT;
END;
/


DECLARE 
  v_cod NUMBER(20) := 1;
  v_text VARCHAR2(20) := '';
  v_i NUMBER(3);
BEGIN
  << outer_loop >> 
  FOR v_i IN 1..70 LOOP 
    INSERT INTO ORG_TAB_PNU(COD, TEXT)
    VALUES (v_i, 'TEST ' || v_i);
  END LOOP outer_loop;
END;
/



SET SERVEROUTPUT OFF;


