-- Create database
CREATE DATABASE IF NOT EXISTS foodwaste CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE foodwaste;
show tables;
select * from users;
select * from food_item;
select * from donation;
ALTER TABLE users ADD COLUMN token VARCHAR(255);
-- Users table
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role ENUM('ADMIN', 'DONOR', 'RECIPIENT') NOT NULL,
    location VARCHAR(255)
);
iNSERT INTO food_item (donor_id, name, quantity, type, expiration_date, status) VALUES
(2, 'Rice', 10, 'Veg', '2025-06-01', 'AVAILABLE'),
(2, 'Bread', 5, 'Veg', '2025-05-20', 'CLAIMED');
-- Food items table
CREATE TABLE IF NOT EXISTS food_item (
    id INT AUTO_INCREMENT PRIMARY KEY,
    donor_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    quantity INT NOT NULL,
    type VARCHAR(100) NOT NULL,
    expiration_date DATE NOT NULL,
    status ENUM('AVAILABLE', 'CLAIMED') DEFAULT 'AVAILABLE',
    FOREIGN KEY (donor_id) REFERENCES users(id)
);

-- Donations table
CREATE TABLE IF NOT EXISTS donation (
    id INT AUTO_INCREMENT PRIMARY KEY,
    food_item_id INT NOT NULL,
    recipient_id INT NOT NULL,
    claimed_at DATETIME,
    FOREIGN KEY (food_item_id) REFERENCES food_item(id),
    FOREIGN KEY (recipient_id) REFERENCES users(id)
);

SELECT * FROM users;

-- Sample users
INSERT IGNORE INTO users (name, email, password, role, location) VALUES
('Admin', 'admin@foodwaste.com', 'admin123', 'ADMIN', 'HQ'),
('User', 'user@foodwaste.com', 'user123', 'DONOR', 'City');
select * from users;

