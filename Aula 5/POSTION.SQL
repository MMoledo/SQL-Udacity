SELECT
    first_name,
    last_name,
    city_state,
    POSITION(',' IN city_state) AS comma_position,
    STRPOS(city_state, ',') AS strpos_position,
    LOWER(city_state) AS lower_city_state,
    UPPER(city_state) AS upper_city_state
    LEFT(city_state, POSITION(',' IN city_state)) AS city
FROM
    customers_data