Select * 
FROM courses;

SELECT * 
FROM Assignments;

-- Write a query to list all courses, concatenating the course_name and semester fields with a hyphen between them. Like this:
-- "IT Essentials - 2024-3"
SELECT CONCAT(course_name, ' - ', semester) AS course_details
FROM courses;


-- Write a query to find all courses that have a lab session scheduled on Friday. Include only the course_id, course_name, and lab_time in the result.
SELECT course_id, course_name, lab_time
FROM courses
WHERE lab_time LIKE 'Fri%';

-- Write a query to list all assignments with a due date after the current date.
SELECT id, title, due_date
FROM assignments
WHERE due_date > CURRENT_DATE;

-- Write a query to count the number of assignments for each status (e.g., "Not Started", "In Progress", "Completed").
SELECT status, COUNT(*) AS assignment_count
FROM assignments
GROUP BY status;

-- Write a query to find the course with the longest course_name. Use the length() function to compare the lengths.
SELECT course_id, course_name
FROM courses
WHERE LENGTH(course_name) = (
    SELECT MAX(LENGTH(course_name))
    FROM courses
);

-- Write a query to return a list of all course names in uppercase.
SELECT UPPER(course_name) AS course_name_uppercase
FROM courses;

-- Write a query to list the titles of all assignments that are due in September, regardless of year. Use the LIKE operator to filter due_date.
SELECT title,due_date
FROM assignments
WHERE due_date LIKE '%-09-%';

-- Write a query to find all assignments where the due_date is missing. Note, there are no assignments with NULL due_dates initially, but one was added if you ran the INSERT statement in the examples above. Hint: due_date IS NULL
INSERT INTO assignments (course_id, title, status) 
VALUES ('COMP1236', 'Assignment with no date', 'Not Started');
SELECT id, title
FROM assignments
WHERE due_date IS NULL;

-- Write a query to list each course_id along with the total number of assignments associated with it. Join the two tables and use the COUNT() function to aggregate the results.
SELECT c.course_id, COUNT(a.id) AS total_assignments
FROM courses c
LEFT JOIN assignments a ON c.course_id = a.course_id
GROUP BY c.course_id;

-- Write a query to find all courses that do not have any assignments.
SELECT c.course_id, c.course_name
FROM courses c
LEFT JOIN assignments a ON c.course_id = a.course_id
WHERE a.id IS NULL;