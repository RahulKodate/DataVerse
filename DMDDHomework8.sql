CREATE DATABASE DMDDHomework8;
GO

USE DMDDHomework8;
GO

CREATE TABLE Student (StudentID int not null PRIMARY KEY, StudentName varchar(25));

CREATE TABLE Faculty (FacultyID int not null primary key, FacultyName varChar(25));

CREATE TABLE Course (CourseID varchar(8) primary key, CourseName varChar(18));

CREATE TABLE Qualified (FacultyID	INT NOT NULL,
                        CourseID varCHAR(8) NOT NULL, 
                        DateQualified DATE,
		                CONSTRAINT IsQualified_PK PRIMARY KEY (FacultyID,CourseID),
                        CONSTRAINT QualifiedFaculty_FK FOREIGN KEY (FacultyID) REFERENCES Faculty (FacultyID),
                        CONSTRAINT QualifiedCourse_FK FOREIGN KEY (CourseID) REFERENCES Course (CourseID));
-- drop table Section;
CREATE TABLE Section (SectionNo	 INT  NOT NULL,
		              Semester CHAR(7) NOT NULL,
     		          CourseID varCHAR(8) not null,
		              CONSTRAINT Section_PK PRIMARY KEY(CourseID, SectionNo, Semester),
                      CONSTRAINT UNIQUE_CN UNIQUE (SectionNo,Semester),
		              CONSTRAINT Section_FK FOREIGN KEY (CourseID) REFERENCES Course (CourseID));

CREATE TABLE Registration (StudentID 		INT 		NOT NULL,
	 	                   SectionNo		INT 		NOT NULL,
 	 	                   Semester			CHAR(7)		NOT NULL,
                           CONSTRAINT IsRegistered_PK PRIMARY KEY (StudentID,SectionNo, Semester),
                           CONSTRAINT StudentIsRegistered_FK FOREIGN KEY(StudentID) REFERENCES Student(StudentID),
                           CONSTRAINT CourseIsRegistered_FK FOREIGN KEY (SectionNo, Semester) REFERENCES Section(SectionNo, Semester));


INSERT Into Student VALUES(38214, 'Letersky');
INSERT Into Student VALUES(54907, 'Altvater');
INSERT Into Student VALUES(66324, 'Aiken');
INSERT Into Student VALUES(70542, 'Marra');

SELECT * from Student 

INSERT Into Faculty VALUES(2143, 'Birkin');
INSERT Into Faculty VALUES(3467, 'Berndt');
INSERT Into Faculty VALUES(4756, 'Collins');

SELECT * from Faculty 

INSERT Into Course VALUES('ISM 3113', 'Syst Analysis');
INSERT Into Course VALUES('ISM 3112', 'Syst Design');
INSERT Into Course VALUES('ISM 4212', 'Database');
INSERT Into Course VALUES('ISM 4930', 'Networking');

SELECT * from Course 

INSERT Into Qualified VALUES(2143,'ISM 3112', '01/9/1988');
INSERT Into Qualified VALUES(2143,'ISM 3113', '01/9/1988');
INSERT Into Qualified VALUES(3467,'ISM 4212', '01/9/1995');
INSERT Into Qualified VALUES(3467,'ISM 4930', '01/9/1996');
INSERT Into Qualified VALUES(4756,'ISM 3113', '01/9/1991');
INSERT Into Qualified VALUES(4756,'ISM 3112', '01/9/1991');

SELECT * from Qualified 

Insert Into Section VALUES(2712,'I-2008','ISM 3113');
Insert Into Section VALUES(2713,'I-2008','ISM 3113');
Insert Into Section VALUES(2714,'I-2008','ISM 4212');
Insert Into Section VALUES(2715,'I-2008','ISM 4930');

SELECT * from Section

Insert Into Registration VALUES(38214,2714,'I-2008');
Insert Into Registration VALUES(54907,2714,'I-2008');
Insert Into Registration VALUES(54907,2715,'I-2008');
Insert Into Registration VALUES(66324,2713,'I-2008');

SELECT * from Registration

