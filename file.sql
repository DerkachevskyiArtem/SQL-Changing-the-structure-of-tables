CREATE TABLE workers (
  id SERIAL PRIMARY KEY,
  full_name VARCHAR(255) NOT NULL,
  department VARCHAR(255),
  birthday DATE CHECK (birthday <= CURRENT_DATE - INTERVAL '18 years' AND birthday >= '1895-01-06'),
  salary NUMERIC(10, 2)
);

ALTER TABLE workers
ADD COLUMN vacation_days INT DEFAULT 0 CHECK (vacation_days >= 0);

ALTER TABLE workers
ADD COLUMN email VARCHAR(255) UNIQUE;

ALTER TABLE workers
ALTER COLUMN email SET NOT NULL;

ALTER TABLE workers
ADD CHECK (email != '');

ALTER TABLE workers
ALTER COLUMN salary SET DEFAULT 500;


ALTER TABLE workers
RENAME TO employees;