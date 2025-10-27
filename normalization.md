# Normalization Analysis

## 1NF (First Normal Form) - Already Achieved
All entities have:
- Atomic values (no repeating groups)
- Primary keys defined
- Each column contains single values

## 2NF (Second Normal Form) - Already Achieved
- All non-key attributes are fully dependent on the primary key
- No partial dependencies exist

## 3NF (Third Normal Form) - Adjustments Needed
### Issues Identified:
- **Property Entity**: Location field needs decomposition
  - Mixed data (city, state, country) violates 3NF
  - Creates transitive dependency

- **User Entity**: Role should reference a separate table for scalability

### Solution:
#### Normalized Schema:
**New/Modified Entities:**

- **User (unchanged core)**
  - `user_id` (PK)
  - `first_name`, `last_name`
  - `email`
  - `password_hash`
  - `phone_number`
  - `role` (guest/host/admin) or FK to Role table if needed
  - `created_at`

- **Property (modified)**
  - `property_id` (PK)
  - `host_id` (FK → User)
  - `name`
  - `description`
  - `location_id` (FK → Location)
  - `pricepernight`
  - `created_at`
  - `updated_at`

- **Location (new)**
  - `location_id` (PK)
  - `address`
  - `city`
  - `state`
  - `country`
  - `zip_code`
  - `latitude`
  - `longitude`

- **Booking (unchanged)**
  - `booking_id` (PK)
  - `property_id` (FK → Property)
  - `user_id` (FK → User)
  - `start_date`, `end_date`
  - `total_price`
  - `status`
  - `created_at`

- **Payment (unchanged)**
  - `payment_id` (PK)
  - `booking_id` (FK → Booking)
  - `amount`
  - `payment_date`
  - `payment_method`

- **Review (unchanged)**
  - `review_id` (PK)
  - `property_id` (FK → Property)
  - `user_id` (FK → User)
  - `rating`
  - `comment`
  - `created_at`

- **Message (unchanged)**
  - `message_id` (PK)
  - `sender_id` (FK → User)
  - `recipient_id` (FK → User)
  - `message_body`
  - `sent_at`

## Normalization Steps Taken:
- **Separated Location Data**: Created Location table to eliminate transitive dependencies. Property → Location → (City, State, Country)
- **Removed Calculated Fields**: Total price in Booking could be calculated, but kept for performance (denormalization trade-off)
- **Ensured No Transitive Dependencies**: All non-key attributes depend only on primary keys

## Benefits:
- Reduced data redundancy
- Improved data integrity
- Easier updates (change location once vs. multiple properties)
- Scalable design
