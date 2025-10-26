# Database Seeding - ALX Airbnb Database

## Overview
This directory contains SQL scripts to populate the Airbnb database with realistic sample data.

## Sample Data Overview

### Users (7 records)
- 3 Guests
- 3 Hosts
- 1 Admin

### Locations (6 records)
Cities across USA:
- Miami, FL
- New York, NY
- Los Angeles, CA
- Denver, CO
- Chicago, IL
- Austin, TX

### Properties (6 records)
Various property types:
- Luxury villas
- City apartments
- Mountain cabins
- Studios
- Price range: $125-$500/night

### Bookings (7 records)
- Confirmed bookings (4)
- Pending bookings (2)
- Canceled bookings (1)
- Date range: October 2024 - February 2025

### Payments (4 records)
Multiple payment methods:
- Credit card
- Debit card
- PayPal
- Stripe

### Reviews (6 records)
- Ratings: 3-5 stars
- Diverse feedback comments

### Messages (6 records)
- Host-guest communications
- Booking inquiries
- Property questions

## Usage

### Run the seed script:
```bash
mysql -u root -p airbnb_db < seed.sql
```

### Verify data:
```sql
USE airbnb_db;
SELECT * FROM User;
SELECT * FROM Property;
SELECT * FROM Booking;
```

## Data Characteristics
- **Realistic UUIDs**: Manually crafted for consistency
- **Referential Integrity**: All foreign keys properly linked
- **Date Logic**: Bookings respect start/end date constraints
- **Price Consistency**: Booking totals match property rates × nights
- **Diverse Scenarios**: Includes various booking statuses and user interactions

## Notes
- Script includes TRUNCATE commands (commented for safety)
- Foreign key checks temporarily disabled during seeding
- Verification query at end confirms record counts
```
