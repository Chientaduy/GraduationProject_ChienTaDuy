CREATE DATABASE StudentManagement;
USE StudentManagement;
GO

CREATE SCHEMA chientd3;
CREATE TABLE chientd3.Faculty (
  faculty_id   VARCHAR(200) NOT NULL IDENTITY (1, 1),
  faculty_name VARCHAR(200) NOT NULL,
  update_day   DATE                  DEFAULT GETDATE(),
  CONSTRAINT PK_chientd3_faculty PRIMARY KEY (faculty_id)
);
CREATE TABLE chientd3.Class (
  class_id     VARCHAR(11)  NOT NULL IDENTITY (1, 1),
  faculty_id   VARCHAR(200) NOT NULL,
  year         VARCHAR(200) NOT NULL,
  class_name   VARCHAR(200),
  lecturer_id  VARCHAR(200) NOT NULL,
  class_status BIT                   DEFAULT 1,
  update_day   DATE                  DEFAULT getdate(),
  CONSTRAINT PK_chientd3_Class PRIMARY KEY (class_id, faculty_id),
  CONSTRAINT FK_chientd3_Student_faculty_id FOREIGN KEY (faculty_id) REFERENCES chientd3.Faculty (faculty_id),
  CONSTRAINT FK_chientd3_Student_lecturer_id FOREIGN KEY (lecturer_id) REFERENCES chientd3.Lecturer (lecturer_id)
);
CREATE TABLE chientd3.Student (
  student_id         VARCHAR(200) NOT NULL IDENTITY (1, 1),
  class_id           VARCHAR(200) NOT NULL,
  student_first_name VARCHAR(200) NOT NULL,
  student_last_name  VARCHAR(200) NOT NULL,
  student_birthday   DATE         NOT NULL,
  student_gender     BIT,
  student_address    VARCHAR(200) NOT NULL,
  student_hometown   VARCHAR(200),
  student_email      VARCHAR(200),
  student_phone      VARCHAR(200),
  student_status     BIT          NOT NULL DEFAULT 1,
  update_day         DATE                  DEFAULT GETDATE(),
  CONSTRAINT PK_chientd3_Student PRIMARY KEY (student_id, class_id),
  CONSTRAINT FK_chientd3_Student_class_id FOREIGN KEY (class_id) REFERENCES chientd3.Class (class_id)
);
CREATE TABLE chientd3.Lecturer (
  lecturer_id         VARCHAR(200) NOT NULL IDENTITY (1, 1),
  faculty_id          VARCHAR(200) NOT NULL,
  lecturer_first_name VARCHAR(200) NOT NULL,
  lecturer_last_name  VARCHAR(200) NOT NULL,
  lecturer_birthday   DATE         NOT NULL,
  lecturer_address    VARCHAR(200),
  lecturer_phone      VARCHAR(200),
  lecturer_email      VARCHAR(200),
  lecturer_status     BIT                   DEFAULT 1,
  update_day          DATE                  DEFAULT GETDATE(),
  CONSTRAINT PK_chientd3_Lecturer PRIMARY KEY (lecturer_id, faculty_id),
  CONSTRAINT FK_chientd3_Lecturer_falcuty_id FOREIGN KEY (faculty_id) REFERENCES chientd3.Faculty (faculty_id)
);
CREATE TABLE chientd3.Subject (
  subject_id   VARCHAR(200) NOT NULL IDENTITY (1, 1),
  subject_name VARCHAR(200) NOT NULL,
  update_day   DATE                  DEFAULT GETDATE(),
  CONSTRAINT PK_chientd3_Subject PRIMARY KEY (subject_id)
);
CREATE TABLE chientd3.Score (
  score_id VARCHAR(200) NOT NULL,

);

CREATE TABLE chientd3.Year (
  year_id    VARCHAR(200) NOT NULL IDENTITY (1, 1),
  start_year INT          NOT NULL,
  end_year   INT          NOT NULL,
  CONSTRAINT PK_chientd3_Year PRIMARY KEY (year_id),
  CONSTRAINT CK_chientd3_Year_start_year CHECK (start_year >= 1900 AND start_year <= 3000),
  CONSTRAINT CK_chientd3_Year_end_year CHECK (end_year >= 1900 AND end_year <= 3000 AND end_year >= start_year)
);