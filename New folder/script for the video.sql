SET SERVEROUTPUT ON;
CREATE TABLE tut_77(
    mul_tab    NUMBER(5)
);
TRUNCATE TABLE tut_77;
DECLARE
    TYPE My_Array IS TABLE OF NUMBER   INDEX BY PLS_INTEGER;
    col_var my_Array;
    
    tot_rec NUMBER;
BEGIN
    --populate the collection
    FOR i IN 1..10 LOOP
        col_var(i) := 9*i;
    END LOOP;
    --FORALL statement with Lower & Upper Bound
    FORALL idx IN 1..10
        INSERT INTO tut_77 (mul_tab) 
        VALUES(col_var(idx));
    --COMMIT;
    SELECT count(*) INTO tot_rec FROM tut_77;
    DBMS_OUTPUT.PUT_LINE('Total Numbers of records inserted are '||tot_rec);
END;
/