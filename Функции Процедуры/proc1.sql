CREATE OR REPLACE PROCEDURE book_ticket(
    p_passenger_id INTEGER,
    p_flight_id INTEGER,
    p_seat_number VARCHAR(10),
    p_booking_ref VARCHAR(20)
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_capacity INT;
    v_booked_seats INT;
BEGIN
    SELECT ac.capacity INTO v_capacity
    FROM Flight f
    JOIN Aircraft ac ON f.aircraft_id = ac.aircraft_id
    WHERE f.flight_id = p_flight_id;
    
    SELECT COUNT(*) INTO v_booked_seats
    FROM Ticket
    WHERE flight_id = p_flight_id;
    
    IF v_booked_seats >= v_capacity THEN
        RAISE EXCEPTION 'Нет свободных мест на рейс %', p_flight_id;
    ELSE
        INSERT INTO Ticket (passenger_id, flight_id, seat_number, booking_reference)
        VALUES (p_passenger_id, p_flight_id, p_seat_number, p_booking_ref);
        RAISE NOTICE 'Билет успешно забронирован (ID: %)', currval('ticket_ticket_id_seq');
    END IF;
END;
$$;