clear screen;

SET SERVEROUTPUT ON


DECLARE
 TYPE tablou_imbricat IS TABLE OF NUMBER;
 t tablou_imbricat := tablou_imbricat();
BEGIN
-- punctul a
 FOR i IN 1..10 LOOP
 t.extend; t(i):=i;
 END LOOP;
 DBMS_OUTPUT.PUT('Tabloul are ' || t.COUNT ||' elemente: ');
 FOR i IN t.FIRST..t.LAST LOOP
 DBMS_OUTPUT.PUT(t(i) || ' ');
 END LOOP;
 DBMS_OUTPUT.NEW_LINE;
 
 -- punctul b
 FOR i IN 1..10 LOOP
 IF i mod 2 = 1 THEN t(i):=null;
 END IF;
 END LOOP;
 DBMS_OUTPUT.PUT('Tabloul are ' || t.COUNT ||' elemente: ');
 FOR i IN t.FIRST..t.LAST LOOP
 DBMS_OUTPUT.PUT(nvl(t(i), 0) || ' ');
 END LOOP;
 DBMS_OUTPUT.NEW_LINE;
-- punctul c
 t.DELETE(t.first);
 t.DELETE(5,7);
 t.DELETE(t.last);
 DBMS_OUTPUT.PUT_LINE('Primul element are indicele ' || t.first ||
 ' si valoarea ' || nvl(t(t.first),0));
 DBMS_OUTPUT.PUT_LINE('Ultimul element are indicele ' || t.last ||
 ' si valoarea ' || nvl(t(t.last),0));
 DBMS_OUTPUT.PUT('Tabloul are ' || t.COUNT ||' elemente: ');
 FOR i IN t.FIRST..t.LAST LOOP
 IF t.EXISTS(i) THEN
 DBMS_OUTPUT.PUT(nvl(t(i), 0)|| ' ');
 END IF;
 END LOOP;
 DBMS_OUTPUT.NEW_LINE;
-- punctul d
 t.delete;
 DBMS_OUTPUT.PUT_LINE('Tabloul are ' || t.COUNT ||' elemente.');
END;
/
