INSERT INTO student (`name`,`program`)
VALUES
  ("Thaddeus Blake","Quam Vel Associates"),
  ("George Marks","Eu Eros Foundation"),
  ("Jada Fitzgerald","Adipiscing Elit Curabitur Inc."),
  ("May Cote","Fames Ac Company"),
  ("Phoebe Parks","Vel Sapien Imperdiet Foundation");

INSERT INTO instructor (`name`,`dept`,`title`)
VALUES
  ("Rae Reynolds","Augue Eu Corp.","Amet Luctus PC"),
  ("Jemima West","Sociis Natoque LLC","Mollis Dui Limited"),
  ("Aristotle Compton","Hendrerit A Arcu Foundation","Non PC"),
  ("Norman Tyler","Aliquam Auctor Velit Corporation","Aliquet Nec LLP"),
  ("Marny Barrera","In Institute","Eleifend Egestas Associates");

INSERT INTO course (title, syllabus, credits)
VALUES
  ('aliquet diam.','vitae',1),
  ('dictum eleifend','fames',1),
  ('Mauris quis','aliquam',2),
  ('mi fringilla','metus.',4),
  ('ipsum primis','non',3);

INSERT INTO course_offering (`year`,`semester`,`time`,`classroom`, `course_id`)
VALUES
  (2023,7,"11:37 PM","Praesent eu dui.", 1),
  (2022,3,"12:51 PM","nunc ac mattis", 2),
  (2021,6,"6:45 AM","ac mi eleifend", 3),
  (2022,7,"7:36 PM","erat volutpat. Nulla", 4),
  (2022,7,"2:15 PM","sit amet orci.", 5);

INSERT INTO enrols (`sec_id`,`semester`,`year`,`grade`, `student_id`, `course_id`)
VALUES
  (3,7,2022,"2.85", 1, 3),
  (7,3,2022,"3.37", 4, 5),
  (10,6,2021,"1.43", 1, 5),
  (17,7,2022,"0.33", 2, 1),
  (2,7,2021,"1.49", 3, 2);

INSERT INTO teaches (`sec_id`,`semester`,`year`, `instructor_id`, `course_id`)
VALUES
  (3,7,"1976", 1, 1),
  (7,3,"2022", 2, 2),
  (10,6,"2021", 3, 3),
  (17,7,"2022", 4, 4),
  (2,7,"2021", 5, 5);

INSERT INTO requires (`main_course_id`,`prerrequisite`)
VALUES
  (1,2),
  (2,3),
  (3,4),
  (4,5),
  (5,6);