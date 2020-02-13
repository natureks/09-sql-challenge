-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/FOEOwV
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Employee DB

DROP TABLE Dept_Employee;
DROP TABLE Dept_Manager;
DROP TABLE Salaries;
DROP TABLE Titles;
DROP TABLE Employees;
DROP TABLE Departments;

CREATE TABLE Employees (
    Emp_No INTEGER   NOT NULL,
    Birth_Date VARCHAR   NOT NULL,
    First_Name VARCHAR   NOT NULL,
    Last_Name VARCHAR   NOT NULL,
    Gender VARCHAR   NOT NULL,
    Hire_Date VARCHAR   NOT NULL,
    CONSTRAINT pk_Employees PRIMARY KEY (
        Emp_No
     )
);


CREATE TABLE Departments (
    Dept_No VARCHAR   NOT NULL,
    Dept_Name VARCHAR   NOT NULL,
    CONSTRAINT pk_Departments PRIMARY KEY (
        Dept_No
     )
);


CREATE TABLE Salaries (
    Emp_no INTEGER   NOT NULL,
    Salary INTEGER   NOT NULL,
    From_date VARCHAR   NOT NULL,
    To_date VARCHAR   NOT NULL,
    CONSTRAINT pk_Salaries PRIMARY KEY (
        Emp_no
     )
);

CREATE TABLE Titles (
    Emp_no INTEGER   NOT NULL,
    Title VARCHAR   NOT NULL,
    From_date VARCHAR   NOT NULL,
    To_date VARCHAR   NOT NULL
);

CREATE TABLE Dept_Employee (
    Emp_no INTEGER   NOT NULL,
    Dept_No VARCHAR   NOT NULL,
    From_Date VARCHAR   NOT NULL,
    To_Date VARCHAR   NOT NULL,
    CONSTRAINT pk_Dept_Employee PRIMARY KEY (
        Emp_no,
		Dept_No
     )
);

CREATE TABLE Dept_Manager (
    Dept_No VARCHAR   NOT NULL,
    Emp_no INTEGER   NOT NULL,
    From_Date VARCHAR   NOT NULL,
    To_Date VARCHAR   NOT NULL,
    CONSTRAINT pk_Dept_Manager PRIMARY KEY (
        Emp_no,
		Dept_No
     )
);

ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_Emp_no FOREIGN KEY(Emp_no)
REFERENCES Employees (Emp_No);

ALTER TABLE Titles ADD CONSTRAINT fk_Titles_Emp_no FOREIGN KEY(Emp_no)
REFERENCES Employees (Emp_No);

ALTER TABLE Dept_Employee ADD CONSTRAINT fk_Dept_Employee_Emp_no FOREIGN KEY(Emp_no)
REFERENCES Employees (Emp_No);

ALTER TABLE Dept_Employee ADD CONSTRAINT fk_Dept_Employee_Dept_No FOREIGN KEY(Dept_No)
REFERENCES Departments (Dept_No);

ALTER TABLE Dept_Manager ADD CONSTRAINT fk_Dept_Manager_Dept_No FOREIGN KEY(Dept_No)
REFERENCES Departments (Dept_No);

ALTER TABLE Dept_Manager ADD CONSTRAINT fk_Dept_Manager_Emp_no FOREIGN KEY(Emp_no)
REFERENCES Employees (Emp_No);

