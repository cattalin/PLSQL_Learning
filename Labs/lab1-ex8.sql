clear screen;

SET SERVEROUTPUT ON;

DECLARE
   TYPE possible_values IS VARRAY(3) OF VARCHAR2(10); 
   v_values possible_values;
BEGIN
  v_values := possible_values('Even','Odd');
  
--  this fucking lines don't work, follow https://stackoverflow.com/questions/48878438/plsql-issue-when-updating-with-a-value-from-an-varray
    UPDATE ORG_TAB_PNU t
    SET t.text = v_values(MOD(t.cod, 2) + 1);

    
  DBMS_OUTPUT.PUT_LINE(v_values(MOD(20, 2) + 1));
END;
/



SET SERVEROUTPUT OFF;


