# Airbnb Database — ERD Requirements

## Overview
This document describes entities, attributes, constraints, and indexing for the Airbnb-like database schema.

## Entities & Attributes

### User
- `user_id`: Primary Key, `UUID`, Indexed  
- `first_name`: `VARCHAR`, NOT NULL  
- `last_name`: `VARCHAR`, NOT NULL  
- `email`: `VARCHAR`, UNIQUE, NOT NULL  
- `password_hash`: `VARCHAR`, NOT NULL  
- `phone_number`: `VARCHAR`, NULL  
- `role`: `ENUM(guest, host, admin)`, NOT NULL  
- `created_at`: `TIMESTAMP`, DEFAULT `CURRENT_TIMESTAMP`  

### Property
- `property_id`: Primary Key, `UUID`, Indexed  
- `host_id`: Foreign Key → `User(user_id)`  
- `name`: `VARCHAR`, NOT NULL  
- `description`: `TEXT`, NOT NULL  
- `location`: `VARCHAR`, NOT NULL  
- `price_per_night`: `DECIMAL`, NOT NULL  
- `created_at`: `TIMESTAMP`, DEFAULT `CURRENT_TIMESTAMP`  
- `updated_at`: `TIMESTAMP`, ON UPDATE `CURRENT_TIMESTAMP`  

### Booking
- `booking_id`: Primary Key, `UUID`, Indexed  
- `property_id`: Foreign Key → `Property(property_id)`  
- `user_id`: Foreign Key → `User(user_id)`  
- `start_date`: `DATE`, NOT NULL  
- `end_date`: `DATE`, NOT NULL  
- `total_price`: `DECIMAL`, NOT NULL  
- `status`: `ENUM(pending, confirmed, canceled)`, NOT NULL  
- `created_at`: `TIMESTAMP`, DEFAULT `CURRENT_TIMESTAMP`  

### Payment
- `payment_id`: Primary Key, `UUID`, Indexed  
- `booking_id`: Foreign Key → `Booking(booking_id)`  
- `amount`: `DECIMAL`, NOT NULL  
- `payment_date`: `TIMESTAMP`, DEFAULT `CURRENT_TIMESTAMP`  
- `payment_method`: `ENUM(credit_card, paypal, stripe)`, NOT NULL  

### Review
- `review_id`: Primary Key, `UUID`, Indexed  
- `property_id`: Foreign Key → `Property(property_id)`  
- `user_id`: Foreign Key → `User(user_id)`  
- `rating`: `INTEGER`, CHECK `rating >= 1 AND rating <= 5`, NOT NULL  
- `comment`: `TEXT`, NOT NULL  
- `created_at`: `TIMESTAMP`, DEFAULT `CURRENT_TIMESTAMP`  

### Message
- `message_id`: Primary Key, `UUID`, Indexed  
- `sender_id`: Foreign Key → `User(user_id)`  
- `recipient_id`: Foreign Key → `User(user_id)`  
- `message_body`: `TEXT`, NOT NULL  
- `sent_at`: `TIMESTAMP`, DEFAULT `CURRENT_TIMESTAMP`  

## Constraints

- User
  - Unique: `email`
  - NOT NULL on required fields (`first_name`, `last_name`, `email`, `password_hash`, `role`)
- Property
  - Foreign key: `host_id` → `User(user_id)`
  - NOT NULL on essential attributes (`name`, `description`, `location`, `price_per_night`)
- Booking
  - Foreign keys: `property_id` → `Property(property_id)`, `user_id` → `User(user_id)`
  - `status` limited to `pending`, `confirmed`, `canceled`
- Payment
  - Foreign key: `booking_id` → `Booking(booking_id)`
- Review
  - Foreign keys: `property_id` → `Property(property_id)`, `user_id` → `User(user_id)`
  - `rating` constrained to 1–5
- Message
  - Foreign keys: `sender_id`, `recipient_id` → `User(user_id)`

## Indexing

- Primary keys: indexed by default.
- Additional indexes:
  - `email` on `User`
  - `property_id` on `Property` and `Booking`
  - `booking_id` on `Booking` and `Payment`


