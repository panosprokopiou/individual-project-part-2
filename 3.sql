CREATE SCHEMA private_school;

CREATE TABLE private_school.student ( 
	id                   int UNSIGNED NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	first_name           varchar(32)  NOT NULL    ,
	last_name            varchar(32)  NOT NULL    ,
	date_of_birth        date  NOT NULL    ,
	tuition_fees         decimal(8,2)  NOT NULL    
 );

CREATE TABLE private_school.trainer ( 
	id                   int UNSIGNED NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	first_name           varchar(100)  NOT NULL    ,
	last_name            varchar(100)  NOT NULL    ,
	subject              varchar(48)  NOT NULL    
 );

CREATE TABLE private_school.course ( 
	id                   int UNSIGNED NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	title                varchar(48)  NOT NULL    ,
	start_date           date  NOT NULL    ,
	duration             int UNSIGNED NOT NULL    ,
	trainer_id           int UNSIGNED NOT NULL    ,
	CONSTRAINT fk_course_trainer FOREIGN KEY ( trainer_id ) REFERENCES private_school.trainer( id ) ON DELETE NO ACTION ON UPDATE CASCADE
 );

CREATE TABLE private_school.course_student ( 
	id                   int UNSIGNED NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	course_id            int UNSIGNED NOT NULL    ,
	student_id           int UNSIGNED NOT NULL    ,
	CONSTRAINT idx_course_student UNIQUE ( course_id, student_id ) ,
	CONSTRAINT fk_course_student_course FOREIGN KEY ( course_id ) REFERENCES private_school.course( id ) ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT fk_course_student_student FOREIGN KEY ( student_id ) REFERENCES private_school.student( id ) ON DELETE NO ACTION ON UPDATE NO ACTION
 );

CREATE TABLE private_school.assignment ( 
	id                   int UNSIGNED NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	title                varchar(48)  NOT NULL    ,
	description          varchar(255)  NOT NULL    ,
	deadline             date  NOT NULL    ,
	course_id            int UNSIGNED NOT NULL    ,
	CONSTRAINT fk_assignment_course FOREIGN KEY ( course_id ) REFERENCES private_school.course( id ) ON DELETE NO ACTION ON UPDATE CASCADE
 );

CREATE TABLE private_school.assignment_student ( 
	id                   int UNSIGNED NOT NULL  AUTO_INCREMENT  PRIMARY KEY,
	assignment_id        int UNSIGNED NOT NULL    ,
	student_id           int UNSIGNED NOT NULL    ,
	grade                int UNSIGNED NOT NULL    ,
	CONSTRAINT fk_assignment_student_assignment FOREIGN KEY ( assignment_id ) REFERENCES private_school.assignment( id ) ON DELETE NO ACTION ON UPDATE CASCADE,
	CONSTRAINT fk_assignment_student_student FOREIGN KEY ( student_id ) REFERENCES private_school.student( id ) ON DELETE NO ACTION ON UPDATE CASCADE
 );

INSERT INTO private_school.student( id, first_name, last_name, date_of_birth, tuition_fees ) VALUES ( 1, 'Nikos', 'Kalantas', '2007-12-12', 2500.00 ); 
INSERT INTO private_school.student( id, first_name, last_name, date_of_birth, tuition_fees ) VALUES ( 2, 'Savvas', 'Savvidis', '2006-10-03', 2500.00 ); 
INSERT INTO private_school.student( id, first_name, last_name, date_of_birth, tuition_fees ) VALUES ( 3, 'Nikos', 'Nikopoulos', '1988-12-31', 2500.00 ); 
INSERT INTO private_school.trainer( id, first_name, last_name, subject ) VALUES ( 1, 'Peter', 'Pan', 'Java' ); 
INSERT INTO private_school.course( id, title, start_date, duration, trainer_id ) VALUES ( 1, 'Java', '2019-10-15', 90, 1 ); 
INSERT INTO private_school.assignment( id, title, description, deadline, course_id ) VALUES ( 1, 'Project A', 'polu grapsimo', '2019-12-04', 1 ); 

select * from student;
select * from trainer;
select * from course;
select * from assignment;

-- STUDENT PER COURSE
SELECT S.ID, S.FIRST_NAME, S.LAST_NAME, C.ID C.TITLE
FROM STUDENT S, COURSE C, COURSE_STUDENT CS
WHERE C.COURSE_ID = CS.COURSE_STUDENT_ID
AND S.STUDENT_ID = CS.COURSE_STUDENT_ID;

--TRAINER PER COURSE
SELECT T.ID, S.FIRST_NAME, S.LAST_NAME
FROM TRAINER T, COURSE C, 
WHERE C.COURSE_ID = T.TRAINER_ID;





