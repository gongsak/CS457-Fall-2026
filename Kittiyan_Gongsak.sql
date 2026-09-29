-- Example filename: <larni><mohsen>.sql
/*
DO NOT TOUCH THE COMMENTS.
Just write your code in the specified sections.
*/
/* PART 1 */


-- YOUR CODE HERE
DROP DATABASE IF EXISTS Kittiyan_Gongsak;
CREATE DATABASE Kittiyan_Gongsak;
USE Kittiyan_Gongsak;


/*
DO NOT TOUCH THE COMMENTS.
Just write your code in the specified sections.
*/
/* PART 2 */


-- YOUR CODE HERE
CREATE TABLE located_in
  (company_name VARCHAR(50) NOT NULL CHECK (company_name <> ''),
  city VARCHAR(50) NOT NULL,
  CONSTRAINT pk_located_in PRIMARY KEY (company_name)
);

CREATE TABLE lives
  (person_id SMALLINT,
  person_name VARCHAR(50) NOT NULL CHECK (person_name <> ''),
  street VARCHAR(50),
  city VARCHAR(50),
  CONSTRAINT pk_lives PRIMARY KEY (person_id)
);

CREATE TABLE works
  (person_id SMALLINT REFERENCES lives(person_id),
  person_name VARCHAR(50) NOT NULL,
  company_id SMALLINT NOT NULL,
  company_name VARCHAR(50) NOT NULL REFERENCES located_in(company_name),
  salary INT CHECK (salary >= 0),
  CONSTRAINT pk_works PRIMARY KEY (person_id)
);

CREATE TABLE manages
  (person_name VARCHAR(50),
  manager_name VARCHAR(50) NOT NULL,
  CONSTRAINT pk_manages PRIMARY KEY (person_name),
  CHECK (person_name <> manager_name)
);


/*
DO NOT TOUCH THE COMMENTS.
Just write your code in the specified sections.
*/
/* PART 3 */


-- YOUR CODE HERE
INSERT INTO located_in (company_name, city) VALUES ('Tree Corp', 'New York City');
INSERT INTO located_in (company_name, city) VALUES ('Fountain Pens', 'New Orleans');
INSERT INTO located_in (company_name, city) VALUES ('Urns R Us', 'Las Vegas');

INSERT INTO lives (person_id, person_name, street, city) VALUES (0001, 'George Washington', '13th', 'New York City');
INSERT INTO lives (person_id, person_name, street, city) VALUES (0002, 'John Adams', 'Decatur', 'Las Vegas');
INSERT INTO lives (person_id, person_name, street, city) VALUES (0003, 'Thomas Jefferson', 'Gilespie', 'Seattle');

INSERT INTO works (person_id, person_name, company_id, company_name, salary) VALUES (0001, 'George Washington', 0001, 'Tree Corp', 54000);
INSERT INTO works (person_id, person_name, company_id, company_name, salary) VALUES (0002, 'John Adams', 0002, 'Fountain Pens', 40000);
INSERT INTO works (person_id, person_name, company_id, company_name, salary) VALUES (0003, 'Thomas Jefferson', 0002, 'Fountain Pens', 43000);

INSERT INTO manages (person_name, manager_name) VALUES ('John Adams', 'Thomas Jefferson');


/* END */