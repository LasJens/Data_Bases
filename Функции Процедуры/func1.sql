CREATE OR REPLACE FUNCTION get_flight_passengers(p_flight_id INT)
RETURNS TABLE (
    last_name VARCHAR(100),
    passport_number VARCHAR(50),
    seat_number VARCHAR(10)
)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT p.last_name, p.first_name, p.passport_data, t.seat_number
    FROM Ticket t
    JOIN Passenger p ON t.passenger_id = p.passenger_id
    WHERE t.flight_id = p_flight_id;
END;
$$;