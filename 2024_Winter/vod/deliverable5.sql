-- This script populates the Grand Hill Collage DB with test data
-- @C:/dev/sait/db/populate_GHCDB.sql

spool C:/dev/sait/db/deliverable5_output.txt
set echo on


-- Delete existing table data (children first!)
DELETE VOD_CUSTOMER;
COMMIT;



-- Insert data
INSERT INTO VOD_CUSTOMER (customer_id, first_name, last_name, email, credit_card_num, credit_card_type,
                          address_province, address_city, address_street, address_extra,
                          postal_code, is_email_valid, phone)
VALUES (1, 'John', 'Doe', 'johndoe@example.com', 1234567890123456,
        'MC', 'ON', 'Toronto', '123 Main St', 'Apt 101', 'M1M1M1', 1, '123.456.7920');

INSERT INTO VOD_CUSTOMER (customer_id, first_name, last_name, email, credit_card_num, credit_card_type,
                          address_province, address_city, address_street, address_extra,
                          postal_code, is_email_valid, phone)
VALUES (2, 'Jane', 'Smith', 'janesmith@example.com', 9876543210987654,
        'VS', 'BC', 'Vancouver', '456 Oak St', NULL, 'V6B2T4', 1, '234.567.8901');

INSERT INTO VOD_CUSTOMER (customer_id, first_name, last_name, email, credit_card_num, credit_card_type,
                          address_province, address_city, address_street, address_extra,
                          postal_code, is_email_valid, phone)
VALUES (3, 'Alice', 'Johnson', 'alicejohnson@example.com', 4567890123456789,
        'AX', 'AB', 'Calgary', '789 Elm St', NULL, 'T2P3J4', 1, '345.678.9012');

INSERT INTO VOD_CUSTOMER (customer_id, first_name, last_name, email, credit_card_num, credit_card_type,
                          address_province, address_city, address_street, address_extra,
                          postal_code, is_email_valid, phone)
VALUES (4, 'Bob', 'Williams', 'bobwilliams@example.com', 3210987654321098,
        'MC', 'ON', 'Mississauga', '101 Maple Ave', NULL, 'L5N1A6', 1, '456.789.0123');

INSERT INTO VOD_CUSTOMER (customer_id, first_name, last_name, email, credit_card_num, credit_card_type,
                          address_province, address_city, address_street, address_extra,
                          postal_code, is_email_valid, phone)
VALUES (5, 'Emily', 'Brown', 'emilybrown@example.com', 7890123456789012,
        'VS', 'QC', 'Montreal', '222 Pine St', 'Suite 201', 'H1A1A1', 1, '567.890.1234');

INSERT INTO VOD_CUSTOMER (customer_id, first_name, last_name, email, credit_card_num, credit_card_type,
                          address_province, address_city, address_street, address_extra,
                          postal_code, is_email_valid, phone)
VALUES (6, 'Michael', 'Jones', 'michaeljones@example.com', 6543210987654321,
        'AX', 'SK', 'Saskatoon', '333 Oak St', NULL, 'S7K3W2', 1, '678.901.2345');

INSERT INTO VOD_CUSTOMER (customer_id, first_name, last_name, email, credit_card_num, credit_card_type,
                          address_province, address_city, address_street, address_extra,
                          postal_code, is_email_valid, phone)
VALUES (7, 'Samantha', 'Garcia', 'samanthagarcia@example.com', 9012345678901234,
        'MC', 'MB', 'Winnipeg', '444 Elm St', NULL, 'R3C2A1', 1, '789.012.3345');

select * from VOD_CUSTOMER;