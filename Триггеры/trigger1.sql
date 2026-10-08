CREATE OR REPLACE FUNCTION check_passenger_age()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
    v_passenger_age INT;
BEGIN

    SELECT EXTRACT(YEAR FROM age(birth_date)) INTO v_passenger_age
    FROM Passenger
    WHERE passenger_id = NEW.passenger_id;
    
    IF v_passenger_age < 0 THEN
        RAISE EXCEPTION 'Указан некорректный возраст';
    END IF;
    RETURN NEW;
END;
$$;

CREATE TRIGGER trg_passenger_age_check
BEFORE INSERT OR UPDATE ON Ticket
FOR EACH ROW
EXECUTE FUNCTION check_passenger_age();