CREATE OR REPLACE FUNCTION check_ticket_price()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    IF NEW.price > 100000 THEN
        RAISE EXCEPTION 'Превышена допустимая цена билета';
    ELSIF NEW.price < 0 THEN
        RAISE EXCEPTION 'Цена билета не может быть отрицательной';
    END IF;
    RETURN NEW;
END;
$$;

CREATE TRIGGER trg_ticket_price_limit
BEFORE INSERT OR UPDATE ON Ticket
FOR EACH ROW
EXECUTE FUNCTION check_ticket_price();
