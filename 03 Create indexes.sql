-- Use the HR database
USE HR;
GO

-- Drop indexes if they exist
IF EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'emp_department_ix') DROP INDEX emp_department_ix ON employees;
IF EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'emp_job_ix') DROP INDEX emp_job_ix ON employees;
IF EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'emp_manager_ix') DROP INDEX emp_manager_ix ON employees;
IF EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'emp_name_ix') DROP INDEX emp_name_ix ON employees;
IF EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'dept_location_ix') DROP INDEX dept_location_ix ON departments;
IF EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'jhist_job_ix') DROP INDEX jhist_job_ix ON job_history;
IF EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'jhist_employee_ix') DROP INDEX jhist_employee_ix ON job_history;
IF EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'jhist_department_ix') DROP INDEX jhist_department_ix ON job_history;
IF EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'loc_city_ix') DROP INDEX loc_city_ix ON locations;
IF EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'loc_state_province_ix') DROP INDEX loc_state_province_ix ON locations;
IF EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'loc_country_ix') DROP INDEX loc_country_ix ON locations;
GO

-- Create indexes
CREATE INDEX emp_department_ix ON employees (department_id);
CREATE INDEX emp_job_ix ON employees (job_id);
CREATE INDEX emp_manager_ix ON employees (manager_id);
CREATE INDEX emp_name_ix ON employees (last_name, first_name);
CREATE INDEX dept_location_ix ON departments (location_id);
CREATE INDEX jhist_job_ix ON job_history (job_id);
CREATE INDEX jhist_employee_ix ON job_history (employee_id);
CREATE INDEX jhist_department_ix ON job_history (department_id);
CREATE INDEX loc_city_ix ON locations (city);
CREATE INDEX loc_state_province_ix ON locations (state_province);
CREATE INDEX loc_country_ix ON locations (country_id);
GO
