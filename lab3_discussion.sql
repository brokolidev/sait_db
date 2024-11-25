/* *****************************************************************
** Author:  Hyunseung Choi
** Creation Date:  November 24, 2024
**
*******************************************************************/


DECLARE
    -- CONSTANTS
    CONST_PRESIDENT CONSTANT VARCHAR2(9) := 'PRESIDENT';
    CONST_EMP_DOWN_BY CONSTANT NUMBER(7,2) := 0.5;
    CONST_PRESIDENT_DOWN_BY CONSTANT NUMBER(7,2) := 0.25;
    CONST_MINIMUM_SALARY CONSTANT NUMBER(7,2) := 100;
    CONST_EMP_UP_BY CONSTANT NUMBER(7,2) := 0.1;
    CONST_EMP_COMM_MAX CONSTANT NUMBER(7,2) := 0.22;

    -- Variables
    var_average_salary NUMBER(7,2);
    var_president_salary NUMBER(7,2);
    var_emp_max_salary NUMBER(7,2);
    var_current_salary NUMBER(7,2);
    var_new_salary NUMBER(7,2);
    var_current_commission NUMBER(7,2);
    var_new_commission NUMBER(7,2);
    var_dept_min_commission Number(7,2);

    -- CURSOR
    CURSOR emp_cur IS
    SELECT EMP_EMPLOYEE.*, DEPT_MIN_COMMISSION.DEPT_MIN_COMM FROM EMP_EMPLOYEE
    LEFT JOIN (
    SELECT DEPTNO, MIN(COMMISSION) AS DEPT_MIN_COMM FROM EMP_EMPLOYEE
    WHERE COMMISSION IS NOT NULL AND COMMISSION <> 0
    GROUP BY DEPTNO) DEPT_MIN_COMMISSION ON DEPT_MIN_COMMISSION.DEPTNO = EMP_EMPLOYEE.DEPTNO
    FOR UPDATE;
BEGIN
    -- President Salary
    SELECT SALARY INTO var_president_salary FROM EMP_EMPLOYEE WHERE JOB=CONST_PRESIDENT;
    DBMS_OUTPUT.PUT_LINE('President salary: $' || var_president_salary);

    -- Average Salary
    SELECT AVG(SALARY) INTO var_average_salary FROM EMP_EMPLOYEE;
    DBMS_OUTPUT.PUT_LINE('Average salary: $' || var_average_salary);

    FOR emp IN emp_cur LOOP
        var_current_salary := emp.salary;
        var_new_salary := var_current_salary;
        var_current_commission := emp.commission;
        var_new_commission := emp.commission;
        var_emp_max_salary := var_president_salary - (var_president_salary * CONST_PRESIDENT_DOWN_BY);
        var_dept_min_commission := emp.DEPT_MIN_COMM;

        -- Rule1
        IF var_current_salary > var_president_salary THEN
            var_new_salary :=
                LEAST(var_emp_max_salary, (var_current_salary - (var_current_salary * CONST_EMP_DOWN_BY)));
        END IF;

        -- Rule2
        IF var_current_salary < CONST_MINIMUM_SALARY THEN
            var_new_salary := var_current_salary + (var_current_salary * CONST_EMP_UP_BY);
            IF var_new_salary > var_average_salary THEN
                var_new_salary = var_current_salary;
            END IF;
        END IF;

        -- Rule3
        IF var_current_commission > var_current_salary * CONST_EMP_COMM_MAX THEN
            var_new_commission = var_dept_min_commission;
        END IF;

        -- Update
        IF var_current_salary != var_new_salary OR
           var_current_commission != var_current_commission THEN
            UPDATE EMP_EMPLOYEE
            SET SALARY = var_new_salary,
                COMMISSION = var_new_commission
            WHERE EMPNO = emp.EMPNO;
        END IF;
    END LOOP;
    COMMIT;
END;


