CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    department_id INT,
    grade FLOAT
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    department_id INT
);

CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    score INT
);


INSERT INTO departments VALUES
(1, 'Computer Science'),
(2, 'Mathematics'),
(3, 'Physics'),
(4, 'Biology');

INSERT INTO students VALUES
(101, 'Alice', 20, 1, 8.5),
(102, 'Bob', 22, 1, 6.8),
(103, 'Charlie', 21, 2, 7.5),
(104, 'Diana', 23, 3, 9.1),
(105, 'Evan', 20, 2, 8.2),
(106, 'Fiona', 24, 4, 5.9);

INSERT INTO courses VALUES
(201, 'Data Structures', 1),
(202, 'Algorithms', 1),
(203, 'Calculus', 2),
(204, 'Linear Algebra', 2),
(205, 'Quantum Mechanics', 3),
(206, 'Genetics', 4);

INSERT INTO enrollments VALUES
(1, 101, 201, 85),
(2, 101, 202, 88),
(3, 102, 201, 70),
(4, 103, 203, 95),
(5, 104, 205, 98),
(6, 105, 204, 90),
(7, 106, 206, 60),
(8, 102, 202, 75),
(9, 103, 204, 92),
(10, 105, 203, 88);


SELECT * FROM courses 
SELECT * FROM departments
SELECT * FROM enrollments
SELECT * FROM students

-- 🔍 10 SQL Subquery Practice Questions


-- Q1 Find the names of students who have a grade higher than the average grade of all students.

SELECT student_id, name, grade 
FROM students
WHERE grade >= (SELECT ROUND(AVG(grade) :: NUMERIC, 2)
                 FROM students )

-- Q2 List the names of students who are enrolled in the course with the highest score.

SELECT * FROM enrollments
SELECT * FROM students

SELECT student_id, name 
FROM students
WHERE student_id IN (
                       SELECT student_id 
					   FROM enrollmentS 
                       WHERE score = (SELECT MAX(score) FROM enrollments))

-- USE JOIN METHOD TOO ---------------------------------------------------------------------- N

SELECT s.student_id, s.name, s.grade, e.score, e.course_id
FROM students AS s
JOIN enrollments AS e
ON s.student_id = e.student_id 
ORDER by score DESC 
LIMIT 1 

-- Q3 Find the names of students who are in the same department as the student 'Alice'.

SELECT * FROM students 

SELECT name 
FROM students 
WHERE department_id = (SELECT department_id 
                       FROM students
                       WHERE name = 'Alice')
					  

-- Q4 List the course names that the student with the highest grade is enrolled in.

SELECT * FROM courses
SELECT * FROM students 

SELECT course_name 
FROM courses
WHERE department_id IN (
SELECT   department_id 
FROM students 
WHERE grade = (SELECT MAX(grade)
FROM students ))


-- Q5 Show the names of students who are not enrolled in any course.

SELECT * FROM Students
SELECT * FROM courses
SELECT * FROM enrollments

SELECT name 
FROM students 
WHERE student_id IN (SELECT student_id
                         FROM enrollments)

SELECT COUNT(DISTINCT student_id)
FROM enrollments


-- Q6 Find the student(s) who scored the highest in the course 'Calculus'.

SELECT name 
FROM students 
WHERE student_id IN ( 
SELECT student_id 
FROM enrollments
WHERE score = ( SELECT MAX(score) FROM enrollments))


-- Q7 Display the department names that have more than one student.
 
SELECT department_name
FROM departments
WHERE department_id IN (
    SELECT department_id
    FROM students
    GROUP BY department_id
    HAVING COUNT(student_id) > 1
);

-- Q8 List students who have enrolled in all courses offered by their department.

SELECT * FROM courses
SELECT * FROM students 
SELECT * FROM enrollments 
SELECT * FROM departments 


SELECT name
FROM students s
WHERE NOT EXISTS (
    SELECT *
    FROM courses c
    WHERE c.department_id = s.department_id
    AND NOT EXISTS (
        SELECT *
        FROM enrollments e
        WHERE e.student_id = s.student_id
        AND e.course_id = c.course_id
    )
);

-- Q9 Find the departments with the lowest average student grade.

SELECT department_name
FROM departments
WHERE department_id = (
    SELECT department_id
    FROM students
    GROUP BY department_id
    ORDER BY AVG(grade) ASC
    LIMIT 1
);

-- Q10 Show students whose total enrollment score is higher than the average total score of all students.

SELECT s.name, SUM(e.score) AS total_score
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
GROUP BY s.student_id, s.name
HAVING SUM(e.score) > (
    SELECT AVG(total_score)
    FROM (
        SELECT student_id, SUM(score) AS total_score
        FROM enrollments
        GROUP BY student_id
    ) AS student_totals
);
