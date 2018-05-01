DROP USER michael;

DROP DATABASE IF EXISTS todo_app;

CREATE USER michael;
ALTER USER michael WITH ENCRYPTED PASSWORD 'stonebreaker';

CREATE DATABASE todo_app;
\c todo_app;
CREATE TABLE Tasks (
  ID SERIAL NOT NULL,
  title varchar(225) NOT NULL,
  description text NULL,
  created_at timestamp without time zone NOT NULL DEFAULT now(),
  updated_at timestamp without time zone NULL,
  completed boolean NULL NULL,
  PRIMARY KEY (ID)
);

ALTER TABLE Tasks
DROP COLUMN completed;

ALTER TABLE Tasks
ADD completed_at timestamp without time zone NULL DEFAULT NULL;

ALTER TABLE Tasks
ALTER COLUMN updated_at SET NOT NULL,
ALTER COLUMN updated_at SET DEFAULT now();

INSERT INTO Tasks
VALUES (default, 'Study SQL', 'Complete this exercise', now(), now(), NULL);

INSERT INTO Tasks(title, description)
VALUES ('Study PostgreSQL', 'Read all the documentation');

SELECT title
FROM Tasks
WHERE completed_at IS NULL;

UPDATE tasks
SET completed_at = now()
WHERE title = 'Study SQL';

SELECT title, description
FROM Tasks
WHERE completed_at IS NULL;

SELECT *
FROM Tasks
ORDER BY created_at DESC;

INSERT INTO Tasks(title, description)
VALUES ('mistake 1', 'a test entry');

INSERT INTO Tasks(title, description)
VALUES ('mistake 2', 'another title entry');

INSERT INTO Tasks(title, description)
VALUES ('third mistake', 'another test entry');

SELECT title
FROM Tasks
WHERE title LIKE '%mistake%';

DELETE FROM Tasks
WHERE title='mistake 1';

SELECT title, description
FROM Tasks
WHERE title LIKE '%mistake%';

DELETE FROM Tasks
WHERE title LIKE '%mistake%';

SELECT *
FROM Tasks
ORDER BY title ASC;