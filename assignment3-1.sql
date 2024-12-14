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
    v_transaction_no     NUMBER;
    v_transaction_date   DATE;
    v_description        VARCHAR2(100);

    -- Variables to store transaction detail data
    v_account_no         NUMBER;
    v_transaction_type   CHAR(1);
    v_transaction_amount NUMBER;

    -- Variables for account update
    v_default_trans_type CHAR(1);
    v_add_to_balance     NUMBER;

BEGIN
    -- Open the main cursor to loop through transaction headers
    OPEN trans_cursor;

    LOOP
        FETCH trans_cursor INTO v_transaction_no, v_transaction_date, v_description;
        EXIT WHEN trans_cursor%NOTFOUND;

        -- Insert transaction header into TRANSACTION_HISTORY
        INSERT INTO transaction_history (transaction_no, transaction_date, description)
        VALUES (v_transaction_no, v_transaction_date, v_description);

        -- Fetch and process transaction details for the current transaction_no
        OPEN detail_cursor(v_transaction_no);

        LOOP
            FETCH detail_cursor INTO v_account_no, v_transaction_type, v_transaction_amount;
            EXIT WHEN detail_cursor%NOTFOUND;

            -- Insert transaction details into TRANSACTION_DETAIL
            INSERT INTO transaction_detail (account_no, transaction_no, transaction_type, transaction_amount)
            VALUES (v_account_no, v_transaction_no, v_transaction_type, v_transaction_amount);

            -- get the default transaction type
            SELECT default_trans_type
            INTO v_default_trans_type
            FROM account ac
                     LEFT JOIN account_type act ON (ac.account_type_code = act.account_type_code)
            WHERE ac.account_no = v_account_no;

            -- if the transaction types match, then add. If not, subtract
            IF v_default_trans_type != v_transaction_type THEN
                v_add_to_balance := v_transaction_amount * -1;
            END IF;

            UPdATE account
            SET account_balance = account_balance + v_add_to_balance
            WHERE account_no = v_account_no;

        END LOOP;

        -- Close the detail cursor after processing all details for the transaction_no
        CLOSE detail_cursor;

        -- Remove the processed transaction from NEW_TRANSACTIONS
        DELETE
        FROM new_transactions
        WHERE transaction_no = v_transaction_no;
    END LOOP;

    -- Close the main cursor after processing all transaction headers
    CLOSE trans_cursor;

    -- Commit the transaction
    COMMIT;
END;
/
