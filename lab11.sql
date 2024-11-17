-- Write a query to display the title and due_date of assignments for the course COMP1234.
SELECT title, due_date
FROM assignments
WHERE course_id LIKE 'COMP1234'


-- Write a query to find the earliest assignment due date in the assignments table.
SELECT *
FROM assignments
WHERE due_date = (SELECT MIN(due_date) FROM assignments);


-- Write a query to find the latest assignment due date in the assignments table.
SELECT *
FROM assignments
WHERE due_date = (SELECT MAX(due_date) FROM assignments);


-- Write a query to find the title and course_id of assignments due on 2024-10-08.
SELECT title, course_id
FROM assignments
WHERE due_date = '2024-10-08';


-- Write a query to display the title and due_date of assignments due in October 2024.
SELECT title, due_date
FROM assignments
WHERE due_date LIKE '2024-10%';


-- Write a query to find the most recent due_date of assignments with a status of "Completed".
SELECT *
FROM assignments
WHERE status = 'Completed'
  AND due_date = (SELECT MAX(due_date) 
                  FROM assignments 
                  WHERE status = 'Completed');


-- Write a query to find the total number of assignments with a status of "Not Started".
SELECT COUNT(*) AS total_not_started
FROM assignments
WHERE status = 'Not Started';


-- Write a query to find the course_id and course_name of courses that have lab sessions on Tuesday.
SELECT *
FROM courses
WHERE lab_time LIKE 'Tue%';


-- Write a query that joins the two tables.
select assignments.course_id, assignments.title, courses.course_name
from assignments, courses 
where assignments.course_id = courses.course_id