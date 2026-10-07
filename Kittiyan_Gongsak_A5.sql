-- Example filename: larni_ashkan_A5.sql
/*
DO NOT TOUCH THE COMMENTS.
Just write your code in the specified sections.
*/
/* PART 1 */


-- YOUR CODE HERE
SELECT person_name
FROM works 
WHERE company_name = 'ACME Corporation' AND salary > 50000;



/*
DO NOT TOUCH THE COMMENTS.
Just write your code in the specified sections.
*/
/* PART 2 */


-- YOUR CODE HERE
SELECT lives.person_name, street, city
FROM lives, works
WHERE lives.person_id = works.person_id
AND company_name = 'ACME Corporation' AND salary > 50000;

/*
DO NOT TOUCH THE COMMENTS.
Just write your code in the specified sections.
*/
/* PART 3 */


-- YOUR CODE HERE
SELECT l.person_name
FROM lives l, works w, located_in c
WHERE l.person_id = w.person_id
AND w.company_name = c.company_name
AND l.city = c.city;


/*
DO NOT TOUCH THE COMMENTS.
Just write your code in the specified sections.
*/
/* PART 4 */


-- YOUR CODE HERE
SELECT DISTINCT p.person_name
FROM lives p, manages m, lives mgr
WHERE p.person_name = m.person_name
AND m.manager_name = mgr.person_name
AND p.street = mgr.street
AND p.city = mgr.city;


/*
DO NOT TOUCH THE COMMENTS.
Just write your code in the specified sections.
*/
/* PART 5 */


-- YOUR CODE HERE
SELECT person_name
FROM lives
WHERE person_id NOT IN (SELECT person_id FROM works WHERE company_name = 'ACME Corporation');


/*
DO NOT TOUCH THE COMMENTS.
Just write your code in the specified sections.
*/
/* PART 6 */


-- YOUR CODE HERE
SELECT person_name
FROM works
WHERE salary > ALL (SELECT salary FROM works WHERE company_name = 'ACME Corporation');


/*
DO NOT TOUCH THE COMMENTS.
Just write your code in the specified sections.
*/
/* PART 7 */


-- YOUR CODE HERE
SELECT DISTINCT s.company_name
FROM located_in s
WHERE NOT EXISTS ((SELECT city FROM located_in WHERE company_name = 'ACME Corporation')
EXCEPT (SELECT city FROM located_in t WHERE t.company_name = s.company_name));


/* END */
