CREATE VIEW details AS
SELECT
    f.flight_number,
    f.departure_time,
    f.arrival_time,
    ac.aircraft_model,
    ac.capacity,
    dep.airport_name AS departure_airport,
    dep_c.country_name AS departure_country,
    arr.airport_name AS arrival_airport,
    arr_c.country_name AS arrival_country
FROM 
    Flight f
JOIN 
    Aircraft ac ON f.aircraft_id = ac.aircraft_id
JOIN 
    Airport dep ON f.departure_airport_code = dep.airport_code
JOIN 
    Country dep_c ON dep.home_country_id = dep_c.country_id
JOIN 
    Airport arr ON f.arrival_airport_code = arr.airport_code
JOIN 
    Country arr_c ON arr.home_country_id = arr_c.country_id;