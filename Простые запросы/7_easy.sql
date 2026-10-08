-- Ранжируем рейсы по времени отправления
SELECT flight_number, departure_time,
       RANK() OVER (ORDER BY departure_time) AS departure_rank
FROM Flight;