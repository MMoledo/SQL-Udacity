SELECT
    first_name,
    last_name,
    phone_number,
    LEFT(phone_number, 3) AS area_code,
    RIGHT(phone_number, 8) AS local_number,
    LENGTH(phone_number) AS phone_length,
    RIGHT(phone_number, LENGTH(phone_number) - 4) AS without_area_code
FROM
    customer_data