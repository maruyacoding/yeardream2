# a 
                    
SELECT DISTINCT student.name, student.id, course.dept_name, takes.year
FROM takes
LEFT JOIN course
ON takes.course_id = course.course_id
LEFT JOIN student
ON student.id = takes.id
WHERE course.dept_name = 'Comp. Sci.' and year = '2007';


# b
INSERT INTO course(course_id, dept_name, title, credits) 
      VALUES (001, 'Comp. Sci.','Weekly Seminar', 1);

# check
SELECT *
FROM course
WHERE title = 'Weekly Seminar';



# c 2007
INSERT INTO (SELECT student.id, dept_name, sec_id, semester, year
			FROM student
			LEFT JOIN takes
			ON student.id = takes.id
			WHERE dept_name = 'Comp. Sci.') (sec_id, semester, year)
VALUES ( '1', 'Fall', '2007');





# d
SELECT name, dept_name, salary
FROM instructor
WHERE salary IN
   (SELECT MIN(salary) FROM instructor 
      WHERE salary IN ( SELECT MAX(salary) FROM instructor GROUP BY dept_name));


# e 
SELECT instructor.ID, name, year, semester
FROM instructor
LEFT JOIN teaches
ON instructor.ID = teaches.ID
WHERE year = 2008 and semester = 'Fall';


# f
SELECT distinct student.name, dept_name, tot_cred, year
FROM student
LEFT JOIN takes
ON student.ID = takes.ID
WHERE (year = 2007) and (dept_name = 'Physics');



# g

SELECT instructor.name AS instructor_name, instructor.dept_name AS instructor_dept, student.name AS student_name, student.dept_name AS student_dept
FROM instructor
LEFT JOIN advisor
ON instructor.id = advisor.i_id
LEFT JOIN student
ON advisor.s_id = student.id
WHERE instructor.name = 'lee' and instructor.dept_name = 'Comp. Sci.' and instructor.dept_name != student.dept_name;




# h

#  UNION ALL


SELECT *
FROM student
LEFT JOIN takes
ON student.ID = takes.ID
GROUP BY student.name;


SELECT student.ID, student.name 
FROM student 
LEFT JOIN takes 
ON student.ID=takes.ID 
WHERE takes.ID IS NULL
UNION ALL
SELECT student.ID, student.name 
FROM student 
RIGHT JOIN takes 
ON student.ID=takes.ID 
WHERE takes.ID IS NULL;