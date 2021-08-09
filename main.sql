DROP TABLE IF EXISTS PROFESSOR;
DROP TABLE IF EXISTS DEPARTMENT;
DROP TABLE IF EXISTS COURSE;
DROP TABLE IF EXISTS STUDENT;
DROP TABLE IF EXISTS SECTION;
DROP TABLE IF EXISTS MINOR;
DROP TABLE IF EXISTS PREREQ_COURSE;
DROP TABLE IF EXISTS COLLEGE_DEGREES;
DROP TABLE IF EXISTS ENROLLMENT;

CREATE TABLE PROFESSOR (
  SSN VARCHAR(15) PRIMARY KEY,
  Name VARCHAR(40),
  Sex VARCHAR(15),
  Title VARCHAR(40),
  Salary INT,
  StreetAddress VARCHAR(40),
  City VARCHAR(40), 
  State VARCHAR(20),
  ZipCode VARCHAR(10),
  AreaCode VARCHAR(10),
  SevenDigitNum VARCHAR(20)
);

CREATE TABLE DEPARTMENT (
  Number VARCHAR(20) PRIMARY KEY,
  Name VARCHAR(40),
  Telephone VARCHAR(20), 
  OfficeLocation VARCHAR(40),
  ChairpersonSSN VARCHAR(15), 
  FOREIGN KEY (ChairpersonSSN) REFERENCES PROFESSOR(SSN)
);

CREATE TABLE COURSE (
  Number VARCHAR(20) PRIMARY KEY,
  Title VARCHAR(40),
  Textbook VARCHAR(100),
  Units INT,
  DeptNum VARCHAR(20),
  FOREIGN KEY (DeptNum) REFERENCES DEPARTMENT(Number)
);

CREATE TABLE STUDENT (
  CWID VARCHAR(20) PRIMARY KEY,
  FirstName VARCHAR(40),
  LastName VARCHAR(40),
  Address VARCHAR(100),
  TelephoneNum VARCHAR(20),
  DeptNum VARCHAR(20),
  FOREIGN KEY (DeptNum) REFERENCES DEPARTMENT(Number)
);

CREATE TABLE SECTION (
  SecNumber VARCHAR(20),
  CourseNumber VARCHAR(20),
  MeetingDays VARCHAR(60),
  NumOfSeats INT,
  Classroom VARCHAR(30),
  BeginningTime VARCHAR(30),
  EndTime VARCHAR(30),
  ProfessorSSN VARCHAR(15),
  PRIMARY KEY (SecNumber, CourseNumber),
  FOREIGN KEY (ProfessorSSN) REFERENCES PROFESSOR(SSN),
  FOREIGN KEY (CourseNumber) REFERENCES COURSE(Number)
);

CREATE TABLE MINOR (
  StudentCWID VARCHAR(20),
  DeptNum VARCHAR(20),
  PRIMARY KEY (StudentCWID, DeptNum),
  FOREIGN KEY (StudentCWID) REFERENCES STUDENT(CWID),
  FOREIGN KEY (DeptNum) REFERENCES DEPARTMENT(Number)
);

CREATE TABLE PREREQ_COURSE (
  PrereqCourseNum VARCHAR(20),
  CourseNum VARCHAR(20),
  PRIMARY KEY (PrereqCourseNum, CourseNum),
  FOREIGN KEY (PrereqCourseNum) REFERENCES COURSE(Number),
  FOREIGN KEY (CourseNum) REFERENCES COURSE(Number)
);

CREATE TABLE COLLEGE_DEGREES (
  CollegeDegrees VARCHAR(100), 
  ProfessorSSN VARCHAR(15), 
  PRIMARY KEY (CollegeDegrees, ProfessorSSN),
  FOREIGN KEY (ProfessorSSN) REFERENCES PROFESSOR(SSN) 
);

CREATE TABLE ENROLLMENT (
  SecNumber VARCHAR(20),
  CourseNumber VARCHAR(20),
  StudentCWID VARCHAR(20),
  Grade VARCHAR(10),
  PRIMARY KEY (SecNumber,CourseNumber,StudentCWID),
  FOREIGN KEY (SecNumber) REFERENCES SECTION(SecNumber),
  FOREIGN KEY (CourseNumber) REFERENCES SECTION(CourseNumber),
  FOREIGN KEY (StudentCWID) REFERENCES STUDENT(CWID)
);


-- 8 students, 2 departments, 3 professors, 4 courses, 6 sections, 20 enrollment records

-- department #1 = 1A = comp sci
-- department #2 = 2B = liberal arts

INSERT INTO STUDENT 
VALUES ('001', 'Ali', 'Hussain','22022 Calderas, Mission Viejo, CA', '949-338-3461', '1A');
INSERT INTO STUDENT 
VALUES ('002', 'Stephen', 'Landaas','2711 Alberqueue Road, Charleston, WV', '949-356-7811', '1A');
INSERT INTO STUDENT 
VALUES ('003', 'Jarn', 'Cherry','2300 Dixwell Ave Apt. 103, Hamden, CT', '304-448-6544', '2B');
INSERT INTO STUDENT 
VALUES ('004', 'John', 'Smith','1201 Rt 300, Newburgh, NY', '213-647-7743', '1A');
INSERT INTO STUDENT 
VALUES ('005', 'David', 'Brown','878 Seaview Dr. Schererville, CA', '605-837-4456', '2B');
INSERT INTO STUDENT 
VALUES ('006', 'Christin', 'Gerwig','22022 Calderas, Mission Viejo', '304-972-9251', '1A');
INSERT INTO STUDENT 
VALUES ('007', 'Greyson', 'Young','30 Memorial Drive, Abington, MA', '705-527-4588', '2B');
INSERT INTO STUDENT 
VALUES ('008', 'Lexi', 'Arnold','626 Olive Street Sw, Cullman, AL', '520-723-2241', '1A');
INSERT INTO STUDENT 
VALUES ('009', 'Emily', 'Le','1800 Lincoln Heights Boulevard, NY', '571-112-9361', '1A');

INSERT INTO DEPARTMENT
VALUES ('1A', 'Computer Science', '949-133-6540', '800 N. State College Blvd. Fullerton, CA', '324-01-2489');
INSERT INTO DEPARTMENT
VALUES ('2B', 'Liberal Arts', '949-342-0581', '3 Banting, Irvine, CA', '544-35-5870');

INSERT INTO PROFESSOR
VALUES ('324-01-2489', 'Mark Jacobs', 'Male', 'Head of Computer Science Department', 168000, '144 Wake Forest Drive', 'Cedar Park', 'WV', '92691', '901', '9643612');
INSERT INTO PROFESSOR
VALUES ('544-35-5870', 'Ellie Fisher', 'Female', 'Head of Liberal Arts Department', 149000, '70 Pleasant Valley Street', 'Methuen', 'MA', '44134', '344', '3753582');
INSERT INTO PROFESSOR
VALUES ('401-57-3930', 'Bailey Amond', 'Male', 'Adjunct Professor of Computer Science', 124000, '6438 Basile Rowe', 'East Meadow', 'NY', '74310', '741', '5131697');


INSERT INTO COURSE
VALUES ('221A', 'Algorithim Engineering', 'Bridging the Gap Between Algorithm Theory and Practice', 4, '1A');
INSERT INTO COURSE
VALUES ('233A', 'Advanced Algorithms', 'Jeffrey Barnet Presents: The Algorithim Bootcamp With Serendipity 7th Edition', 5, '1A');
INSERT INTO COURSE
VALUES ('452A', 'Cryptography', 'Quantum Computing For Computer Science 3th Edition', 4, '1A');
INSERT INTO COURSE
VALUES ('330B', 'Digital Humanities', 'Digital Rhetoric: Theory, Method, Practice (Digital Humanities) 5th Edition', 3, '2B');
INSERT INTO COURSE
VALUES ('485A', 'Computational Bioinformatics', 'Fundamentals of Bioinformatics and Computational Biology (Modeling and Optimization in Science and Technologies) 6th Edition', 5, '1A');

INSERT INTO SECTION
VALUES ('221A-01', '221A', 'Sa', 30, 'COMP-SCI 245', '1:00 PM', '4:00 PM', '324-01-2489');
INSERT INTO SECTION
VALUES ('233A-01', '233A', 'M/W', 30, 'COMP-SCI 120', '4:00 PM', '6:30 PM', '401-57-3930');
INSERT INTO SECTION
VALUES ('233A-02', '233A', 'T/TH', 30, 'COMP-SCI 120', '12:00 PM', '2:30 PM', '324-01-2489');
INSERT INTO SECTION
VALUES ('452A-01', '452A', 'M/W/F', 30, 'COMP-SCI 123', '08:00 AM', '09:30 AM', '401-57-3930');
INSERT INTO SECTION
VALUES ('330B-01', '330B', 'T/TH', 25, 'LIB-ARTS 103', '10:00 AM', '11:45 AM', '544-35-5870');
INSERT INTO SECTION
VALUES ('330B-02', '330B', 'M/W', 25, 'LIB-ARTS 103', '1:00 PM', '3:45 PM', '544-35-5870');
INSERT INTO SECTION
VALUES ('485A-01', '485A', 'M/W', 20, 'COMP-SCI 116', '7:00 PM', '9:30 PM', '324-01-2489');


-- VALUES ('SECTION NUMBER', 'COURSE NUMBER', 'STUDENT CWID', 'GRADE')
INSERT INTO ENROLLMENT 
VALUES ('233A-01', '233A', '001', 'A-'); -- #1 Ali enrolled into Advanced Algorithims section-01
INSERT INTO ENROLLMENT 
VALUES ('452A-01', '452A', '001', 'A+'); -- #2 Ali enrolled into Cryptography section-01
INSERT INTO ENROLLMENT 
VALUES ('330B-02', '330B', '001', 'B+'); -- #3 Ali enrolled into Digital Humanities section-02
INSERT INTO ENROLLMENT 
VALUES ('485A-01', '485A', '001', 'A'); -- #4 Ali enrolled into Comp Bioinfo section-01

INSERT INTO ENROLLMENT 
VALUES ('233A-01', '233A', '002', 'A+'); -- #5 Stephen enrolled into Advanced Algorithims section-01
INSERT INTO ENROLLMENT 
VALUES ('452A-01', '452A', '002', 'A+'); -- #6 Stephen enrolled into Cryptography section-01
INSERT INTO ENROLLMENT 
VALUES ('330B-01', '330B', '002', 'F'); -- #7 Stephen enrolled into Digital Humanities section-01
INSERT INTO ENROLLMENT 
VALUES ('485A-01', '485A', '002', 'D+'); -- #8 Stephen enrolled into Comp Bioinfo section-01

INSERT INTO ENROLLMENT
VALUES ('233A-02', '233A', '003', 'C-'); -- #9 Jarn enrolled into Advanced Algorithims section-02
INSERT INTO ENROLLMENT
VALUES ('330B-02', '330B', '003', 'D'); -- #10 Jarn enrolled into Digital Humanities section-02

INSERT INTO ENROLLMENT
VALUES ('233A-01', '233A', '004', 'C'); -- #11 John enrolled into Advanced ALgorithims section-01
INSERT INTO ENROLLMENT
VALUES ('485A-01', '485A', '004', 'B+'); -- #12 John enrolled into Comp Bioinfo section-01

INSERT INTO ENROLLMENT 
VALUES ('233A-01', '233A', '005', 'A+'); -- #13 David enrolled into Advanced Algorithim section-02
INSERT INTO ENROLLMENT 
VALUES ('330B-02', '330B', '005', 'B-'); -- #14 David enrolled into Digital Humanities section-02
INSERT INTO ENROLLMENT 
VALUES ('452A-01', '452A', '005', 'C+'); -- #15 David enrolled into Cryptography section-01
INSERT INTO ENROLLMENT 
VALUES ('485A-01', '485A', '005', 'A-'); -- #16 David enrolled into Bioinfo section section-01

INSERT INTO ENROLLMENT 
VALUES ('233A-02', '233A', '006', 'B+'); -- #17 Christin enrolled into Advanced Algorithims section-02
INSERT INTO ENROLLMENT 
VALUES ('330B-01', '330B', '006', 'A+'); -- #18 Christin enrolled into Digital Humanities section-01

INSERT INTO ENROLLMENT 
VALUES ('452A-01', '452A', '007', 'F'); -- #19 Greyson enrolled into Cryptography section-01

INSERT INTO ENROLLMENT 
VALUES ('330B-01', '330B', '008', 'C-'); -- #20 Lexi enrolled into Digital Humanities section-02

INSERT INTO ENROLLMENT 
VALUES ('221A-01', '221A', '009', 'A'); -- #21 Emily enrolled in algorithim engineering section-01
INSERT INTO ENROLLMENT 
VALUES ('330B-01', '330B', '009', 'A+'); -- #22 Emily enrolled into Digital Humanities section-01

INSERT INTO MINOR
VALUES ('002','2B'); -- Stephen minoring in Liberal Arts
INSERT INTO MINOR
VALUES ('005','1A'); -- David minoring in CS

INSERT INTO PREREQ_COURSE
VALUES ('221A', '233A'); -- algorithim engineering is a pre-req for advanced algorithims
INSERT INTO PREREQ_COURSE
VALUES ('221A', '452A'); -- algorithim engineering is a pre-req for bioinfo

INSERT INTO COLLEGE_DEGREES
VALUES ('Ph.D. in Quantitative Computational Biology', '324-01-2489');
INSERT INTO COLLEGE_DEGREES
VALUES ('Master of Arts in Liberal Studies', '544-35-5870');
INSERT INTO COLLEGE_DEGREES
VALUES ('Master of Sciences in Electrical Engineering and Computer Science', '401-57-3930');





-- QUERIES BELOW:

--Professor A

/*
SELECT C.Title, S.Classroom, S.MeetingDays, 
        S.BeginningTime, S.EndTime
FROM PROFESSOR P, SECTION S, COURSE C
WHERE P.SSN = S.ProfessorSSN AND S.CourseNumber=C.Number AND P.SSN = '324-01-2489'; 
*/


--Professor B
/*
SELECT E.Grade, COUNT(*)
FROM COURSE C, SECTION S, ENROLLMENT E
WHERE E.SecNumber = S.SecNumber AND 
      S.CourseNumber = C.Number AND
      S.SecNumber = '221A-01' AND
      S.CourseNumber = '221A'
GROUP BY E.Grade;
*/


--Student A
/*
SELECT S.SecNumber, S.Classroom, S.MeetingDays, S.BeginningTime, S.EndTime, COUNT(*)
FROM COURSE C, SECTION S, ENROLLMENT E
WHERE (C.Number = S.CourseNumber) AND
      (C.Number = '221A') AND (E.SecNumber = S.SecNumber)
GROUP BY (E.SecNumber);
*/

--Student B
/*
SELECT C.Number, C.Title, E.Grade
FROM ENROLLMENT E, SECTION S, COURSE C, STUDENT ST
WHERE E.SecNumber = S.SecNumber AND 
      S.CourseNumber = C.Number AND
      E.StudentCWID = ST.CWID AND
      ST.CWID = '009';
*/
