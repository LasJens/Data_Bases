-- Выбираем пассажиров, у которых вес багажа превышает 20 кг
SELECT * FROM Passenger
WHERE passenger_id IN (SELECT passenger_id FROM Luggage WHERE weight > 20);