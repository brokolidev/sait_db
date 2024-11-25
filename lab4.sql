/* *****************************************************************
** Author:  Hyunseung Choi
** Creation Date:  November 24, 2024
**/

SET SERVEROUTPUT ON;

select EVENT_TYPE,
       TO_CHAR(PERFORMANCE_DATE, 'D') AS WEEKDAY,
       START_TIME, STOP_TIME,
       func_performance_hours(START_TIME, STOP_TIME),
       func_hourly_rate(EVENT_TYPE)
    FROM ATA_CONTRACT
    LEFT JOIN ATA_PERFORMANCE ON ATA_CONTRACT.CONTRACT_NUMBER = ATA_PERFORMANCE.CONTRACT_NUMBER;

CREATE OR REPLACE FUNCTION func_performance_hours(
    start_time IN DATE,
    end_time IN DATE
) RETURN NUMBER IS
BEGIN
    RETURN (end_time - start_time) * 24;
END;
/

CREATE OR REPLACE FUNCTION func_hourly_rate(
    event_type IN VARCHAR2
) RETURN NUMBER IS
BEGIN
    CASE UPPER(event_type)
        WHEN 'CHILDRENS PARTY' THEN RETURN 335.00;
        WHEN 'CONCERT' THEN RETURN 1000.00;
        WHEN 'DIVORCE PARTY' THEN RETURN 170.00;
        WHEN 'WEDDING' THEN RETURN 300.00;
        ELSE RETURN 100.00;
    END CASE;
END;
/

CREATE OR REPLACE FUNCTION func_total_fee(
    hours IN NUMBER,
    rate IN NUMBER
) RETURN NUMBER IS
BEGIN
    RETURN hours * rate;
END;
/

CREATE OR REPLACE FUNCTION func_admin_fee(
    weekday IN NUMBER
) RETURN NUMBER IS
    total_fee NUMBER;
BEGIN
    total_fee := 0.00;

    IF weekday = 2 OR weekday = 6 THEN
        total_fee := 100.00;
    END IF;

    RETURN total_fee;
END;
/

CREATE OR REPLACE PROCEDURE proc_calculate_fee(
    contract_id IN NUMBER
) IS
    start_time DATE;
    stop_time DATE;
    event_type VARCHAR2(50);
    hours NUMBER;
    rate NUMBER;
    base_fee NUMBER;
    total_fee NUMBER;
    admin_fee NUMBER;
    weekday NUMBER;
BEGIN

    -- Reset FEE field to 0 for the specified contract_id
    UPDATE ATA_CONTRACT
    SET FEE = 0
    WHERE CONTRACT_NUMBER = contract_id;

    FOR record IN (
        SELECT EVENT_TYPE,
               TO_CHAR(PERFORMANCE_DATE, 'D') AS WEEKDAY,
               START_TIME, STOP_TIME
        FROM ATA_CONTRACT
        LEFT JOIN ATA_PERFORMANCE ON ATA_CONTRACT.CONTRACT_NUMBER = ATA_PERFORMANCE.CONTRACT_NUMBER
        WHERE ATA_CONTRACT.CONTRACT_NUMBER = contract_id
    ) LOOP

    -- Calculate components
    hours := func_performance_hours(record.START_TIME, record.STOP_TIME);
    rate := func_hourly_rate(record.EVENT_TYPE);
    base_fee := func_total_fee(hours, rate);
    admin_fee := func_admin_fee(record.WEEKDAY);
    total_fee := base_fee + admin_fee;

    -- Update final fee in the ATA_CONTRACT table
    UPDATE ATA_CONTRACT
    SET FEE = FEE + total_fee
    WHERE CONTRACT_NUMBER = contract_id;

    DBMS_OUTPUT.PUT_LINE('Total Fee of ' || contract_id || ' : ' || total_fee);

    END LOOP;

    COMMIT;
EXCEPTION
   WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No data found for contract: ' || contract_id);
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Too many rows returned for contract: ' || contract_id);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error processing contract ID: ' || contract_id || ' Error: ' || SQLERRM);
        RAISE;
END;
/

DECLARE
    CURSOR contract_cursor IS
        SELECT CONTRACT_NUMBER FROM ATA_CONTRACT;
BEGIN
    FOR contract_rec IN contract_cursor LOOP
        BEGIN
            DBMS_OUTPUT.PUT_LINE('Processing contract number: ' || contract_rec.CONTRACT_NUMBER);
            proc_calculate_fee(contract_rec.CONTRACT_NUMBER);
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                DBMS_OUTPUT.PUT_LINE('No data found for contract: ' || contract_rec.CONTRACT_NUMBER);
            WHEN TOO_MANY_ROWS THEN
                DBMS_OUTPUT.PUT_LINE('Too many rows returned for contract: ' || contract_rec.CONTRACT_NUMBER);
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Error processing contract ID: ' || contract_rec.CONTRACT_NUMBER || ' Error: ' || SQLERRM);
        END;
    END LOOP;
END;
/

select * from ATA_CONTRACT;