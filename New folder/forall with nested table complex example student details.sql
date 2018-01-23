SET SERVEROUTPUT ON;

SELECT * FROM student_list;
TRUNCATE TABLE student_list;
DROP TABLE student_list PURGE;
--
CREATE TABLE student_list(
    stu_name    VARCHAR2(20)
);
--
DECLARE
    TYPE nt_students   IS TABLE OF VARCHAR2(20);
    stu_details nt_students :=  nt_students('Steve', 'Peter', 'Tony', 'Clark');
    
    tot_rec NUMBER;
BEGIN
    FORALL idx IN stu_details.FIRST..stu_details.LAST
    INSERT INTO student_list(stu_name) VALUES (stu_details(idx));
    
    SELECT count(*) INTO tot_rec FROM student_list;
    DBMS_OUTPUT.PUT_LINE(tot_rec);
END;
/
SELECT * FROM student_list;