-- Crear sequencia para la tabla estudiante
CREATE SEQUENCE IF NOT EXISTS seq_student INCREMENT 168 START 7488;

-- Crear sequencia para la tabla curso
CREATE SEQUENCE IF NOT EXISTS seq_course INCREMENT 23 START 837827;

-- Describiendo y creando tablas
CREATE TABLE IF NOT EXISTS student (
  student_id INTEGER PRIMARY KEY DEFAULT nextval('seq_student'),
  name VARCHAR(255) NOT NULL,
  program VARCHAR(255) NOT NULL
)

CREATE TABLE IF NOT EXISTS instructor (
  instructor_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  dept VARCHAR(255) NOT NULL,
  title VARCHAR(255) NOT NULL
)

CREATE TABLE IF NOT EXISTS course (
  course_id INTEGER PRIMARY KEY DEFAULT nextval('seq_course'),
  title VARCHAR(255) NOT NULL,
  syllabus VARCHAR(255) NOT NULL,
  credits INTEGER NOT NULL
)

CREATE TABLE IF NOT EXISTS course_offering (,
  course_id SERIAL,
  sec_id SERIAL,
  year INTEGER NOT NULL,
  semester INTEGER NOT NULL,
  time TIME NOT NULL,
  classroom VARCHAR(255) NOT NULL,
  PRIMARY KEY (course_id, sec_id, year, semester),
  FOREIGN KEY (course_id) REFERENCES course (course_id)
)

CREATE TABLE IF NOT EXISTS enrols (
  student_id INTEGER NOT NULL,
  course_id INTEGER NOT NULL,
  sec_id INTEGER NOT NULL,
  semester VARCHAR(255) NOT NULL,
  year INTEGER NOT NULL,
  grade NUMERIC(3, 2) CHECK(grade > 1.00 AND grade < 5.00) NOT NULL,
  PRIMARY KEY (student_id, course_id, sec_id, semester, year),
  FOREIGN KEY (student_id) REFERENCES student (student_id),
  FOREIGN KEY (course_id) REFERENCES course (course_id),
)

CREATE TABLE IF NOT EXISTS teaches (
  course_id INTEGER NOT NULL,
  sec_id INTEGER NOT NULL,
  semester VARCHAR(255) NOT NULL,
  year INTEGER NOT NULL,
  instructor_id INTEGER NOT NULL,
  PRIMARY KEY (course_id, sec_id, semester, year, instructor_id),
  FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id),
  FOREIGN KEY (course_id) REFERENCES course (course_id),
)

CREATE TABLE IF NOT EXISTS requires (
  main_course_id INTEGER NOT NULL,
  prerequisite INTEGER NOT NULL,
  PRIMARY KEY (main_course_id, prerequisite),
  FOREIGN KEY (main_course_id) REFERENCES course (course_id),
  FOREIGN KEY (prerequisite) REFERENCES course (course_id),
)

