CREATE TABLE Departments (
  dept_no VARCHAR(4) PRIMARY KEY,
  dept_name VARCHAR(30) NOT NULL
	);

CREATE TABLE Titles (
  title_id VARCHAR(5) PRIMARY KEY,
  title VARCHAR(30) NOT NULL
	);
	
CREATE TABLE Employees (
  emp_no INT PRIMARY KEY,
  emp_title VARCHAR(5) NOT NULL,
	FOREIGN KEY (emp_title) REFERENCES Titles(title_id),
	birth_date VARCHAR(10) NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date VARCHAR(10) NOT NULL
	);
	
CREATE TABLE Employee_department (
  emp_no INT,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	dept_no VARCHAR(4),
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
	);
	
CREATE TABLE Department_manager (
	dept_no VARCHAR(4),
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
    emp_no INT,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
	);
	
CREATE TABLE Salaries (
    emp_no INT,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	salary INT NOT NULL
	);

UPDATE employees SET birth_date = to_date(birth_date, 'MM-DD-YYYY');
UPDATE employees SET hire_date = to_date(hire_date, 'MM-DD-YYYY');