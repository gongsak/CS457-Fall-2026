-- Example filename: larni_ashkan_A6.sql
/*
DO NOT TOUCH THE COMMENTS.
Just write your code in the specified sections.
*/
/* PART 1 */


-- YOUR CODE HERE
START TRANSACTION;
SAVEPOINT before_cleanup;

DELETE FROM lives
WHERE person_name IS NULL OR street IS NULL OR city IS NULL;

DELETE FROM located_in
WHERE company_name IS NULL OR city IS NULL;

DELETE FROM manages
WHERE person_name IS NULL OR manager_name IS NULL;

DELETE FROM works
WHERE person_name IS NULL OR company_name IS NULL
   OR salary < 0
   OR company_name NOT IN ('ACME Corporation', 'Bank of America', 'Chase', 'Capital One', 'UniCredit');

COMMIT;


/*
DO NOT TOUCH THE COMMENTS.
Just write your code in the specified sections.
*/
/* PART 2 */


-- YOUR CODE HERE
START TRANSACTION;
SAVEPOINT before_constraints;

ALTER TABLE lives
  MODIFY person_name VARCHAR(50) NOT NULL,
  MODIFY street VARCHAR(50) NOT NULL,
  MODIFY city VARCHAR(50) NOT NULL;

ALTER TABLE located_in
  MODIFY company_name VARCHAR(50) NOT NULL,
  MODIFY city VARCHAR(50) NOT NULL;

ALTER TABLE manages
  MODIFY person_name VARCHAR(50) NOT NULL,
  MODIFY manager_name VARCHAR(50) NOT NULL;
  
ALTER TABLE works
  MODIFY person_name VARCHAR(50) NOT NULL,
  MODIFY company_name VARCHAR(50) NOT NULL,
  ADD CONSTRAINT chk_salary CHECK (salary > 0),
  ADD CONSTRAINT chk_company CHECK (company_name IN ('ACME Corporation', 'Bank of America', 'Chase', 'Capital One', 'UniCredit'));

COMMIT;


/*
DO NOT TOUCH THE COMMENTS.
Just write your code in the specified sections.
*/
/* PART 3 */


-- YOUR CODE HERE
DROP TRIGGER IF EXISTS contractor_salary;

DELIMITER //
CREATE TRIGGER contractor_salary
BEFORE INSERT ON works
FOR EACH ROW
BEGIN
  IF NEW.salary = 0 THEN
    SET NEW.salary = 3000;
  END IF;
END//
DELIMITER ;

INSERT INTO works (person_id, person_name, company_name, salary)
VALUES (19, 'George Washington', 'ACME Corporation', 0);



/* END */
