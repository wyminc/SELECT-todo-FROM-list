DROP DATABASE IF EXISTS todo_app;

DROP USER IF EXISTS michael;

CREATE USER michael WITH ENCRYPTED PASSWORD 'stonebreaker';

CREATE DATABASE todo_app

CREATE TABLE tasks (
  id SERIAL PRIMARY KEY NOT NULL,
  title varchar(255) NOT NULL ,
  description text NULL,
  created_at timestamp WITHOUT TIME ZONE NOT NULL DEFAULT current_timestamp,
  updated_at timestamp NULL,
  completed boolean NOT NULL DEFAULT false
)

ALTER TABLE tasks DROP COLUMN completed;

ALTER TABLE tasks ADD COLUMN completed_at TIMESTAMP WITHOUT TIME ZONE DEFAULT NULL;

ALTER TABLE tasks ALTER COLUMN updated_at SET NOT NULL; 

ALTER TABLE tasks ALTER COLUMN updated_at SET DEFAULT current_timestamp;

INSERT INTO tasks VALUES (default, 'Study SQL', 'Complete this exercise', now(), now(), NULL);

INSERT INTO tasks VALUES(default, 'Study PostgreSQL', 'Read all the documentation');

SELECT title FROM tasks WHERE completed_at IS NULL;

UPDATE tasks SET completed_at = now() WHERE completed_at IS NULL AND title = 'Study SQL';

SELECT title, description from tasks WHERE completed_at IS NULL;

SELECT * FROM tasks ORDER BY created_at DESC;

INSERT INTO tasks VALUES(default, 'mistake 1', 'a test entry');
INSERT INTO tasks VALUES(default, 'mistake 2', 'another test entry');
INSERT INTO tasks VALUES(default, 'third mistake', 'another test entry');

SELECT title FROM tasks WHERE title LIKE '%mistake%';

DELETE FROM tasks WHERE title LIKE '%mistake%';

SELECT * FROM tasks ORDER BY title;


