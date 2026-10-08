CREATE OR REPLACE FUNCTION check_baggage_weight()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
    total_weight INTEGER;
BEGIN
    SELECT COALESCE(SUM(weight), 0) INTO total_weight
    FROM Luggage
    WHERE passenger_id = NEW.passenger_id;

    total_weight := total_weight + NEW.weight;
    
    IF total_weight > 23 THEN
        RAISE EXCEPTION 'Превышен лимит багажа';
    END IF;
    RETURN NEW;
END;
$$;

CREATE TRIGGER trg_baggage_weight_limit
BEFORE INSERT OR UPDATE ON Luggage
FOR EACH ROW
EXECUTE FUNCTION check_baggage_weight();