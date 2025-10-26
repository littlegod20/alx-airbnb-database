# Database Schema - ALX Airbnb Database

## Overview
This directory contains the SQL DDL scripts for creating the Airbnb database schema.

## Schema Design

### Tables
1. **User** - Stores user information (guests, hosts, admins)
2. **Location** - Normalized location data for properties
3. **Property** - Property listings
4. **Booking** - Reservation records
5. **Payment** - Payment transactions
6. **Review** - Property reviews and ratings
7. **Message** - User-to-user messaging

### Key Features
- **UUID Primary Keys**: Using CHAR(36) for globally unique identifiers
- **Foreign Key Constraints**: Enforced referential integrity with CASCADE/RESTRICT
- **Check Constraints**: Data validation (prices > 0, ratings 1-5, date logic)
- **Indexes**: Optimized for common queries (searches, joins, filters)
- **ENUM Types**: Constrained values for role, status, payment methods

### Indexes Strategy
- Email lookups (User)
- Property searches by location and price
- Booking queries by dates and status
- Review filtering by rating
- Message retrieval by sender/recipient

## Usage
```bash
mysql -u root -p < schema.sql
```

## Constraints
- Bookings: end_date > start_date
- Prices: must be positive
- Ratings: 1-5 range
- One payment per booking (UNIQUE constraint)
```
