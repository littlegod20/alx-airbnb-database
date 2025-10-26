-- Seed Database with Sample Data
USE airbnb_db;

-- Disable foreign key checks for easier insertion
SET FOREIGN_KEY_CHECKS = 0;

-- Clear existing data (optional - for testing)
TRUNCATE TABLE Message;
TRUNCATE TABLE Review;
TRUNCATE TABLE Payment;
TRUNCATE TABLE Booking;
TRUNCATE TABLE Property;
TRUNCATE TABLE Location;
TRUNCATE TABLE User;

-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;

-- Insert Users
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role) VALUES
('550e8400-e29b-41d4-a716-446655440001', 'John', 'Doe', 'john.doe@email.com', '$2y$10$abcdefghijklmnopqrstuv', '+1234567890', 'guest'),
('550e8400-e29b-41d4-a716-446655440002', 'Jane', 'Smith', 'jane.smith@email.com', '$2y$10$bcdefghijklmnopqrstuvw', '+1234567891', 'host'),
('550e8400-e29b-41d4-a716-446655440003', 'Mike', 'Johnson', 'mike.j@email.com', '$2y$10$cdefghijklmnopqrstuvwx', '+1234567892', 'host'),
('550e8400-e29b-41d4-a716-446655440004', 'Sarah', 'Williams', 'sarah.w@email.com', '$2y$10$defghijklmnopqrstuvwxy', '+1234567893', 'guest'),
('550e8400-e29b-41d4-a716-446655440005', 'Admin', 'User', 'admin@airbnb.com', '$2y$10$efghijklmnopqrstuvwxyz', '+1234567894', 'admin'),
('550e8400-e29b-41d4-a716-446655440006', 'Emily', 'Brown', 'emily.b@email.com', '$2y$10$fghijklmnopqrstuvwxyza', '+1234567895', 'guest'),
('550e8400-e29b-41d4-a716-446655440007', 'David', 'Lee', 'david.lee@email.com', '$2y$10$ghijklmnopqrstuvwxyzab', '+1234567896', 'host');

-- Insert Locations
INSERT INTO Location (location_id, address, city, state, country, zip_code, latitude, longitude) VALUES
('650e8400-e29b-41d4-a716-446655440001', '123 Ocean Drive', 'Miami', 'Florida', 'USA', '33139', 25.7617, -80.1918),
('650e8400-e29b-41d4-a716-446655440002', '456 Park Avenue', 'New York', 'New York', 'USA', '10022', 40.7614, -73.9776),
('650e8400-e29b-41d4-a716-446655440003', '789 Beach Road', 'Los Angeles', 'California', 'USA', '90291', 33.9850, -118.4695),
('650e8400-e29b-41d4-a716-446655440004', '321 Mountain View', 'Denver', 'Colorado', 'USA', '80202', 39.7392, -104.9903),
('650e8400-e29b-41d4-a716-446655440005', '654 Lake Street', 'Chicago', 'Illinois', 'USA', '60601', 41.8781, -87.6298),
('650e8400-e29b-41d4-a716-446655440006', '987 River Lane', 'Austin', 'Texas', 'USA', '78701', 30.2672, -97.7431);

-- Insert Properties
INSERT INTO Property (property_id, host_id, location_id, name, description, pricepernight) VALUES
('750e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440002', '650e8400-e29b-41d4-a716-446655440001', 'Luxury Beach Villa', 'Beautiful 3-bedroom villa with ocean view and private pool', 350.00),
('750e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440002', '650e8400-e29b-41d4-a716-446655440002', 'Manhattan Penthouse', 'Modern penthouse in the heart of NYC with stunning skyline views', 500.00),
('750e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440003', '650e8400-e29b-41d4-a716-446655440003', 'Venice Beach Apartment', 'Cozy 2-bedroom apartment steps from the beach', 200.00),
('750e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440003', '650e8400-e29b-41d4-a716-446655440004', 'Mountain Cabin Retreat', 'Rustic cabin with mountain views, perfect for skiing', 175.00),
('750e8400-e29b-41d4-a716-446655440005', '550e8400-e29b-41d4-a716-446655440007', '650e8400-e29b-41d4-a716-446655440005', 'Downtown Chicago Loft', 'Industrial loft in trendy neighborhood', 225.00),
('750e8400-e29b-41d4-a716-446655440006', '550e8400-e29b-41d4-a716-446655440007', '650e8400-e29b-41d4-a716-446655440006', 'Austin Music District Studio', 'Studio apartment near live music venues', 125.00);

-- Insert Bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status) VALUES
('850e8400-e29b-41d4-a716-446655440001', '750e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440001', '2024-12-15', '2024-12-20', 1750.00, 'confirmed'),
('850e8400-e29b-41d4-a716-446655440002', '750e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440004', '2024-11-01', '2024-11-05', 2000.00, 'confirmed'),
('850e8400-e29b-41d4-a716-446655440003', '750e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440001', '2025-01-10', '2025-01-15', 1000.00, 'pending'),
('850e8400-e29b-41d4-a716-446655440004', '750e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440006', '2024-12-20', '2024-12-27', 1225.00, 'confirmed'),
('850e8400-e29b-41d4-a716-446655440005', '750e8400-e29b-41d4-a716-446655440005', '550e8400-e29b-41d4-a716-446655440004', '2024-11-15', '2024-11-18', 675.00, 'confirmed'),
('850e8400-e29b-41d4-a716-446655440006', '750e8400-e29b-41d4-a716-446655440006', '550e8400-e29b-41d4-a716-446655440006', '2025-02-01', '2025-02-05', 500.00, 'pending'),
('850e8400-e29b-41d4-a716-446655440007', '750e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440004', '2024-10-10', '2024-10-12', 700.00, 'canceled');

-- Insert Payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_method) VALUES
('950e8400-e29b-41d4-a716-446655440001', '850e8400-e29b-41d4-a716-446655440001', 1750.00, 'credit_card'),
('950e8400-e29b-41d4-a716-446655440002', '850e8400-e29b-41d4-a716-446655440002', 2000.00, 'paypal'),
('950e8400-e29b-41d4-a716-446655440003', '850e8400-e29b-41d4-a716-446655440004', 1225.00, 'stripe'),
('950e8400-e29b-41d4-a716-446655440004', '850e8400-e29b-41d4-a716-446655440005', 675.00, 'debit_card');

-- Insert Reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment) VALUES
('a50e8400-e29b-41d4-a716-446655440001', '750e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440001', 5, 'Amazing villa! The ocean view was breathtaking and the host was very responsive.'),
('a50e8400-e29b-41d4-a716-446655440002', '750e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440004', 4, 'Great location in Manhattan. Apartment was clean but a bit noisy at night.'),
('a50e8400-e29b-41d4-a716-446655440003', '750e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440006', 5, 'Perfect mountain getaway! Cozy cabin with everything we needed.'),
('a50e8400-e29b-41d4-a716-446655440004', '750e8400-e29b-41d4-a716-446655440005', '550e8400-e29b-41d4-a716-446655440004', 4, 'Nice loft in a great neighborhood. Would recommend!'),
('a50e8400-e29b-41d4-a716-446655440005', '750e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440001', 3, 'Decent place but needs better maintenance. Location was good though.'),
('a50e8400-e29b-41d4-a716-446655440006', '750e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440004', 5, 'Absolutely loved it! Will definitely come back.');

-- Insert Messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body) VALUES
('b50e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440002', 'Hi! Is the beach villa available for Christmas week?'),
('b50e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440001', 'Yes, it is! I can offer you a 10% discount for a week-long stay.'),
('b50e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440003', 'What are the check-in and check-out times?'),
('b50e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440004', 'Check-in is at 3 PM and check-out is at 11 AM. Flexible if needed!'),
('b50e8400-e29b-41d4-a716-446655440005', '550e8400-e29b-41d4-a716-446655440006', '550e8400-e29b-41d4-a716-446655440007', 'Is parking included with the studio?'),
('b50e8400-e29b-41d4-a716-446655440006', '550e8400-e29b-41d4-a716-446655440007', '550e8400-e29b-41d4-a716-446655440006', 'Yes, there is free street parking available.');

-- Verify data insertion
SELECT 'Users:' AS Table_Name, COUNT(*) AS Record_Count FROM User
UNION ALL
SELECT 'Locations:', COUNT(*) FROM Location
UNION ALL
SELECT 'Properties:', COUNT(*) FROM Property
UNION ALL
SELECT 'Bookings:', COUNT(*) FROM Booking
UNION ALL
SELECT 'Payments:', COUNT(*) FROM Payment
UNION ALL
SELECT 'Reviews:', COUNT(*) FROM Review
UNION ALL
SELECT 'Messages:', COUNT(*) FROM Message;