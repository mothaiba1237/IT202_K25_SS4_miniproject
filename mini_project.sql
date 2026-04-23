CREATE DATABASE CSDLSS4;
USE CSDLSS4;

CREATE TABLE Student (
student_id INT PRIMARY KEY AUTO_INCREMENT,
full_name VARCHAR(100) NOT NULL,
dob DATE,
email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Instructor (
instructor_id INT PRIMARY KEY AUTO_INCREMENT,
full_name VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Course (
course_id INT PRIMARY KEY AUTO_INCREMENT,
course_name VARCHAR(100) NOT NULL,
description TEXT,
total_sessions INT CHECK (total_sessions > 0),
instructor_id INT,
FOREIGN KEY (instructor_id) REFERENCES Instructor(instructor_id)
);

CREATE TABLE Enrollment (
enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
student_id INT,
course_id INT,
enroll_date DATE,
UNIQUE (student_id, course_id),
FOREIGN KEY (student_id) REFERENCES Student(student_id),
FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

CREATE TABLE Result (
result_id INT PRIMARY KEY AUTO_INCREMENT,
student_id INT,
course_id INT,
mid_score FLOAT CHECK (mid_score BETWEEN 0 AND 10),
final_score FLOAT CHECK (final_score BETWEEN 0 AND 10),
UNIQUE (student_id, course_id),
FOREIGN KEY (student_id) REFERENCES Student(student_id),
FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

INSERT INTO Student (full_name, dob, email) VALUES
('Nguyen Van A', '2003-01-01', '[a@gmail.com](mailto:a@gmail.com)'),
('Tran Thi B', '2003-02-02', '[b@gmail.com](mailto:b@gmail.com)'),
('Le Van C', '2003-03-03', '[c@gmail.com](mailto:c@gmail.com)'),
('Pham Thi D', '2003-04-04', '[d@gmail.com](mailto:d@gmail.com)'),
('Hoang Van E', '2003-05-05', '[e@gmail.com](mailto:e@gmail.com)');

INSERT INTO Instructor (full_name, email) VALUES
('Teacher 1', '[t1@gmail.com](mailto:t1@gmail.com)'),
('Teacher 2', '[t2@gmail.com](mailto:t2@gmail.com)'),
('Teacher 3', '[t3@gmail.com](mailto:t3@gmail.com)'),
('Teacher 4', '[t4@gmail.com](mailto:t4@gmail.com)'),
('Teacher 5', '[t5@gmail.com](mailto:t5@gmail.com)');

INSERT INTO Course (course_name, description, total_sessions, instructor_id) VALUES
('SQL Basic', 'Hoc SQL co ban', 20, 1),
('JavaScript', 'JS tu dau', 25, 2),
('HTML CSS', 'Frontend co ban', 15, 3),
('Data Structure', 'CTDL', 30, 4),
('C Programming', 'Lap trinh C', 20, 5);

INSERT INTO Enrollment (student_id, course_id, enroll_date) VALUES
(1,1,'2025-01-01'),
(1,2,'2025-01-02'),
(2,1,'2025-01-03'),
(3,3,'2025-01-04'),
(4,4,'2025-01-05');

INSERT INTO Result (student_id, course_id, mid_score, final_score) VALUES
(1,1,8,9),
(1,2,7,8),
(2,1,6,7),
(3,3,9,9.5),
(4,4,5,6);

UPDATE Student
SET email = '[newemail@gmail.com](mailto:newemail@gmail.com)'
WHERE student_id = 1;

UPDATE Course
SET description = 'SQL nang cao'
WHERE course_id = 1;

UPDATE Result
SET final_score = 10
WHERE student_id = 1 AND course_id = 1;

DELETE FROM Enrollment
WHERE student_id = 4 AND course_id = 4;

DELETE FROM Result
WHERE student_id = 4 AND course_id = 4;

SELECT * FROM Student;
SELECT * FROM Instructor;
SELECT * FROM Course;
SELECT * FROM Enrollment;
SELECT * FROM Result;

SELECT s.full_name, c.course_name, r.final_score
FROM Result r
JOIN Student s ON r.student_id = s.student_id
JOIN Course c ON r.course_id = c.course_id;
