/*
Add comments to tables and columns
*/
-- First drop existing properties, then add new ones
-- Regions table

BEGIN TRY
    EXEC sp_dropextendedproperty 
        @name = N'MS_Description',
        @level0type = N'SCHEMA', @level0name = N'dbo',
        @level1type = N'TABLE', @level1name = N'regions'; 
END TRY
BEGIN CATCH
END CATCH;

EXEC sp_addextendedproperty 
    @name = N'MS_Description',
    @value = N'Regions table that contains region numbers and names. Contains 4 rows; references with the Countries table.',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'regions';

BEGIN TRY
    EXEC sp_dropextendedproperty 
        @name = N'MS_Description',
        @level0type = N'SCHEMA', @level0name = N'dbo',
        @level1type = N'TABLE', @level1name = N'regions',
        @level2type = N'COLUMN', @level2name = N'region_id'; 
END TRY
BEGIN CATCH
END CATCH;

EXEC sp_addextendedproperty 
    @name = N'MS_Description',
    @value = N'Primary key of regions table.',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'regions',
    @level2type = N'COLUMN', @level2name = N'region_id';

BEGIN TRY
    EXEC sp_dropextendedproperty 
        @name = N'MS_Description',
        @level0type = N'SCHEMA', @level0name = N'dbo',
        @level1type = N'TABLE', @level1name = N'regions',
        @level2type = N'COLUMN', @level2name = N'region_name'; 
END TRY
BEGIN CATCH
END CATCH;

EXEC sp_addextendedproperty 
    @name = N'MS_Description',
    @value = N'Names of regions. Locations are in the countries of these regions.',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'regions',
    @level2type = N'COLUMN', @level2name = N'region_name';

BEGIN TRY
    EXEC sp_dropextendedproperty 
        @name = N'MS_Description',
        @level0type = N'SCHEMA', @level0name = N'dbo',
        @level1type = N'TABLE', @level1name = N'locations'; 
END TRY
BEGIN CATCH
END CATCH;

EXEC sp_addextendedproperty 
    @name = N'MS_Description',
    @value = N'Locations table that contains specific address of a specific office, warehouse, and/or production site of a company. Does not store addresses / locations of customers. Contains 23 rows; references with the departments and countries tables.',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'locations';

BEGIN TRY
    EXEC sp_dropextendedproperty 
        @name = N'MS_Description',
        @level0type = N'SCHEMA', @level0name = N'dbo',
        @level1type = N'TABLE', @level1name = N'locations',
        @level2type = N'COLUMN', @level2name = N'location_id'; 
END TRY
BEGIN CATCH
END CATCH;

EXEC sp_addextendedproperty 
    @name = N'MS_Description',
    @value = N'Primary key of locations table',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'locations',
    @level2type = N'COLUMN', @level2name = N'location_id';

BEGIN TRY
    EXEC sp_dropextendedproperty 
        @name = N'MS_Description',
        @level0type = N'SCHEMA', @level0name = N'dbo',
        @level1type = N'TABLE', @level1name = N'locations',
        @level2type = N'COLUMN', @level2name = N'street_address'; 
END TRY
BEGIN CATCH
END CATCH;

EXEC sp_addextendedproperty 
    @name = N'MS_Description',
    @value = N'Street address of an office, warehouse, or production site of a company. Contains building number and street name',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'locations',
    @level2type = N'COLUMN', @level2name = N'street_address';

BEGIN TRY
    EXEC sp_dropextendedproperty 
        @name = N'MS_Description',
        @level0type = N'SCHEMA', @level0name = N'dbo',
        @level1type = N'TABLE', @level1name = N'locations',
        @level2type = N'COLUMN', @level2name = N'postal_code'; 
END TRY
BEGIN CATCH
END CATCH;

EXEC sp_addextendedproperty 
    @name = N'MS_Description',
    @value = N'Postal code of the location of an office, warehouse, or production site of a company.',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'locations',
    @level2type = N'COLUMN', @level2name = N'postal_code';

BEGIN TRY
    EXEC sp_dropextendedproperty 
        @name = N'MS_Description',
        @level0type = N'SCHEMA', @level0name = N'dbo',
        @level1type = N'TABLE', @level1name = N'locations',
        @level2type = N'COLUMN', @level2name = N'city'; 
END TRY
BEGIN CATCH
END CATCH;

EXEC sp_addextendedproperty 
    @name = N'MS_Description',
    @value = N'A not null column that shows city where an office, warehouse, or production site of a company is located.',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'locations',
    @level2type = N'COLUMN', @level2name = N'city';

BEGIN TRY
    EXEC sp_dropextendedproperty 
        @name = N'MS_Description',
        @level0type = N'SCHEMA', @level0name = N'dbo',
        @level1type = N'TABLE', @level1name = N'locations',
        @level2type = N'COLUMN', @level2name = N'state_province'; 
END TRY
BEGIN CATCH
END CATCH;

EXEC sp_addextendedproperty 
    @name = N'MS_Description',
    @value = N'State or Province where an office, warehouse, or production site of a company is located.',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'locations',
    @level2type = N'COLUMN', @level2name = N'state_province';

BEGIN TRY
    EXEC sp_dropextendedproperty 
        @name = N'MS_Description',
        @level0type = N'SCHEMA', @level0name = N'dbo',
        @level1type = N'TABLE', @level1name = N'locations',
        @level2type = N'COLUMN', @level2name = N'country_id'; 
END TRY
BEGIN CATCH
END CATCH;

EXEC sp_addextendedproperty 
    @name = N'MS_Description',
    @value = N'Country where an office, warehouse, or production site of a company is located. Foreign key to country_id column of the countries table.',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'locations',
    @level2type = N'COLUMN', @level2name = N'country_id';

BEGIN TRY
    EXEC sp_dropextendedproperty 
        @name = N'MS_Description',
        @level0type = N'SCHEMA', @level0name = N'dbo',
        @level1type = N'TABLE', @level1name = N'departments'; 
END TRY
BEGIN CATCH
END CATCH;

EXEC sp_addextendedproperty 
    @name = N'MS_Description',
    @value = N'Departments table that shows details of departments where employees work. Contains 27 rows; references with locations, employees, and job_history tables.',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'departments';

BEGIN TRY
    EXEC sp_dropextendedproperty 
        @name = N'MS_Description',
        @level0type = N'SCHEMA', @level0name = N'dbo',
        @level1type = N'TABLE', @level1name = N'departments',
        @level2type = N'COLUMN', @level2name = N'department_id'; 
END TRY
BEGIN CATCH
END CATCH;

EXEC sp_addextendedproperty 
    @name = N'MS_Description',
    @value = N'Primary key column of departments table.',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'departments',
    @level2type = N'COLUMN', @level2name = N'department_id';

BEGIN TRY
    EXEC sp_dropextendedproperty 
        @name = N'MS_Description',
        @level0type = N'SCHEMA', @level0name = N'dbo',
        @level1type = N'TABLE', @level1name = N'departments',
        @level2type = N'COLUMN', @level2name = N'department_name'; 
END TRY
BEGIN CATCH
END CATCH;

EXEC sp_addextendedproperty 
    @name = N'MS_Description',
    @value = N'A not null column that shows name of a department. Administration, Marketing, Purchasing, Human Resources, Shipping, IT, Executive, Public Relations, Sales, Finance, and Accounting.',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'departments',
    @level2type = N'COLUMN', @level2name = N'department_name';

BEGIN TRY
    EXEC sp_dropextendedproperty 
        @name = N'MS_Description',
        @level0type = N'SCHEMA', @level0name = N'dbo',
        @level1type = N'TABLE', @level1name = N'departments',
        @level2type = N'COLUMN', @level2name = N'manager_id'; 
END TRY
BEGIN CATCH
END CATCH;

EXEC sp_addextendedproperty 
    @name = N'MS_Description',
    @value = N'Manager_id of a department. Foreign key to employee_id column of employees table. The manager_id column of the employee table references this column.',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'departments',
    @level2type = N'COLUMN', @level2name = N'manager_id';

BEGIN TRY
    EXEC sp_dropextendedproperty 
        @name = N'MS_Description',
        @level0type = N'SCHEMA', @level0name = N'dbo',
        @level1type = N'TABLE', @level1name = N'departments',
        @level2type = N'COLUMN', @level2name = N'location_id'; 
END TRY
BEGIN CATCH
END CATCH;

EXEC sp_addextendedproperty 
    @name = N'MS_Description',
    @value = N'Location id where a department is located. Foreign key to location_id column of locations table.',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'departments',
    @level2type = N'COLUMN', @level2name = N'location_id';

BEGIN TRY
    EXEC sp_dropextendedproperty 
        @name = N'MS_Description',
        @level0type = N'SCHEMA', @level0name = N'dbo',
        @level1type = N'TABLE', @level1name = N'job_history'; 
END TRY
BEGIN CATCH
END CATCH;

EXEC sp_addextendedproperty 
    @name = N'MS_Description',
    @value = N'Table that stores job history of the employees. If an employee changes departments within the job or changes jobs within the department, new rows get inserted into this table with old job information of the employee. Contains a complex primary key: employee_id+start_date. Contains 25 rows. References with jobs, employees, and departments tables.',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'job_history';

BEGIN TRY
    EXEC sp_dropextendedproperty 
        @name = N'MS_Description',
        @level0type = N'SCHEMA', @level0name = N'dbo',
        @level1type = N'TABLE', @level1name = N'job_history',
        @level2type = N'COLUMN', @level2name = N'employee_id'; 
END TRY
BEGIN CATCH
END CATCH;

EXEC sp_addextendedproperty 
    @name = N'MS_Description',
    @value = N'A not null column in the complex primary key employee_id+start_date. Foreign key to employee_id column of the employee table',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'job_history',
    @level2type = N'COLUMN', @level2name = N'employee_id';

BEGIN TRY
    EXEC sp_dropextendedproperty 
        @name = N'MS_Description',
        @level0type = N'SCHEMA', @level0name = N'dbo',
        @level1type = N'TABLE', @level1name = N'job_history',
        @level2type = N'COLUMN', @level2name = N'start_date'; 
END TRY
BEGIN CATCH
END CATCH;

EXEC sp_addextendedproperty 
    @name = N'MS_Description',
    @value = N'A not null column in the complex primary key employee_id+start_date. Must be less than the end_date of the job_history table.',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'job_history',
    @level2type = N'COLUMN', @level2name = N'start_date';

BEGIN TRY
    EXEC sp_dropextendedproperty 
        @name = N'MS_Description',
        @level0type = N'SCHEMA', @level0name = N'dbo',
        @level1type = N'TABLE', @level1name = N'job_history',
        @level2type = N'COLUMN', @level2name = N'end_date'; 
END TRY
BEGIN CATCH
END CATCH;

EXEC sp_addextendedproperty 
    @name = N'MS_Description',
    @value = N'Last day of the employee in this job role. A not null column. Must be greater than the start_date of the job_history table.',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'job_history',
    @level2type = N'COLUMN', @level2name = N'end_date';

BEGIN TRY
    EXEC sp_dropextendedproperty 
        @name = N'MS_Description',
        @level0type = N'SCHEMA', @level0name = N'dbo',
        @level1type = N'TABLE', @level1name = N'job_history',
        @level2type = N'COLUMN', @level2name = N'job_id'; 
END TRY
BEGIN CATCH
END CATCH;

EXEC sp_addextendedproperty 
    @name = N'MS_Description',
    @value = N'Job role in which the employee worked in the past; foreign key to job_id column in the jobs table. A not null column.',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'job_history',
    @level2type = N'COLUMN', @level2name = N'job_id';

BEGIN TRY
    EXEC sp_dropextendedproperty 
        @name = N'MS_Description',
        @level0type = N'SCHEMA', @level0name = N'dbo',
        @level1type = N'TABLE', @level1name = N'job_history',
        @level2type = N'COLUMN', @level2name = N'department_id'; 
END TRY
BEGIN CATCH
END CATCH;

EXEC sp_addextendedproperty 
    @name = N'MS_Description',
    @value = N'Department id in which the employee worked in the past; foreign key to deparment_id column in the departments table',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'job_history',
    @level2type = N'COLUMN', @level2name = N'department_id';

BEGIN TRY
    EXEC sp_dropextendedproperty 
        @name = N'MS_Description',
        @level0type = N'SCHEMA', @level0name = N'dbo',
        @level1type = N'TABLE', @level1name = N'countries'; 
END TRY
BEGIN CATCH
END CATCH;

EXEC sp_addextendedproperty 
    @name = N'MS_Description',
    @value = N'country table. Contains 25 rows. References with locations table.',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'countries';

BEGIN TRY
    EXEC sp_dropextendedproperty 
        @name = N'MS_Description',
        @level0type = N'SCHEMA', @level0name = N'dbo',
        @level1type = N'TABLE', @level1name = N'countries',
        @level2type = N'COLUMN', @level2name = N'country_id'; 
END TRY
BEGIN CATCH
END CATCH;

EXEC sp_addextendedproperty 
    @name = N'MS_Description',
    @value = N'Primary key of countries table.',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'countries',
    @level2type = N'COLUMN', @level2name = N'country_id';

BEGIN TRY
    EXEC sp_dropextendedproperty 
        @name = N'MS_Description',
        @level0type = N'SCHEMA', @level0name = N'dbo',
        @level1type = N'TABLE', @level1name = N'countries',
        @level2type = N'COLUMN', @level2name = N'country_name'; 
END TRY
BEGIN CATCH
END CATCH;

EXEC sp_addextendedproperty 
    @name = N'MS_Description',
    @value = N'Country name',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'countries',
    @level2type = N'COLUMN', @level2name = N'country_name';

BEGIN TRY
    EXEC sp_dropextendedproperty 
        @name = N'MS_Description',
        @level0type = N'SCHEMA', @level0name = N'dbo',
        @level1type = N'TABLE', @level1name = N'countries',
        @level2type = N'COLUMN', @level2name = N'region_id'; 
END TRY
BEGIN CATCH
END CATCH;

EXEC sp_addextendedproperty 
    @name = N'MS_Description',
    @value = N'Region ID for the country. Foreign key to region_id column in the departments table.',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'countries',
    @level2type = N'COLUMN', @level2name = N'region_id';

BEGIN TRY
    EXEC sp_dropextendedproperty 
        @name = N'MS_Description',
        @level0type = N'SCHEMA', @level0name = N'dbo',
        @level1type = N'TABLE', @level1name = N'jobs'; 
END TRY
BEGIN CATCH
END CATCH;

EXEC sp_addextendedproperty 
    @name = N'MS_Description',
    @value = N'jobs table with job titles and salary ranges. Contains 19 rows. References with employees and job_history table.',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'jobs';

BEGIN TRY
    EXEC sp_dropextendedproperty 
        @name = N'MS_Description',
        @level0type = N'SCHEMA', @level0name = N'dbo',
        @level1type = N'TABLE', @level1name = N'jobs',
        @level2type = N'COLUMN', @level2name = N'job_id'; 
END TRY
BEGIN CATCH
END CATCH;

EXEC sp_addextendedproperty 
    @name = N'MS_Description',
    @value = N'Primary key of jobs table.',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'jobs',
    @level2type = N'COLUMN', @level2name = N'job_id';

BEGIN TRY
    EXEC sp_dropextendedproperty 
        @name = N'MS_Description',
        @level0type = N'SCHEMA', @level0name = N'dbo',
        @level1type = N'TABLE', @level1name = N'jobs',
        @level2type = N'COLUMN', @level2name = N'job_title'; 
END TRY
BEGIN CATCH
END CATCH;

EXEC sp_addextendedproperty 
    @name = N'MS_Description',
    @value = N'A not null column that shows job title, e.g. AD_VP, FI_ACCOUNTANT',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'jobs',
    @level2type = N'COLUMN', @level2name = N'job_title';

BEGIN TRY
    EXEC sp_dropextendedproperty 
        @name = N'MS_Description',
        @level0type = N'SCHEMA', @level0name = N'dbo',
        @level1type = N'TABLE', @level1name = N'jobs',
        @level2type = N'COLUMN', @level2name = N'min_salary'; 
END TRY
BEGIN CATCH
END CATCH;

EXEC sp_addextendedproperty 
    @name = N'MS_Description',
    @value = N'Minimum salary for a job title.',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'jobs',
    @level2type = N'COLUMN', @level2name = N'min_salary';

BEGIN TRY
    EXEC sp_dropextendedproperty 
        @name = N'MS_Description',
        @level0type = N'SCHEMA', @level0name = N'dbo',
        @level1type = N'TABLE', @level1name = N'jobs',
        @level2type = N'COLUMN', @level2name = N'max_salary'; 
END TRY
BEGIN CATCH
END CATCH;

EXEC sp_addextendedproperty 
    @name = N'MS_Description',
    @value = N'Maximum salary for a job title',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'jobs',
    @level2type = N'COLUMN', @level2name = N'max_salary';

BEGIN TRY
    EXEC sp_dropextendedproperty 
        @name = N'MS_Description',
        @level0type = N'SCHEMA', @level0name = N'dbo',
        @level1type = N'TABLE', @level1name = N'employees'; 
END TRY
BEGIN CATCH
END CATCH;

EXEC sp_addextendedproperty 
    @name = N'MS_Description',
    @value = N'employees table. Contains 107 rows. References with departments, jobs, job_history tables. Contains a self reference.',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'employees';

BEGIN TRY
    EXEC sp_dropextendedproperty 
        @name = N'MS_Description',
        @level0type = N'SCHEMA', @level0name = N'dbo',
        @level1type = N'TABLE', @level1name = N'employees',
        @level2type = N'COLUMN', @level2name = N'employee_id'; 
END TRY
BEGIN CATCH
END CATCH;

EXEC sp_addextendedproperty 
    @name = N'MS_Description',
    @value = N'Primary key of employees table.',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'employees',
    @level2type = N'COLUMN', @level2name = N'employee_id';

BEGIN TRY
    EXEC sp_dropextendedproperty 
        @name = N'MS_Description',
        @level0type = N'SCHEMA', @level0name = N'dbo',
        @level1type = N'TABLE', @level1name = N'employees',
        @level2type = N'COLUMN', @level2name = N'first_name'; 
END TRY
BEGIN CATCH
END CATCH;

EXEC sp_addextendedproperty 
    @name = N'MS_Description',
    @value = N'First name of the employee. A not null column.',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'employees',
    @level2type = N'COLUMN', @level2name = N'first_name';

BEGIN TRY
    EXEC sp_dropextendedproperty 
        @name = N'MS_Description',
        @level0type = N'SCHEMA', @level0name = N'dbo',
        @level1type = N'TABLE', @level1name = N'employees',
        @level2type = N'COLUMN', @level2name = N'last_name'; 
END TRY
BEGIN CATCH
END CATCH;

EXEC sp_addextendedproperty 
    @name = N'MS_Description',
    @value = N'Last name of the employee. A not null column.',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'employees',
    @level2type = N'COLUMN', @level2name = N'last_name';

BEGIN TRY
    EXEC sp_dropextendedproperty 
        @name = N'MS_Description',
        @level0type = N'SCHEMA', @level0name = N'dbo',
        @level1type = N'TABLE', @level1name = N'employees',
        @level2type = N'COLUMN', @level2name = N'email'; 
END TRY
BEGIN CATCH
END CATCH;

EXEC sp_addextendedproperty 
    @name = N'MS_Description',
    @value = N'Email id of the employee',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'employees',
    @level2type = N'COLUMN', @level2name = N'email';

BEGIN TRY
    EXEC sp_dropextendedproperty 
        @name = N'MS_Description',
        @level0type = N'SCHEMA', @level0name = N'dbo',
        @level1type = N'TABLE', @level1name = N'employees',
        @level2type = N'COLUMN', @level2name = N'phone_number'; 
END TRY
BEGIN CATCH
END CATCH;

EXEC sp_addextendedproperty 
    @name = N'MS_Description',
    @value = N'Phone number of the employee; includes country code and area code',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'employees',
    @level2type = N'COLUMN', @level2name = N'phone_number';

BEGIN TRY
    EXEC sp_dropextendedproperty 
        @name = N'MS_Description',
        @level0type = N'SCHEMA', @level0name = N'dbo',
        @level1type = N'TABLE', @level1name = N'employees',
        @level2type = N'COLUMN', @level2name = N'hire_date'; 
END TRY
BEGIN CATCH
END CATCH;

EXEC sp_addextendedproperty 
    @name = N'MS_Description',
    @value = N'Date when the employee started on this job. A not null column.',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'employees',
    @level2type = N'COLUMN', @level2name = N'hire_date';

BEGIN TRY
    EXEC sp_dropextendedproperty 
        @name = N'MS_Description',
        @level0type = N'SCHEMA', @level0name = N'dbo',
        @level1type = N'TABLE', @level1name = N'employees',
        @level2type = N'COLUMN', @level2name = N'job_id'; 
END TRY
BEGIN CATCH
END CATCH;

EXEC sp_addextendedproperty 
    @name = N'MS_Description',
    @value = N'Current job of the employee; foreign key to job_id column of the jobs table. A not null column.',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'employees',
    @level2type = N'COLUMN', @level2name = N'job_id';

BEGIN TRY
    EXEC sp_dropextendedproperty 
        @name = N'MS_Description',
        @level0type = N'SCHEMA', @level0name = N'dbo',
        @level1type = N'TABLE', @level1name = N'employees',
        @level2type = N'COLUMN', @level2name = N'salary'; 
END TRY
BEGIN CATCH
END CATCH;

EXEC sp_addextendedproperty 
    @name = N'MS_Description',
    @value = N'Monthly salary of the employee. Must be greater than zero',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'employees',
    @level2type = N'COLUMN', @level2name = N'salary';

BEGIN TRY
    EXEC sp_dropextendedproperty 
        @name = N'MS_Description',
        @level0type = N'SCHEMA', @level0name = N'dbo',
        @level1type = N'TABLE', @level1name = N'employees',
        @level2type = N'COLUMN', @level2name = N'commission_pct'; 
END TRY
BEGIN CATCH
END CATCH;

EXEC sp_addextendedproperty 
    @name = N'MS_Description',
    @value = N'Commission percentage of the employee; Only employees in sales department elgible for commission percentage',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'employees',
    @level2type = N'COLUMN', @level2name = N'commission_pct';

BEGIN TRY
    EXEC sp_dropextendedproperty 
        @name = N'MS_Description',
        @level0type = N'SCHEMA', @level0name = N'dbo',
        @level1type = N'TABLE', @level1name = N'employees',
        @level2type = N'COLUMN', @level2name = N'manager_id'; 
END TRY
BEGIN CATCH
END CATCH;

EXEC sp_addextendedproperty 
    @name = N'MS_Description',
    @value = N'Manager id of the employee; has same domain as manager_id in departments table. Foreign key to employee_id column of employees table.',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'employees',
    @level2type = N'COLUMN', @level2name = N'manager_id';

BEGIN TRY
    EXEC sp_dropextendedproperty 
        @name = N'MS_Description',
        @level0type = N'SCHEMA', @level0name = N'dbo',
        @level1type = N'TABLE', @level1name = N'employees',
        @level2type = N'COLUMN', @level2name = N'department_id'; 
END TRY
BEGIN CATCH
END CATCH;

EXEC sp_addextendedproperty 
    @name = N'MS_Description',
    @value = N'Department id where employee works; foreign key to department_id column of the departments table',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'employees',
    @level2type = N'COLUMN', @level2name = N'department_id';
