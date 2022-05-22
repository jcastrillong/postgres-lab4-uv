-- Encuentre el dept, title de los instructores registrados en la base de datos

SELECT dept, title FROM instructor;

-- Indique el nombre y programa del estudiante con student_id = 7656

SELECT name, program FROM student WHERE student_id = 7656;

-- Encuentre los nombres de todos los estudiantes que se han matriculado en el curso con course_id = 837873

SELECT name FROM student 
JOIN enrols 
ON student.student_id = enrols.student_id 
WHERE course_id = 837873;

-- Cree una vista llamada better_students que presente los estudiantes que obtuvieron las notas más altas por cada semestre entre los años 1900 y 2018.

CREATE VIEW better_students AS
SELECT s.name, s.program, MAX(enrols.grade) AS max_grade, e.semester, e.year
FROM student AS s
JOIN enrols AS e
ON s.student_id = e.student_id
WHERE year >= 1900 AND year <= 2018
GROUP BY s.name;



