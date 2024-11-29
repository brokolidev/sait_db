DECLARE
    -- Cursor to fetch transaction data grouped by transaction_no
    CURSOR trans_cursor IS
        SELECT DISTINCT transaction_no, transaction_date, description
        FROM new_transactions;

    -- Cursor to fetch individual transaction details for a transaction_no
    CURSOR detail_cursor (trans_no NUMBER) IS
        SELECT account_no, transaction_type, transaction_amount
        FROM new_transactions
        WHERE transaction_no = trans_no;

    -- Variables to store transaction header data
    v_transaction_no   NUMBER;
    v_transaction_date DATE;
    v_description      VARCHAR2(100);

    -- Variables to store transaction detail data
    v_account_no       NUMBER;
    v_transaction_type CHAR(1);
    v_transaction_amount NUMBER;

    -- Variables for account update
    v_default_trans_type CHAR(1);
    v_current_balance   NUMBER;

BEGIN
    -- Process each transaction from NEW_TRANSACTIONS
    FOR trans_rec IN trans_cursor LOOP
        v_transaction_no := trans_rec.transaction_no;
        v_transaction_date := trans_rec.transaction_date;
        v_description := trans_rec.description;

        -- Insert transaction header into TRANSACTION_HISTORY
        INSERT INTO transaction_history (transaction_no, transaction_date, description)
        VALUES (v_transaction_no, v_transaction_date, v_description);

        -- Process each transaction detail for the current transaction_no
        FOR detail_rec IN detail_cursor(v_transaction_no) LOOP
            v_account_no := detail_rec.account_no;
            v_transaction_type := detail_rec.transaction_type;
            v_transaction_amount := detail_rec.transaction_amount;

            -- Fetch account's default transaction type and current balance
            SELECT default_trans_type, account_balance
            INTO v_default_trans_type, v_current_balance
            FROM account
            JOIN account_type ON account.account_type_code = account_type.account_type_code
            WHERE account.account_no = v_account_no;

            -- Update account balance based on transaction type and default type
            IF v_transaction_type = v_default_trans_type THEN
                v_current_balance := v_current_balance + v_transaction_amount; -- Add for matching type
            ELSE
                v_current_balance := v_current_balance - v_transaction_amount; -- Subtract otherwise
            END IF;

            -- Update account balance
            UPDATE account
            SET account_balance = v_current_balance
            WHERE account_no = v_account_no;

            -- Insert transaction detail into TRANSACTION_DETAIL
            INSERT INTO transaction_detail (account_no, transaction_no, transaction_type, transaction_amount)
            VALUES (v_account_no, v_transaction_no, v_transaction_type, v_transaction_amount);
        END LOOP;

        -- Remove processed transactions from NEW_TRANSACTIONS
        DELETE FROM new_transactions
        WHERE transaction_no = v_transaction_no;
    END LOOP;

    -- Commit all changes
    COMMIT;
END;
/
