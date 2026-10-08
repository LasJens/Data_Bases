-- Находим пары рейсов, где время прибытия первого рейса совпадает с отправлением второго
SELECT f1.flight_number AS flight1, f2.flight_number AS flight2
FROM Flight f1
JOIN Flight f2 ON f1.arrival_time = f2.departure_time;