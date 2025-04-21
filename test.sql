-- Create the employees table
CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id VARCHAR(10) UNIQUE NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    hire_date DATE default (current_date()),
    salary DECIMAL(10,2),
    department VARCHAR(50)
);

-- Create a trigger to automatically generate the employee_id with 'emp' prefix
DELIMITER //
CREATE TRIGGER before_insert_employees
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
    -- Format the ID with 'emp' prefix and padded zeros (4 digits total)
    SET NEW.employee_id = CONCAT('emp', LPAD(NEW.id, 4, '0'));
    
    -- Set hire_date to current date if not provided
    IF NEW.hire_date IS NULL THEN
        SET NEW.hire_date = CURDATE();
    END IF;
END//
DELIMITER ;

