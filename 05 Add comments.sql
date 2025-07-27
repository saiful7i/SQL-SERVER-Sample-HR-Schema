/*
Add comments to tables and columns
*/
-- First drop existing properties, then add new ones
-- Regions table
EXEC sp_dropextendedproperty 
    @name = N'MS_Description', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'regions';
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = 'Regions table that contains region numbers and names. Contains 4 rows; references with the Countries table.',
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'regions';

EXEC sp_dropextendedproperty 
    @name = N'MS_Description', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'regions',
    @level2type = N'COLUMN', @level2name = 'region_id';
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = 'Primary key of regions table.',
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'regions',
    @level2type = N'COLUMN', @level2name = 'region_id';

EXEC sp_dropextendedproperty 
    @name = N'MS_Description', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'regions',
    @level2type = N'COLUMN', @level2name = 'region_name';
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = 'Names of regions. Locations are in the countries of these regions.',
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'regions',
    @level2type = N'COLUMN', @level2name = 'region_name';

-- Locations table
EXEC sp_dropextendedproperty 
    @name = N'MS_Description', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'locations';
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = 'Locations table that contains specific address of a specific office, warehouse, and/or production site of a company. Does not store addresses / locations of customers. Contains 23 rows; references with the departments and countries tables.',
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'locations';

EXEC sp_dropextendedproperty 
    @name = N'MS_Description', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'locations',
    @level2type = N'COLUMN', @level2name = 'location_id';
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = 'Primary key of locations table',
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'locations',
    @level2type = N'COLUMN', @level2name = 'location_id';

EXEC sp_dropextendedproperty 
    @name = N'MS_Description', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'locations',
    @level2type = N'COLUMN', @level2name = 'street_address';
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = 'Street address of an office, warehouse, or production site of a company. Contains building number and street name',
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'locations',
    @level2type = N'COLUMN', @level2name = 'street_address';

EXEC sp_dropextendedproperty 
    @name = N'MS_Description', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'locations',
    @level2type = N'COLUMN', @level2name = 'postal_code';
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = 'Postal code of the location of an office, warehouse, or production site of a company.',
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'locations',
    @level2type = N'COLUMN', @level2name = 'postal_code';

EXEC sp_dropextendedproperty 
    @name = N'MS_Description', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'locations',
    @level2type = N'COLUMN', @level2name = 'city';
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = 'A not null column that shows city where an office, warehouse, or production site of a company is located.',
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'locations',
    @level2type = N'COLUMN', @level2name = 'city';

EXEC sp_dropextendedproperty 
    @name = N'MS_Description', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'locations',
    @level2type = N'COLUMN', @level2name = 'state_province';
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = 'State or Province where an office, warehouse, or production site of a company is located.',
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'locations',
    @level2type = N'COLUMN', @level2name = 'state_province';

EXEC sp_dropextendedproperty 
    @name = N'MS_Description', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'locations',
    @level2type = N'COLUMN', @level2name = 'country_id';
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = 'Country where an office, warehouse, or production site of a company is located. Foreign key to country_id column of the countries table.',
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'locations',
    @level2type = N'COLUMN', @level2name = 'country_id';

-- Departments table
EXEC sp_dropextendedproperty 
    @name = N'MS_Description', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'departments';
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = 'Departments table that shows details of departments where employees work. Contains 27 rows; references with locations, employees, and job_history tables.',
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'departments';

EXEC sp_dropextendedproperty 
    @name = N'MS_Description', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'departments',
    @level2type = N'COLUMN', @level2name = 'department_id';
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = 'Primary key column of departments table.',
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'departments',
    @level2type = N'COLUMN', @level2name = 'department_id';

EXEC sp_dropextendedproperty 
    @name = N'MS_Description', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'departments',
    @level2type = N'COLUMN', @level2name = 'department_name';
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = 'A not null column that shows name of a department. Administration, Marketing, Purchasing, Human Resources, Shipping, IT, Executive, Public Relations, Sales, Finance, and Accounting.',
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'departments',
    @level2type = N'COLUMN', @level2name = 'department_name';

EXEC sp_dropextendedproperty 
    @name = N'MS_Description', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'departments',
    @level2type = N'COLUMN', @level2name = 'manager_id';
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = 'Manager_id of a department. Foreign key to employee_id column of employees table. The manager_id column of the employee table references this column.',
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'departments',
    @level2type = N'COLUMN', @level2name = 'manager_id';

EXEC sp_dropextendedproperty 
    @name = N'MS_Description', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'departments',
    @level2type = N'COLUMN', @level2name = 'location_id';
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = 'Location id where a department is located. Foreign key to location_id column of locations table.',
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'departments',
    @level2type = N'COLUMN', @level2name = 'location_id';

-- Job history table
EXEC sp_dropextendedproperty 
    @name = N'MS_Description', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'job_history';
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = 'Table that stores job history of the employees. If an employee changes departments within the job or changes jobs within the department, new rows get inserted into this table with old job information of the employee. Contains a complex primary key: employee_id+start_date. Contains 25 rows. References with jobs, employees, and departments tables.',
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'job_history';

EXEC sp_dropextendedproperty 
    @name = N'MS_Description', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'job_history',
    @level2type = N'COLUMN', @level2name = 'employee_id';
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = 'A not null column in the complex primary key employee_id+start_date. Foreign key to employee_id column of the employee table',
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'job_history',
    @level2type = N'COLUMN', @level2name = 'employee_id';

EXEC sp_dropextendedproperty 
    @name = N'MS_Description', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'job_history',
    @level2type = N'COLUMN', @level2name = 'start_date';
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = 'A not null column in the complex primary key employee_id+start_date. Must be less than the end_date of the job_history table.',
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'job_history',
    @level2type = N'COLUMN', @level2name = 'start_date';

EXEC sp_dropextendedproperty 
    @name = N'MS_Description', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'job_history',
    @level2type = N'COLUMN', @level2name = 'end_date';
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = 'Last day of the employee in this job role. A not null column. Must be greater than the start_date of the job_history table.',
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'job_history',
    @level2type = N'COLUMN', @level2name = 'end_date';

EXEC sp_dropextendedproperty 
    @name = N'MS_Description', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'job_history',
    @level2type = N'COLUMN', @level2name = 'job_id';
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = 'Job role in which the employee worked in the past; foreign key to job_id column in the jobs table. A not null column.',
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'job_history',
    @level2type = N'COLUMN', @level2name = 'job_id';

EXEC sp_dropextendedproperty 
    @name = N'MS_Description', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'job_history',
    @level2type = N'COLUMN', @level2name = 'department_id';
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = 'Department id in which the employee worked in the past; foreign key to deparment_id column in the departments table',
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'job_history',
    @level2type = N'COLUMN', @level2name = 'department_id';

-- Countries table
EXEC sp_dropextendedproperty 
    @name = N'MS_Description', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'countries';
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = 'country table. Contains 25 rows. References with locations table.',
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'countries';

EXEC sp_dropextendedproperty 
    @name = N'MS_Description', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'countries',
    @level2type = N'COLUMN', @level2name = 'country_id';
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = 'Primary key of countries table.',
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'countries',
    @level2type = N'COLUMN', @level2name = 'country_id';

EXEC sp_dropextendedproperty 
    @name = N'MS_Description', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'countries',
    @level2type = N'COLUMN', @level2name = 'country_name';
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = 'Country name',
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'countries',
    @level2type = N'COLUMN', @level2name = 'country_name';

EXEC sp_dropextendedproperty 
    @name = N'MS_Description', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'countries',
    @level2type = N'COLUMN', @level2name = 'region_id';
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = 'Region ID for the country. Foreign key to region_id column in the departments table.',
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'countries',
    @level2type = N'COLUMN', @level2name = 'region_id';

-- Jobs table
EXEC sp_dropextendedproperty 
    @name = N'MS_Description', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'jobs';
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = 'jobs table with job titles and salary ranges. Contains 19 rows. References with employees and job_history table.',
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'jobs';

EXEC sp_dropextendedproperty 
    @name = N'MS_Description', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'jobs',
    @level2type = N'COLUMN', @level2name = 'job_id';
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = 'Primary key of jobs table.',
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'jobs',
    @level2type = N'COLUMN', @level2name = 'job_id';

EXEC sp_dropextendedproperty 
    @name = N'MS_Description', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'jobs',
    @level2type = N'COLUMN', @level2name = 'job_title';
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = 'A not null column that shows job title, e.g. AD_VP, FI_ACCOUNTANT',
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'jobs',
    @level2type = N'COLUMN', @level2name = 'job_title';

EXEC sp_dropextendedproperty 
    @name = N'MS_Description', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'jobs',
    @level2type = N'COLUMN', @level2name = 'min_salary';
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = 'Minimum salary for a job title.',
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'jobs',
    @level2type = N'COLUMN', @level2name = 'min_salary';

EXEC sp_dropextendedproperty 
    @name = N'MS_Description', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'jobs',
    @level2type = N'COLUMN', @level2name = 'max_salary';
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = 'Maximum salary for a job title',
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'jobs',
    @level2type = N'COLUMN', @level2name = 'max_salary';

-- Employees table
EXEC sp_dropextendedproperty 
    @name = N'MS_Description', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'employees';
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = 'employees table. Contains 107 rows. References with departments, jobs, job_history tables. Contains a self reference.',
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'employees';

EXEC sp_dropextendedproperty 
    @name = N'MS_Description', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'employees',
    @level2type = N'COLUMN', @level2name = 'employee_id';
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = 'Primary key of employees table.',
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'employees',
    @level2type = N'COLUMN', @level2name = 'employee_id';

EXEC sp_dropextendedproperty 
    @name = N'MS_Description', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'employees',
    @level2type = N'COLUMN', @level2name = 'first_name';
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = 'First name of the employee. A not null column.',
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'employees',
    @level2type = N'COLUMN', @level2name = 'first_name';

EXEC sp_dropextendedproperty 
    @name = N'MS_Description', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'employees',
    @level2type = N'COLUMN', @level2name = 'last_name';
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = 'Last name of the employee. A not null column.',
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'employees',
    @level2type = N'COLUMN', @level2name = 'last_name';

EXEC sp_dropextendedproperty 
    @name = N'MS_Description', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'employees',
    @level2type = N'COLUMN', @level2name = 'email';
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = 'Email id of the employee',
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'employees',
    @level2type = N'COLUMN', @level2name = 'email';

EXEC sp_dropextendedproperty 
    @name = N'MS_Description', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'employees',
    @level2type = N'COLUMN', @level2name = 'phone_number';
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = 'Phone number of the employee; includes country code and area code',
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'employees',
    @level2type = N'COLUMN', @level2name = 'phone_number';

EXEC sp_dropextendedproperty 
    @name = N'MS_Description', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'employees',
    @level2type = N'COLUMN', @level2name = 'hire_date';
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = 'Date when the employee started on this job. A not null column.',
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'employees',
    @level2type = N'COLUMN', @level2name = 'hire_date';

EXEC sp_dropextendedproperty 
    @name = N'MS_Description', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'employees',
    @level2type = N'COLUMN', @level2name = 'job_id';
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = 'Current job of the employee; foreign key to job_id column of the jobs table. A not null column.',
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'employees',
    @level2type = N'COLUMN', @level2name = 'job_id';

EXEC sp_dropextendedproperty 
    @name = N'MS_Description', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'employees',
    @level2type = N'COLUMN', @level2name = 'salary';
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = 'Monthly salary of the employee. Must be greater than zero',
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'employees',
    @level2type = N'COLUMN', @level2name = 'salary';

EXEC sp_dropextendedproperty 
    @name = N'MS_Description', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'employees',
    @level2type = N'COLUMN', @level2name = 'commission_pct';
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = 'Commission percentage of the employee; Only employees in sales department elgible for commission percentage',
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'employees',
    @level2type = N'COLUMN', @level2name = 'commission_pct';

EXEC sp_dropextendedproperty 
    @name = N'MS_Description', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'employees',
    @level2type = N'COLUMN', @level2name = 'manager_id';
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = 'Manager id of the employee; has same domain as manager_id in departments table. Foreign key to employee_id column of employees table.',
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'employees',
    @level2type = N'COLUMN', @level2name = 'manager_id';

EXEC sp_dropextendedproperty 
    @name = N'MS_Description', 
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'employees',
    @level2type = N'COLUMN', @level2name = 'department_id';
EXEC sp_addextendedproperty 
    @name = N'MS_Description', 
    @value = 'Department id where employee works; foreign key to department_id column of the departments table',
    @level0type = N'SCHEMA', @level0name = 'dbo', 
    @level1type = N'TABLE', @level1name = 'employees',
    @level2type = N'COLUMN', @level2name = 'department_id';