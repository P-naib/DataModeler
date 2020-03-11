--
-- ER/Studio Data Architect SQL Code Generation
-- Project_test :      DATA MODEL
--
-- Date Created : Wednesday, February 19, 2020 21:43:56
-- Target DBMS : Oracle 12c
--

ALTER TABLE Student
DROP CONSTRAINT RefSubjects62
;

ALTER TABLE Teachers
DROP CONSTRAINT RefStudent32
;

ALTER TABLE Teachers
DROP CONSTRAINT RefSubjects52
;

-- 
-- TABLE: Student 
--

CREATE TABLE Student(
    Student_ID      CHAR(10)    NOT NULL,
    Roll_no         CHAR(10),
    Student_name    CHAR(10),
    Subject_id      CHAR(10),
    CONSTRAINT PK2 PRIMARY KEY (Student_ID)
)
TABLESPACE FMT_APPL_DAT
;



-- 
-- TABLE: Subjects 
--

CREATE TABLE Subjects(
    Subject_id           CHAR(10)    NOT NULL,
    Subject_name         CHAR(10),
    Students_enrolled    CHAR(10),
    CONSTRAINT PK3 PRIMARY KEY (Subject_id)
)
TABLESPACE FMT_APPL_DAT
;



-- 
-- TABLE: Teachers 
--

CREATE TABLE Teachers(
    Teacher_id     CHAR(10)    NOT NULL,
    name           CHAR(10),
    classrom_no    CHAR(10),
    Time           CHAR(10),
    date           CHAR(10),
    Student_ID     CHAR(10)    NOT NULL,
    Subject_id     CHAR(10),
    CONSTRAINT PK1 PRIMARY KEY (Teacher_id)
)
TABLESPACE FMT_APPL_DAT
;



-- 
-- TABLE: Student 
--

ALTER TABLE Student ADD CONSTRAINT RefSubjects63 
    FOREIGN KEY (Subject_id)
    REFERENCES Subjects(Subject_id)
;


-- 
-- TABLE: Teachers 
--

ALTER TABLE Teachers ADD CONSTRAINT RefStudent33 
    FOREIGN KEY (Student_ID)
    REFERENCES Student(Student_ID)
;

ALTER TABLE Teachers ADD CONSTRAINT RefSubjects53 
    FOREIGN KEY (Subject_id)
    REFERENCES Subjects(Subject_id)
;


-- 
-- PROCEDURE: StudentInsProc 
--

CREATE OR REPLACE PROCEDURE StudentInsProc
(
    v_Student_ID        IN CHAR,
    v_Roll_no           IN CHAR,
    v_Student_name      IN CHAR,
    v_Subject_id        IN CHAR)
AS
BEGIN
    INSERT INTO Student(Student_ID,
                        Roll_no,
                        Student_name,
                        Subject_id)
    VALUES(v_Student_ID,
           v_Roll_no,
           v_Student_name,
           v_Subject_id);

END;

/

-- 
-- PROCEDURE: StudentUpdProc 
--

CREATE OR REPLACE PROCEDURE StudentUpdProc
(
    v_Student_ID        IN CHAR,
    v_Roll_no           IN CHAR,
    v_Student_name      IN CHAR,
    v_Subject_id        IN CHAR)
AS
BEGIN
    UPDATE Student
       SET Roll_no           = v_Roll_no,
           Student_name      = v_Student_name,
           Subject_id        = v_Subject_id
     WHERE Student_ID = v_Student_ID;

END;

/

-- 
-- PROCEDURE: StudentDelProc 
--

CREATE OR REPLACE PROCEDURE StudentDelProc
(
    v_Student_ID        IN CHAR)
AS
BEGIN
    DELETE
      FROM Student
     WHERE Student_ID = v_Student_ID;

END;

/


-- 
-- PROCEDURE: SubjectsInsProc 
--

CREATE OR REPLACE PROCEDURE SubjectsInsProc
(
    v_Subject_id             IN CHAR,
    v_Subject_name           IN CHAR,
    v_Students_enrolled      IN CHAR)
AS
BEGIN
    INSERT INTO Subjects(Subject_id,
                         Subject_name,
                         Students_enrolled)
    VALUES(v_Subject_id,
           v_Subject_name,
           v_Students_enrolled);

END;

/

-- 
-- PROCEDURE: SubjectsUpdProc 
--

CREATE OR REPLACE PROCEDURE SubjectsUpdProc
(
    v_Subject_id             IN CHAR,
    v_Subject_name           IN CHAR,
    v_Students_enrolled      IN CHAR)
AS
BEGIN
    UPDATE Subjects
       SET Subject_name           = v_Subject_name,
           Students_enrolled      = v_Students_enrolled
     WHERE Subject_id = v_Subject_id;

END;

/

-- 
-- PROCEDURE: SubjectsDelProc 
--

CREATE OR REPLACE PROCEDURE SubjectsDelProc
(
    v_Subject_id             IN CHAR)
AS
BEGIN
    DELETE
      FROM Subjects
     WHERE Subject_id = v_Subject_id;

END;

/


-- 
-- PROCEDURE: TeachersInsProc 
--

CREATE OR REPLACE PROCEDURE TeachersInsProc
(
    v_Teacher_id       IN CHAR,
    v_name             IN CHAR,
    v_classrom_no      IN CHAR,
    v_Time             IN CHAR,
    v_date             IN CHAR,
    v_Student_ID       IN CHAR,
    v_Subject_id       IN CHAR)
AS
BEGIN
    INSERT INTO Teachers(Teacher_id,
                         name,
                         classrom_no,
                         Time,
                         date,
                         Student_ID,
                         Subject_id)
    VALUES(v_Teacher_id,
           v_name,
           v_classrom_no,
           v_Time,
           v_date,
           v_Student_ID,
           v_Subject_id);

END;

/

-- 
-- PROCEDURE: TeachersUpdProc 
--

CREATE OR REPLACE PROCEDURE TeachersUpdProc
(
    v_Teacher_id       IN CHAR,
    v_name             IN CHAR,
    v_classrom_no      IN CHAR,
    v_Time             IN CHAR,
    v_date             IN CHAR,
    v_Student_ID       IN CHAR,
    v_Subject_id       IN CHAR)
AS
BEGIN
    UPDATE Teachers
       SET name             = v_name,
           classrom_no      = v_classrom_no,
           Time             = v_Time,
           date             = v_date,
           Student_ID       = v_Student_ID,
           Subject_id       = v_Subject_id
     WHERE Teacher_id = v_Teacher_id;

END;

/

-- 
-- PROCEDURE: TeachersDelProc 
--

CREATE OR REPLACE PROCEDURE TeachersDelProc
(
    v_Teacher_id       IN CHAR)
AS
BEGIN
    DELETE
      FROM Teachers
     WHERE Teacher_id = v_Teacher_id;

END;

/


