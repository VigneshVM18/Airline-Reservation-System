
CREATE DATABASE FLIGHTS;
USE FLIGHTS;

CREATE TABLE Airport (
    AirportCode VARCHAR(3) PRIMARY KEY,
    AirportName VARCHAR(100),
    Location VARCHAR(255),
    Facilities VARCHAR(255)
);
INSERT INTO Airport (AirportCode, AirportName, Location, Facilities) VALUES
('DEL', 'Indira Gandhi International Airport', 'Delhi, India', 'Lounge, Wi-Fi, Duty-Free Shops'),
('BOM', 'Chhatrapati Shivaji Maharaj International Airport', 'Mumbai, India', 'Restaurants, Wi-Fi, ATMs'),
('BLR', 'Kempegowda International Airport', 'Bangalore, India', 'Lounge, Car Rentals, Wi-Fi');

CREATE TABLE Flight (
    FlightID INT PRIMARY KEY,
    FlightNumber VARCHAR(20) UNIQUE,
    DepartureDateTime DATETIME,
    ArrivalDateTime DATETIME,
    OriginAirportCode VARCHAR(3),
    DestinationAirportCode VARCHAR(3),
    AvailableSeats INT,
    FOREIGN KEY (OriginAirportCode) REFERENCES Airport(AirportCode),
    FOREIGN KEY (DestinationAirportCode) REFERENCES Airport(AirportCode)
);

INSERT INTO Flight (FlightID, FlightNumber, DepartureDateTime, ArrivalDateTime, OriginAirportCode, DestinationAirportCode, AvailableSeats) VALUES
(101, 'AI202', '2025-08-01 08:00:00', '2025-08-01 10:30:00', 'DEL', 'BOM', 180),
(102, '6E305', '2025-08-02 14:00:00', '2025-08-02 16:15:00', 'BOM', 'BLR', 200),
(103, 'SG111', '2025-08-03 18:00:00', '2025-08-03 20:30:00', 'BLR', 'DEL', 150);

CREATE TABLE Passenger (
    PassengerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    PassportNumber VARCHAR(20)
);

INSERT INTO Passenger (PassengerID, FirstName, LastName, Email, PassportNumber) VALUES
(1, 'Rahul', 'Sharma', 'rahul.sharma@email.com', 'M1234567'),
(2, 'Priya', 'Verma', 'priya.verma@email.com', 'N7654321'),
(3, 'Amit', 'Kumar', 'amit.kumar@email.com', 'Z1122334');

CREATE TABLE Airline (
    AirlineID INT PRIMARY KEY,
    AirlineName VARCHAR(100),
    ContactNumber VARCHAR(20),
    OperatingRegion VARCHAR(100)
);
INSERT INTO Airline (AirlineID, AirlineName, ContactNumber, OperatingRegion) VALUES
(1, 'Air India', '+91-11-24624074', 'India'),
(2, 'IndiGo', '+91-124-6173838', 'Asia'),
(3, 'SpiceJet', '+91-9871803333', 'Domestic');

CREATE TABLE Booking (
    BookingID INT PRIMARY KEY,
    FlightID INT,
    PassengerID INT,
    PaymentStatus VARCHAR(20),
    FOREIGN KEY (FlightID) REFERENCES Flight(FlightID),
    FOREIGN KEY (PassengerID) REFERENCES Passenger(PassengerID)
);

INSERT INTO Booking (BookingID, FlightID, PassengerID, PaymentStatus) VALUES
(1001, 101, 1, 'Paid'),
(1002, 102, 2, 'Paid'),
(1003, 103, 3, 'Pending');

CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,
    BookingID INT UNIQUE,
    PaymentMethod VARCHAR(50),
    Amount DECIMAL(10, 2),
    TransactionDateTime DATETIME,
    FOREIGN KEY (BookingID) REFERENCES Booking(BookingID)
);

INSERT INTO Payment (PaymentID, BookingID, PaymentMethod, Amount, TransactionDateTime) VALUES
(501, 1001, 'Credit Card', 4500.00, '2025-07-20 12:15:00'),
(502, 1002, 'UPI', 3200.00, '2025-07-21 15:30:00');

SELECT * FROM FLIGHT;
