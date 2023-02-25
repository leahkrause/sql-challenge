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
