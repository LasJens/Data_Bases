CREATE OR REPLACE FUNCTION get_flight_occupancy(p_flight_id INTEGER)
RETURNS NUMERIC
LANGUAGE plpgsql
AS $$
DECLARE
    v_capacity INTEGER;
    v_booked INTEGER;
    v_occupancy NUMERIC;
BEGIN

    SELECT a.capacity INTO v_capacity
    FROM Flight f
    JOIN Aircraft a ON f.aircraft_id = a.aircraft_id
    WHERE f.flight_id = p_flight_id;

    SELECT COUNT(*) INTO v_booked
    FROM Ticket
    WHERE flight_id = p_flight_id;

    v_occupancy := (v_booked::NUMERIC / v_capacity) * 100;

    RETURN ROUND(v_occupancy, 2);
END;
$$;
