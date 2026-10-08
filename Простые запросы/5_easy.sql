-- Выбираем номера рейсов и названия аэропортов отправления
SELECT f.flight_number, a.airport_name AS departure_airport
FROM Flight f
INNER JOIN Airport a ON f.departure_airport_code = a.airport_code;