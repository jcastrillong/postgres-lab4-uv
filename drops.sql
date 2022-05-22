-- Borrar las tablas
DROP TABLE student, instructor, course, course_offering, enrols, teaches, requires;

-- Borrar las secuencias
DROP SEQUENCE seq_student, seq_course;

-- Borrar las funciones
DROP FUNCTION create_teaches(), punto4ai(), punto4aii();

-- Borrar las triggers
DROP TRIGGER punto4ai on enrols; 
 
DROP TRIGGER punto4aii on enrols;
