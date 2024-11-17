--PL/SQL Program to Print Employees with Salary > 50,000
BEGIN
    FOR employee_record IN (
        SELECT emp_id, first_name, last_name, salary
        FROM employees
        WHERE salary > 50000
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Employee ID: ' || employee_record.emp_id ||
                             ', Name: ' || employee_record.first_name || ' ' || employee_record.last_name ||
                             ', Salary: ' || employee_record.salary);
    END LOOP;
END;
/
