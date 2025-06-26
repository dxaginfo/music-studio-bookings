-- Studio Booking Assistant database schema (PostgreSQL)
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  role VARCHAR(50) NOT NULL
);

CREATE TABLE studios (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  location VARCHAR(255) NOT NULL
);

CREATE TABLE bookings (
  id SERIAL PRIMARY KEY,
  studio_id INTEGER REFERENCES studios(id),
  user_id INTEGER REFERENCES users(id),
  staff_id INTEGER REFERENCES users(id),
  start_time TIMESTAMP NOT NULL,
  end_time TIMESTAMP NOT NULL,
  status VARCHAR(32) NOT NULL,
  payment_status VARCHAR(32)
);

CREATE TABLE sessions (
  id SERIAL PRIMARY KEY,
  booking_id INTEGER REFERENCES bookings(id),
  type VARCHAR(32),
  notes TEXT
);

CREATE TABLE payments (
  id SERIAL PRIMARY KEY,
  booking_id INTEGER REFERENCES bookings(id),
  amount NUMERIC(10,2) NOT NULL,
  payment_method VARCHAR(32),
  status VARCHAR(32)
);
