-- Switch to master to avoid "in use" issue
USE master;
GO

-- Drop the HR database if it exists
IF DB_ID('HR') IS NOT NULL
BEGIN
    ALTER DATABASE HR SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE HR;
END
GO

-- Create the database
CREATE DATABASE HR;
GO

--Connect HR database
USE HR;
GO

-- Drop VIEW first
IF OBJECT_ID('emp_details_view', 'V') IS NOT NULL
    DROP VIEW emp_details_view;
GO


-- Drop CONSTRAINT 
IF EXISTS (
    SELECT 1 FROM sys.foreign_keys WHERE name = 'dept_mgr_fk'
)
    ALTER TABLE departments DROP CONSTRAINT dept_mgr_fk;
GO

-- Drop tables in dependency order
DROP VIEW IF EXISTS emp_details_view;
DROP TABLE IF EXISTS job_history;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS jobs;
DROP TABLE IF EXISTS locations;
DROP TABLE IF EXISTS countries;
DROP TABLE IF EXISTS regions;
GO

-- Regions table
CREATE TABLE regions (
    region_id INT NOT NULL PRIMARY KEY,
    region_name VARCHAR(25)
);
GO

-- Countries table
CREATE TABLE countries (
    country_id CHAR(2) NOT NULL PRIMARY KEY,
    country_name VARCHAR(40),
    region_id INT FOREIGN KEY REFERENCES regions(region_id)
);
GO

-- Locations table
CREATE TABLE locations (
    location_id INT PRIMARY KEY,
    street_address VARCHAR(40),
    postal_code VARCHAR(12),
    city VARCHAR(30) NOT NULL,
    state_province VARCHAR(25),
    country_id CHAR(2) FOREIGN KEY REFERENCES countries(country_id)
);
GO

-- Departments table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(30) NOT NULL,
    manager_id INT NULL, -- FK later to employees
    location_id INT FOREIGN KEY REFERENCES locations(location_id)
);
GO

-- Jobs table
CREATE TABLE jobs (
    job_id VARCHAR(10) PRIMARY KEY,
    job_title VARCHAR(35) NOT NULL,
    min_salary INT,
    max_salary INT
);
GO

-- Employees table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR(25) NOT NULL,
    email VARCHAR(25) NOT NULL UNIQUE,
    phone_number VARCHAR(20),
    hire_date DATE NOT NULL,
    job_id VARCHAR(10) NOT NULL FOREIGN KEY REFERENCES jobs(job_id),
    salary DECIMAL(8,2) CHECK (salary > 0),
    commission_pct DECIMAL(4,2),
    manager_id INT NULL,
    department_id INT FOREIGN KEY REFERENCES departments(department_id)
);
GO

-- Self-reference for employees
ALTER TABLE employees
ADD CONSTRAINT emp_manager_fk FOREIGN KEY (manager_id) REFERENCES employees(employee_id);
GO

-- Departments manager FK
ALTER TABLE departments
ADD CONSTRAINT dept_mgr_fk FOREIGN KEY (manager_id) REFERENCES employees(employee_id);
GO

-- Job History without invalid CHECK
CREATE TABLE job_history (
    employee_id INT NOT NULL FOREIGN KEY REFERENCES employees(employee_id),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    job_id VARCHAR(10) NOT NULL FOREIGN KEY REFERENCES jobs(job_id),
    department_id INT FOREIGN KEY REFERENCES departments(department_id),
    CONSTRAINT jhist_pk PRIMARY KEY (employee_id, start_date)
);
GO

CREATE TRIGGER trg_check_dates
ON job_history
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1 FROM inserted
        WHERE end_date <= start_date
    )
    BEGIN
        RAISERROR('end_date must be greater than start_date', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO




-- View
CREATE VIEW emp_details_view AS
SELECT
    e.employee_id,
    e.job_id,
    e.manager_id,
    e.department_id,
    d.location_id,
    l.country_id,
    e.first_name,
    e.last_name,
    e.salary,
    e.commission_pct,
    d.department_name,
    j.job_title,
    l.city,
    l.state_province,
    c.country_name,
    r.region_name
FROM
    employees e
    JOIN departments d ON e.department_id = d.department_id
    JOIN jobs j ON e.job_id = j.job_id
    JOIN locations l ON d.location_id = l.location_id
    JOIN countries c ON l.country_id = c.country_id
    JOIN regions r ON c.region_id = r.region_id;
GO
