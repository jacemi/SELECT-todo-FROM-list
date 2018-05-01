DROP USER michael;

DROP DATABASE IF EXISTS todo_app;

CREATE USER michael WITH ENCRYPTED PASSWORD 'stonebreaker';

CREATE DATABASE todo_app WITH OWNER michael;
\c todo_app;
CREATE TABLE tasks (
  id SERIAL PRIMARY KEY,
  title varchar(225) NOT NULL,
  description text,
  created_at timestamp without time zone NOT NULL DEFAULT now(),
  updated_at timestamp without time zone,
  completed boolean NOT NULL DEFAULT false
);
--table names lower case 
ALTER TABLE tasks
DROP COLUMN completed;

ALTER TABLE tasks
ADD COLUMN completed_at timestamp without time zone NULL DEFAULT NULL;

ALTER TABLE tasks
ALTER COLUMN updated_at SET NOT NULL,
ALTER COLUMN updated_at SET DEFAULT now();

INSERT INTO tasks
VALUES (DEFAULT, 'Study SQL', 'Complete this exercise', now(), now(), NULL);

INSERT INTO tasks(title, description)
VALUES ('Study PostgreSQL', 'Read all the documentation');

SELECT title
FROM tasks
WHERE completed_at IS NULL;

UPDATE tasks
SET completed_at = now()
WHERE title = 'Study SQL';

SELECT title, description
FROM tasks
WHERE completed_at IS NULL;

SELECT *
FROM tasks
ORDER BY created_at DESC;

INSERT INTO tasks(title, description)
VALUES ('mistake 1', 'a test entry');

INSERT INTO tasks(title, description)
VALUES ('mistake 2', 'another title entry');

INSERT INTO tasks(title, description)
VALUES ('third mistake', 'another test entry');

SELECT title
FROM tasks
WHERE title LIKE '%mistake%';

DELETE FROM tasks
WHERE title='mistake 1';

SELECT title, description
FROM tasks
WHERE title LIKE '%mistake%';

DELETE FROM tasks
WHERE title LIKE '%mistake%';

SELECT *
FROM tasks
ORDER BY title ASC;