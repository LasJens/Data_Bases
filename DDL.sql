CREATE TABLE Country (
    country_id INT PRIMARY KEY,
    country_name VARCHAR(100) NOT NULL,
    capital_name VARCHAR(100),
    language VARCHAR(50)
);

CREATE TABLE Airport (
    airport_code VARCHAR(3) PRIMARY KEY,
    airport_name VARCHAR(100) NOT NULL,
    home_country_id INT NOT NULL,
    operating_hours VARCHAR(50),
    phone_number VARCHAR(20),
    number_of_terminals INT,
    FOREIGN KEY (home_country_id) REFERENCES Country(country_id)
);

CREATE TABLE Airline (
    airline_id INT PRIMARY KEY,
    airline_name VARCHAR(100) NOT NULL,
    home_airport_code VARCHAR(3) NOT NULL,
    home_country_id INT NOT NULL,
    phone_number VARCHAR(20),
    FOREIGN KEY (home_airport_code) REFERENCES Airport(airport_code),
    FOREIGN KEY (home_country_id) REFERENCES Country(country_id)
);

CREATE TABLE Aircraft (
    aircraft_id INT PRIMARY KEY,
    airline_id INT NOT NULL,
    capacity INT NOT NULL,
    aircraft_model VARCHAR(50) NOT NULL,
    FOREIGN KEY (airline_id) REFERENCES Airline(airline_id)
);

CREATE TABLE Passenger (
    passenger_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    passport_data VARCHAR(50) NOT NULL,
    phone_number VARCHAR(20)
);

CREATE TABLE Luggage (
    luggage_id INT PRIMARY KEY,
    passenger_id INT NOT NULL,
    weight DECIMAL(5, 2) NOT NULL,
    status VARCHAR(20) NOT NULL,
    FOREIGN KEY (passenger_id) REFERENCES Passenger(passenger_id)
);

CREATE TABLE Flight (
    flight_number VARCHAR(10) PRIMARY KEY,
    departure_airport_code VARCHAR(3) NOT NULL,
    arrival_airport_code VARCHAR(3) NOT NULL,
    departure_time DATE NOT NULL,
    arrival_time DATE NOT NULL,
    status VARCHAR(20) NOT NULL,
    prev_departure_airport_code VARCHAR(3),
    prev_arrival_airport_code VARCHAR(3),
    prev_departure_time DATE,
    prev_arrival_time DATE,
    prev_status VARCHAR(20),
    aircraft_id INT NOT NULL,
    FOREIGN KEY (departure_airport_code) REFERENCES Airport(airport_code),
    FOREIGN KEY (arrival_airport_code) REFERENCES Airport(airport_code),
    FOREIGN KEY (aircraft_id) REFERENCES Aircraft(aircraft_id)
);

CREATE TABLE Ticket (
    ticket_number VARCHAR(20) PRIMARY KEY,
    flight_number VARCHAR(10) NOT NULL,
    passenger_id INT NOT NULL,
    luggage_id INT NOT NULL,
    class VARCHAR(20) NOT NULL,
    seat_number VARCHAR(10) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (flight_number) REFERENCES Flight(flight_number),
    FOREIGN KEY (passenger_id) REFERENCES Passenger(passenger_id),
    FOREIGN KEY (luggage_id) REFERENCES Luggage(luggage_id)
);