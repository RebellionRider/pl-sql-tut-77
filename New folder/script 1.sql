SET SERVEROUTPUT ON;
CREATE TABLE demo_tab(
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
    FORALL idx IN 1..1000000
        INSERT INTO demo_tab (demo_text) 
        VALUES(col_var(idx));
    COMMIT;
    
    SELECT count(*) INTO tot_rec FROM demo_tab;
    DBMS_OUTPUT.PUT_LINE(tot_rec);
END;
/