SET SERVEROUTPUT ON;
DROP TABLE demo_tab_1 PURGE;
CREATE TABLE demo_tab_1(
    demo_text   NUMBER(8)
);
DECLARE
    TYPE my_Array IS TABLE OF NUMBER   INDEX BY PLS_INTEGER;
    col_var my_Array;
    
    tot_rec NUMBER;
BEGIN
    --populate the collection
    FOR i IN 1..1000000 LOOP
        col_var(i) := 2*i;
    END LOOP;
    --populate test table
    FOR idx IN 1..1000000 LOOP
        INSERT INTO demo_tab_1 (demo_text) 
        VALUES(col_var(idx));
    END LOOP;
    COMMIT;
    
    SELECT count(*) INTO tot_rec FROM demo_tab_1;
    DBMS_OUTPUT.PUT_LINE(tot_rec);
END;
/