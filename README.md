# sql-challenge

DATA MODELING

First, I created an ERD to visualize the tables using QuickDBD

DATA ENGINEERING

I created the tables with all constraints in mind (data types, primary keys, and foreign keys). Tables were created in a certain order to allow linking them through foreign keys and constraints. 

CSVs were uploaded to each corresponding table.

DATA ANALYSIS

Using an inner join, I joined the salaries and employees table on employee number and listed the employee number, last name, first name, sex, and salary of each employee.

Selecting from the employees table using a data range for hire date, I listed he first name, last name, and hire date for the employees who were hired in 1986.

Joining the departments, dept_manager, and employees table, I was able to list the manager of each department along with their department number, department name, employee number, last name, and first name.

I joined the dept_emp, employees and departments tables and listed the department number for each employee along with that employee’s employee number, last name, first name, and department name.

Using the "where" command, I listed the first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

I used subqueries to list each employee in the Sales department, including their employee number, last name, and first name.

Joining the employees, dept_emp and departments tables, I was able to list each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

Using the "count" function ordered in descending order, I listed the frequency counts of all the employee last names.