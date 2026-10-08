-- Mодели самолетов, средняя вместимость которых превышает 150 пассажиров

SELECT aircraft_model, AVG(capacity) AS avg_capacity
FROM Aircraft
GROUP BY aircraft_model
HAVING AVG(capacity) > 150;