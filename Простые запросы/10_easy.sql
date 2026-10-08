-- Вычисляем среднюю вместимость самолетов для каждой авиакомпании
SELECT airline_id, aircraft_model,
       AVG(capacity) OVER (PARTITION BY airline_id) AS avg_capacity
FROM Aircraft;