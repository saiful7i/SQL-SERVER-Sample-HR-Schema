/*
procedure and statement trigger to allow dmls during business hours:
*/

USE HR;
GO

-- Drop triggers if they exist
IF OBJECT_ID('secure_employees', 'TR') IS NOT NULL
    DROP TRIGGER secure_employees;
GO

IF OBJECT_ID('update_job_history', 'TR') IS NOT NULL
    DROP TRIGGER update_job_history;
GO

-- Drop procedures if they exist
IF OBJECT_ID('secure_dml', 'P') IS NOT NULL
    DROP PROCEDURE secure_dml;
GO

IF OBJECT_ID('add_job_history', 'P') IS NOT NULL
    DROP PROCEDURE add_job_history;
GO

-- secure_dml procedure
CREATE PROCEDURE secure_dml
AS
BEGIN
  IF FORMAT(GETDATE(), 'HH:mm') NOT BETWEEN '08:00' AND '18:00'
        OR FORMAT(GETDATE(), 'ddd') IN ('Sat', 'Sun') 
  BEGIN
    THROW 50000, 'You may only make changes during normal office hours', 1;
  END
END;
GO

-- INSTEAD OF trigger on employees
CREATE TRIGGER secure_employees
ON employees
INSTEAD OF INSERT, UPDATE, DELETE
AS
BEGIN
  EXEC secure_dml;

  IF EXISTS (SELECT 1 FROM inserted) AND NOT EXISTS (SELECT 1 FROM deleted)
  BEGIN
    INSERT INTO employees 
    SELECT * FROM inserted;
  END
  ELSE IF EXISTS (SELECT 1 FROM inserted) AND EXISTS (SELECT 1 FROM deleted)
  BEGIN
    UPDATE e
    SET 
        e.first_name = i.first_name,
        e.last_name = i.last_name,
        e.email = i.email,
        e.phone_number = i.phone_number,
        e.hire_date = i.hire_date,
        e.job_id = i.job_id,
        e.salary = i.salary,
        e.commission_pct = i.commission_pct,
        e.manager_id = i.manager_id,
        e.department_id = i.department_id
    FROM employees e
    INNER JOIN inserted i ON e.employee_id = i.employee_id;
  END
  ELSE IF NOT EXISTS (SELECT 1 FROM inserted) AND EXISTS (SELECT 1 FROM deleted)
  BEGIN
    DELETE e
    FROM employees e
    INNER JOIN deleted d ON e.employee_id = d.employee_id;
  END
END;
GO

-- (Optional) Disable the trigger initially
DISABLE TRIGGER secure_employees ON employees;
GO

-- Procedure to insert into job_history
CREATE PROCEDURE add_job_history
  @p_emp_id          INT,
  @p_start_date      DATE,
  @p_end_date        DATE,
  @p_job_id          VARCHAR(10),
  @p_department_id   INT
AS
BEGIN
  INSERT INTO job_history (employee_id, start_date, end_date, job_id, department_id)
  VALUES(@p_emp_id, @p_start_date, @p_end_date, @p_job_id, @p_department_id);
END;
GO

-- AFTER UPDATE trigger to call job_history procedure
CREATE TRIGGER update_job_history
ON employees
AFTER UPDATE
AS
BEGIN
  IF UPDATE(job_id) OR UPDATE(department_id)
  BEGIN
    INSERT INTO job_history (employee_id, start_date, end_date, job_id, department_id)
    SELECT 
      d.employee_id, 
      d.hire_date, 
      GETDATE(),
      d.job_id, 
      d.department_id
    FROM deleted d
    JOIN inserted i ON d.employee_id = i.employee_id;
  END
END;
GO
