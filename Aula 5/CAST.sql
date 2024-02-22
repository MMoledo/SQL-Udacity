SELECT *,
        DATE_PART('month', TO_DATE(month,'month')) AS clean_month,
        year || '-' || DATE_PART('month', TO_DATE(month,'month')) || '-' || day AS concat_date
        CAST(year || '-' || DATE_PART('month', TO_DATE(month,'month')) || '-' || day AS date) AS formatted_date
FROM 
    ad_clicks

