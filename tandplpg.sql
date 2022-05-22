-- Cree uno o varios disparadores (triggers) que implemente los siguiente requerimientos para la relación.Al agregar una tupla en enrolls, en caso de que la nota sea negativa, cero (0.0) o mayor de 5.00 se debe generar una excepción indicando que el valor a guardar en grade es incorrecto o invalido.
CREATE FUNCTION punto4ai() 
RETURNS TRIGGER AS
$BODY$
BEGIN
   IF NEW.grade < 0.0 OR NEW.grade > 5.00 THEN
      RAISE EXCEPTION 'Grade must be between 0.0 and 5.00';
   END IF;
   RETURN NEW;
 
END;
$BODY$
LANGUAGE PLPGSQL;
 
CREATE TRIGGER punto4ai
BEFORE INSERT ON enrols
FOR EACH ROW
EXECUTE PROCEDURE punto4ai();

-- Durante la actualización de un registro si el valor grade es modificado, usando RAISE NOTICE se debe presentar un mensaje indicando el cambio, si es igual al valor grade en la tabla se debe indicar que el valor no ha sido modificado. Si el grade a actualizar es negativo, cero o mayor de cinco use RAISE EXCEPTION.
CREATE FUNCTION punto4aii()
RETURNS TRIGGER AS
$BODY$
BEGIN
    IF NEW.grade < 0.0 OR NEW.grade > 5.00 THEN
        RAISE EXCEPTION 'Grade must be between 0.0 and 5.00';
    ELSE:
    IF OLD.grade = NEW.grade THEN
        RAISE NOTICE 'Grade not changed';
    ELSE:
    IF OLD.grade != NEW.grade THEN
        RAISE NOTICE 'Grade changed';
    END IF;
    END IF;
    END IF;
    RETURN NEW;
END;
$BODY$
LANGUAGE PLPGSQL;

CREATE TRIGGER punto4aii
BEFORE UPDATE ON enrols
FOR EACH ROW
EXECUTE PROCEDURE punto4aii();


-- Cree un procedimiento create_teaches que automáticamente agregue un registro a teaches. Este recibe dos argumentos un identificador de instructor instructor_id y un identificador de course_id. Se asume que ambos existen en la base de datos. Este procedimiento debe verificar que el curso exista en la oferta de cursos. Use curse_id, sec_id, year y semester de la oferta de curso y instructor_id el para insertar en teaches.
CREATE FUNCTION create_teaches(instructorid integer, courseid integer)
RETURNS void AS
$BODY$
BEGIN
  IF NOT EXISTS (SELECT * FROM course WHERE course_id = courseid) THEN
      RAISE EXCEPTION 'Course does not exist';
  ELSE
  IF NOT EXISTS (SELECT * FROM teaches WHERE instructor_id = instructorid AND course_id = courseid) THEN
      INSERT INTO teaches (instructor_id, course_id, sec_id,semester, year )
      VALUES (instructorid, courseid, 1, 1, YEAR(GETDATE()) );
  END IF;
  END IF;
END;
$BODY$
LANGUAGE PLPGSQL;

-- Ejecutar el procedimiento create_teaches:
SELECT create_teaches(instructorid, courseid);