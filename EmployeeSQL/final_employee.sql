----------------
----part 1------
----------------

CREATE TABLE titles (
    title_id varchar NOT NULL,
    title varchar NOT NULL,
    PRIMARY KEY (title_id)
);

CREATE TABLE salaries (
    emp_no int NOT NULL,
    salary int NOT NULL,
    PRIMARY KEY (emp_no)
);


CREATE TABLE employees (
    emp_no int NOT NULL,
    emp_title_id varchar NOT NULL,
    birth_date date NOT NULL,
    first_name varchar NOT NULL,
    last_name varchar NOT NULL,
    sex varchar NOT NULL,
    hire_date date NOT NULL,
    PRIMARY KEY (emp_no),
	FOREIGN KEY("emp_no") REFERENCES "salaries" ("emp_no")
);


CREATE TABLE dept_manager (
    dept_no varchar NOT NULL,
    emp_no int NOT NULL,
    PRIMARY KEY (emp_no),
	FOREIGN KEY("emp_no") REFERENCES "employees" ("emp_no")
);


CREATE TABLE dept_emp (
    emp_no int NOT NULL,
	dept_no varchar NOT NULL
);


CREATE TABLE departments (
    depart_no varchar NOT NULL,
    dept_name varchar NOT NULL,
    PRIMARY KEY (depart_no)
);

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_departments_depart_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("depart_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_titles_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

----------------
----part 2------
----------------

SELECT * FROM departments

SELECT * FROM dept_emp

SELECT * FROM dept_manager

SELECT * FROM employees

--SELECT * FROM salaries

--SELECT * FROM titles
--

SELECT e.emp_no, e.first_name, e.last_name, e.sex, s.salary
FROM salaries as s
INNER JOIN employees as e ON
s.emp_no=e.emp_no;


SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'

SELECT de.dept_name AS department_name, d.depart_no AS department_number, dm.emp_no AS manager_employee_number,
e.first_name AS manager_first_name, e.last_name AS manager_last_name
FROM departments AS d
JOIN dept_manager AS dm ON
d.depart_no=dm.dept_no
JOIN employees AS e ON
e.emp_no=dm.emp_no;

SELECT de.dept_no AS department_number, de.emp_no AS employee_number, e.last_name AS employee_last_name,
e.first_name AS employee_first_name, d.dept_name AS department_name
FROM dept_emp AS de
JOIN employees AS e ON
de.emp_no=e.emp_no
JOIN departments AS d ON
d.depart_no=de.dept_no;

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name = 'B%'

SELECT e.emp_no, e.last_name, e.first_name
FROM employees AS e
WHERE e.emp_no IN (
	SELECT de.emp_no
	FROM dept_emp AS de
	WHERE de.dept_no IN (
		SELECT d.depart_no
		FROM departments AS d
		WHERE d.dept_name = 'Sales'
	)
);

--SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
--FROM employees AS e
--WHERE e.emp_no IN (
--	SELECT de.emp_no
--	FROM dept_emp AS de
--	WHERE de.dept_no IN (
--		SELECT d.depart_no
--		FROM departments AS d
--		WHERE d.dept_name = 'Sales' OR 'Development'
--	)
);