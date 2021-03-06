-- Generated by Oracle SQL Developer Data Modeler 3.1.3.709
--   at:        2013-04-10 16:39:20 BST
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



CREATE TABLE Course 
    ( 
     cNo NUMBER (7)  NOT NULL , 
     cTitle VARCHAR2 (30)  NOT NULL , 
     duration NUMBER (1)  NOT NULL , 
     cost NUMBER (6,2)  NOT NULL 
    ) 
;



ALTER TABLE Course 
    ADD CONSTRAINT "Course PK" PRIMARY KEY ( cNo ) ;



CREATE TABLE Instructor 
    ( 
     instructorNo NUMBER (7)  NOT NULL , 
     instructorFName VARCHAR2 (30)  NOT NULL , 
     instructorLName VARCHAR2 (30)  NOT NULL , 
     hireDate DATE  NOT NULL , 
     sal NUMBER (7,2)  NOT NULL , 
     Country VARCHAR2 (30)  NOT NULL , 
     City VARCHAR2 (30)  NOT NULL , 
     Street VARCHAR2 (30)  NOT NULL , 
     Post_Code VARCHAR2 (8) 
    ) 
;



ALTER TABLE Instructor 
    ADD CONSTRAINT "Instructor PK" PRIMARY KEY ( instructorNo ) ;



CREATE TABLE Offering 
    ( 
     offering_id NUMBER (7)  NOT NULL , 
     startDate DATE  NOT NULL , 
     endDate DATE  NOT NULL , 
     loc VARCHAR2 (30)  NOT NULL , 
     cNo NUMBER (7)  NOT NULL , 
     instructorNo NUMBER (7)  NOT NULL 
    ) 
;



ALTER TABLE Offering 
    ADD CONSTRAINT "Offering PK" PRIMARY KEY ( offering_id ) ;



CREATE TABLE Student 
    ( 
     sNo NUMBER (7)  NOT NULL , 
     sFName VARCHAR2 (30)  NOT NULL , 
     sLName VARCHAR2 (30)  NOT NULL , 
     gender VARCHAR2 (1)  NOT NULL , 
     telNo NUMBER (12)  NOT NULL , 
     companyName VARCHAR2 (30)  NOT NULL 
    ) 
;



ALTER TABLE Student 
    ADD CONSTRAINT "Student PK" PRIMARY KEY ( sNo ) ;



CREATE TABLE Student_Details 
    ( 
     Offering_offering_id NUMBER (7)  NOT NULL , 
     Student_sNo NUMBER (7)  NOT NULL , 
     Evaluation NUMBER (1)  NOT NULL , 
     Grade VARCHAR2 (1)  NOT NULL 
    ) 
;



ALTER TABLE Student_Details 
    ADD CONSTRAINT Student_Details__IDX PRIMARY KEY ( Offering_offering_id, Student_sNo ) ;




ALTER TABLE Offering 
    ADD CONSTRAINT Course_Offering FOREIGN KEY 
    ( 
     cNo
    ) 
    REFERENCES Course 
    ( 
     cNo
    ) 
;


ALTER TABLE Student_Details 
    ADD CONSTRAINT FK_Student_Details FOREIGN KEY 
    ( 
     Student_sNo
    ) 
    REFERENCES Student 
    ( 
     sNo
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE Student_Details 
    ADD CONSTRAINT FK_Student_Offering FOREIGN KEY 
    ( 
     Offering_offering_id
    ) 
    REFERENCES Offering 
    ( 
     offering_id
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE Offering 
    ADD CONSTRAINT Instructor_Offering FOREIGN KEY 
    ( 
     instructorNo
    ) 
    REFERENCES Instructor 
    ( 
     instructorNo
    ) 
;



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             5
-- CREATE INDEX                             0
-- ALTER TABLE                              9
-- CREATE VIEW                              0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE STRUCTURED TYPE                   0
-- CREATE COLLECTION TYPE                   0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
