-- Количество аэропортов в каждой стране
SELECT home_country_id, COUNT(*) AS airport_count
FROM airport
GROUP BY home_country_id
ORDER BY home_country_id;
