CREATE VIEW ticket_flight_passenger_details AS
SELECT 
    t.ticket_number,
    p.last_name,
    p.passport_data,
    f.flight_number,
    f.departure_airport_code,
    f.arrival_airport_code,
    f.departure_time,
    f.arrival_time
FROM 
    Ticket t
JOIN 
    Passenger p ON t.passenger_id = p.passenger_id
JOIN 
    Flight f ON t.flight_number = f.flight_number;