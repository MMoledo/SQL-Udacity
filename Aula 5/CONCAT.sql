SELECT first_name,
       last_name,
        CONCAT(first_name, ' ', last_name) AS full_name,
        first_name || ' ' || last_name AS full_name_alt
  FROM customer_data