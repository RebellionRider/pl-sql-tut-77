/*
								SCRIPT-1
								
	Script from PL/SQL tutorial 75 on FORALL statement with Lower & Upper Bound in Oracle DATABASE
	Creator: Manish Sharma
	Website: www.RebellionRider.com
		Fastest way to reach Manish Sharma
	Twitter: @RebellionRider
	Facebook:@TheRebellionRider
	Instagram: @RebellionRider
	
	Do make sure to follow me on my social media for more such scripts and other col stuffs. 
	Thanks and have great day.
*/

SET SERVEROUTPUT ON;
CREATE TABLE tut_77(
    mul_tab NUMBER(5)
);
DECLARE
    TYPE My_Array IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    col_var My_Array;
    tot_rec NUMBER;
BEGIN
    --Populate the collection
    FOR i IN 1..10 LOOP
        col_var (i) := 9*i;
    END LOOP;
    
    FORALL idx IN 1..10
        INSERT INTO tut_77 (mul_tab)
        VALUES (col_var(idx));
        
    SELECT count(*) INTO tot_rec FROM tut_77;
    DBMS_OUTPUT.PUT_LINE('Total records inserted are '||tot_rec);
END;
/
        