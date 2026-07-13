-- Question1 ==> Create a database and switch to it.
CREATE DATABASE CompanyDB;
USE CompanyDB;

-- Question 2 ==> Create a table Department
CREATE TABLE Department (
	dept_id INT PRIMARY KEY AUTO_INCREMENT,
	dept_name VARCHAR(50));

-- Question 3 ==> Create table Employee
CREATE TABLE Employee (
	emp_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(50),
    salary INT,
    dept_id INT,
    hire_date DATE,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id));
    
-- Question 4 ==> Create table Company
CREATE TABLE Company (
    company_id INT PRIMARY KEY AUTO_INCREMENT,
    company_name VARCHAR(100)
);

-- Question 5 ==> Add a new column email to the Employee table.
ALTER TABLE Employee
ADD COLUMN email VARCHAR(100);

-- Question 6 ==> Modify the salary column to DECIMAL(10,2).
ALTER TABLE Employee
MODIFY COLUMN salary DECIMAL(10,2);

-- Question 7 ==> Rename column dept_name in Department table to deptName.
ALTER TABLE Department
RENAME COLUMN dept_name TO deptName;

-- Question 8 ==> Delete the column email from the employee.
ALTER TABLE Employee
DROP COLUMN email;

-- Question 9 ==> Drop the table Company.
DROP TABLE Company;

-- Question 10 ==> Insert at least 5 departments
INSERT INTO Department(deptName) VALUES('HR');
INSERT INTO Department(deptName) VALUES('IT');
INSERT INTO Department(deptName) VALUES('Accounting');
INSERT INTO Department(deptName) VALUES('Sales');
INSERT INTO Department(deptName) VALUES('Operations');

-- Question 11 ==> Insert 8 employees with different salaries & dept_ids
INSERT INTO Employee (emp_name, salary, dept_id, hire_date) VALUES ('Sri', 55000.00, 1, '2019-05-15');
INSERT INTO Employee (emp_name, salary, dept_id, hire_date) VALUES ('Ram', 68000.00, 2, '2022-07-05');
INSERT INTO Employee (emp_name, salary, dept_id, hire_date) VALUES ('Leo', 58000.00, 4, '2015-04-25');
INSERT INTO Employee (emp_name, salary, dept_id, hire_date) VALUES ('John', 44000.00, 1, '2022-07-22');
INSERT INTO Employee (emp_name, salary, dept_id, hire_date) VALUES ('Aaron', 54000.00, 3, '2024-06-24');
INSERT INTO Employee (emp_name, salary, dept_id, hire_date) VALUES ('Sona', 68000.00, 5, '2020-06-15');
INSERT INTO Employee (emp_name, salary, dept_id, hire_date) VALUES ('Stephy', 45000.00, 3, '2017-10-17');
INSERT INTO Employee (emp_name, salary, dept_id, hire_date) VALUES ('Anjana', 35000.00, 2, '2021-03-25');

-- Question 12 ==> Display all employees.
SELECT * FROM Employee;

-- Question 13 ==> Display only emp_name and salary.
SELECT emp_name,salary FROM Employee;

-- Question 14 ==> Find employees with salary greater than 50,000.
SELECT emp_name,salary FROM Employee WHERE salary>50000;

-- Question 15  ==> List employees hired after 2020.
SELECT emp_name,hire_date FROM Employee WHERE hire_date >'2020-12-31';

-- Question 16 ==> Increase salary of all employees by 10%.
UPDATE Employee SET salary=salary * 1.1;

-- Question 17 ==> Update department of an employee with emp_id = 3 to dept_id = 2.
UPDATE Employee SET dept_id=2 WHERE emp_id=3;

-- Question 18 ==> Change the dept_name of department 5 to "Marketing".
UPDATE Department SET deptName = 'Marketing' WHERE dept_id = 5;

-- Question 19 ==> Delete employees whose salary is less than 30,000.
DELETE FROM Employee WHERE salary<30000;

-- Question 20 ==> Delete a department whose dept_id = 4.
DELETE FROM Department WHERE dept_id = 4;

-- Question 21 ==> Display employee name, salary, and department name. (INNER JOIN)
SELECT e.emp_name,e.salary,d.deptName FROM Employee e INNER JOIN Department d ON e.emp_id=d.dept_id;

-- Question 22 ==> List all departments even if no employees are present. (LEFT JOIN)
SELECT d.deptName,e.emp_name FROM Department d LEFT JOIN Employee e ON d.dept_id=e.dept_id;

-- Question 23 ==> Show employees and their departments. If the department is missing, show NULL. (RIGHT JOIN)
SELECT e.emp_name, d.deptName FROM Department d RIGHT JOIN Employee e ON d.dept_id = e.dept_id;

-- Question 24 ==> Display employees ordered by salary (highest first).
SELECT * FROM Employee ORDER BY salary DESC; 

-- Question 25 ==> List departments ordered alphabetically by dept_name.
SELECT * FROM Department ORDER BY deptName ASC;

-- Question 26 ==> Display employees ordered by hire_date
SELECT * FROM Employee ORDER BY hire_date ASC;

-- Question 27 ==> Count how many employees are in each department.
SELECT d.dept_id, d.deptName, COUNT(e.emp_id) AS employee_count FROM Department d LEFT JOIN Employee e ON d.dept_id = e.dept_id GROUP BY d.dept_id, d.deptName;

-- Question 28 ==> Find the average salary of each department.
SELECT d.dept_id, d.deptName, AVG(e.salary) AS average_salary FROM Department d LEFT JOIN Employee e ON d.dept_id = e.dept_id GROUP BY d.dept_id, d.deptName;

-- Question 29 ==> Show the maximum and minimum salary in the company.
SELECT MAX(salary) AS maximum_salary, MIN(salary) AS minimum_salary FROM Employee;

-- Question 30 ==> Find the total salary paid per department.
SELECT d.dept_id, d.deptName, SUM(e.salary) AS total_salary FROM Department d INNER JOIN Employee e ON d.dept_id = e.dept_id GROUP BY d.dept_id, d.deptName;

-- Question 31 ==> Show departments with more than 2 employees.
SELECT d.dept_id, d.deptName, COUNT(e.emp_id) AS employee_count FROM Department d INNER JOIN Employee e ON d.dept_id = e.dept_id GROUP BY d.dept_id, d.deptName HAVING COUNT(e.emp_id) > 2;

-- Question 32 ==> Show departments where average salary > 60,000.
SELECT d.dept_id, d.deptName, AVG(e.salary) AS average_salary FROM Department d INNER JOIN Employee e ON d.dept_id = e.dept_id GROUP BY d.dept_id, d.deptName HAVING AVG(e.salary)>60000;

-- Question 33 ==> Show only those departments whose total salary > 1,50,000.
SELECT d.dept_id, d.deptName, SUM(e.salary) AS total_salary FROM Department d INNER JOIN Employee e ON d.dept_id = e.dept_id GROUP BY d.dept_id, d.deptName HAVING SUM(e.salary)>150000;

-- Question 34 ==> Create an index named idx_employee_name on the emp_name column of the Employee table.
CREATE INDEX idx_employee_name ON Employee(emp_name);

-- Question 35 ==> Search and display all details of employee whose name is "John"
SELECT * FROM Employee WHERE emp_name="John";

-- Question 36 ==> create a composite index named idx_dept_salary on the dept_id and salary columns of the Employee table.
CREATE INDEX idx_dept_salary ON Employee(dept_id,salary);

-- Question 37 ==> Display all indexes on employee table
SHOW INDEX FROM Employee;

-- Question 38 ==> Use the EXPLAIN statement to view the execution plan for the query that fetches all records of the employee named John from the Employee table.
EXPLAIN SELECT * FROM Employee WHERE emp_name="John";

-- Question 39 ==>  Find the employee with the second lowest salary.


-- Question 40 ==> Find duplicate employee names.
SELECT emp_name, COUNT(*) AS name_count FROM Employee GROUP BY emp_name HAVING COUNT(*) > 1;

-- Question 41 ==> Find employees earning more than their department's average salary.


-- Question 42 ==> Display each employee along with the total salary of their department.


-- Question 43 ==> Find the department with the highest total salary.


-- Question 44 ==> Find employees hired in the last 2 years.


-- Question 45 ==> List the top 2 highest-paid employees in each department.


-- Question 46 ==> Find employees whose salary is between the average and maximum salary.
SELECT * FROM Employee WHERE salary BETWEEN (SELECT AVG(salary) FROM Employee) AND (SELECT MAX(salary) FROM Employee);

-- Question 47 ==> Find departments where every employee earns more than 50,000.


-- Question 48 ==> Display the cumulative salary (running total) ordered by hire date using a window function.

