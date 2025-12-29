CREATE DATABASE gear_rent_pro;
USE gear_rent_pro;

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    role ENUM('ADMIN', 'MANAGER', 'STAFF') NOT NULL,
    branch_id INT,
    FOREIGN KEY (branch_id) REFERENCES branches(branch_id)
);

CREATE TABLE branches (
    branch_id INT AUTO_INCREMENT PRIMARY KEY,
    branch_code VARCHAR(10) UNIQUE NOT NULL,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255),
    contact VARCHAR(20)
);

CREATE TABLE memberships (
    membership_id INT AUTO_INCREMENT PRIMARY KEY,
    level ENUM('REGULAR', 'SILVER', 'GOLD') UNIQUE NOT NULL,
    discount_percentage DOUBLE NOT NULL
);

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    nic_passport VARCHAR(50) UNIQUE NOT NULL,
    contact VARCHAR(20),
    email VARCHAR(100),
    address VARCHAR(255),
    membership_id INT,
    FOREIGN KEY (membership_id) REFERENCES memberships(membership_id)
);

INSERT INTO memberships (level, discount_percentage) VALUES
('REGULAR', 0),
('SILVER', 5),
('GOLD', 10);

INSERT INTO branches (branch_code, name, address, contact) VALUES
('PAN', 'Panadura Branch', 'Panadura', '0711111111'),
('GAL', 'Galle Branch', 'Galle', '0722222222'),
('COL', 'Colombo Branch', 'Colombo', '0733333333');

INSERT INTO users (username, password, role, branch_id) VALUES
('admin', 'admin123', 'ADMIN', NULL),
('manager1', 'manager123', 'MANAGER', 1),
('manager2', 'manager123', 'MANAGER', 2),
('staff1', 'staff123', 'STAFF', 1),
('staff2', 'staff123', 'STAFF', 2);

CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(255),
    base_price_factor DOUBLE NOT NULL,
    weekend_multiplier DOUBLE NOT NULL,
    late_fee_per_day DOUBLE
);

INSERT INTO categories (name, description, base_price_factor, weekend_multiplier, late_fee_per_day) VALUES
('Camera', 'Professional cameras', 1.0, 1.2, 1500),
('Lens', 'Camera lenses', 0.8, 1.1, 1000),
('Drone', 'Aerial drones', 1.5, 1.3, 3000),
('Lighting', 'Lighting kits', 0.9, 1.1, 1200),
('Audio', 'Audio equipment', 0.7, 1.1, 800);

CREATE TABLE equipment (
    equipment_id INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT NOT NULL,
    branch_id INT NOT NULL,
    brand VARCHAR(50),
    model VARCHAR(50),
    purchase_year INT,
    base_daily_price DOUBLE NOT NULL,
    deposit_amount DOUBLE NOT NULL,
    status ENUM('AVAILABLE', 'RESERVED', 'RENTED', 'MAINTENANCE') DEFAULT 'AVAILABLE',
    FOREIGN KEY (category_id) REFERENCES categories(category_id),
    FOREIGN KEY (branch_id) REFERENCES branches(branch_id)
);

INSERT INTO customers (name, nic_passport, contact, email, address, membership_id) VALUES
('Amaya Perera', 'NIC123456V', '0771234567', 'amaya@gmail.com', 'Colombo', 1),
('Nimal Silva', 'NIC234567V', '0712345678', 'nimal@gmail.com', 'Galle', 2),
('Sahan Fernando', 'NIC345678V', '0723456789', 'sahan@gmail.com', 'Panadura', 3),
('Kavindi Jayasuriya', 'NIC456789V', '0754567890', 'kavindi@gmail.com', 'Colombo', 1),
('Ravindu Perera', 'NIC567890V', '0765678901', 'ravindu@gmail.com', 'Galle', 2),
('Sunil Bandara', 'NIC678901V', '0786789012', 'sunil@gmail.com', 'Panadura', 1),
('Priya Ratnayake', 'NIC789012V', '0797890123', 'priya@gmail.com', 'Colombo', 2),
('Chamara Silva', 'NIC890123V', '0708901234', 'chamara@gmail.com', 'Galle', 3),
('Nayana Fernando', 'NIC901234V', '0769012345', 'nayana@gmail.com', 'Panadura', 1),
('Rajith Perera', 'NIC012345V', '0710123456', 'rajith@gmail.com', 'Colombo', 2);

INSERT INTO equipment (category_id, branch_id, brand, model, purchase_year, base_daily_price, deposit_amount, status) VALUES
-- Cameras
(1, 1, 'Canon', 'EOS R5', 2022, 12000, 100000, 'AVAILABLE'),
(1, 1, 'Sony', 'A7 III', 2021, 11500, 95000, 'AVAILABLE'),
(1, 2, 'Nikon', 'Z6 II', 2021, 11000, 90000, 'AVAILABLE'),
(1, 2, 'Canon', 'EOS R6', 2022, 12500, 105000, 'AVAILABLE'),
(1, 3, 'Fujifilm', 'XT-4', 2020, 10000, 85000, 'AVAILABLE'),
(1, 3, 'Sony', 'A7 IV', 2023, 13000, 110000, 'AVAILABLE'),

-- Lenses
(2, 1, 'Sony', '24-70mm', 2020, 6000, 50000, 'AVAILABLE'),
(2, 1, 'Canon', '50mm f/1.8', 2019, 4500, 30000, 'AVAILABLE'),
(2, 2, 'Nikon', '70-200mm', 2021, 7000, 60000, 'AVAILABLE'),
(2, 2, 'Sigma', 'Art 35mm', 2022, 5500, 45000, 'AVAILABLE'),
(2, 3, 'Sony', '85mm f/1.8', 2020, 6500, 55000, 'AVAILABLE'),

-- Drones
(3, 1, 'DJI', 'Mavic Air 2', 2023, 20000, 150000, 'AVAILABLE'),
(3, 1, 'DJI', 'Mini 3 Pro', 2023, 18000, 140000, 'AVAILABLE'),
(3, 2, 'DJI', 'Air 2S', 2022, 22000, 160000, 'AVAILABLE'),
(3, 3, 'Autel', 'Evo Lite+', 2022, 21000, 155000, 'AVAILABLE'),
(3, 3, 'DJI', 'Mavic 3', 2023, 25000, 180000, 'AVAILABLE'),

-- Lighting
(4, 1, 'Godox', 'SL60W', 2021, 5000, 40000, 'AVAILABLE'),
(4, 1, 'Aputure', 'Light Storm 120D', 2021, 6000, 50000, 'AVAILABLE'),
(4, 2, 'Nanlite', 'Forza 60', 2022, 5500, 45000, 'AVAILABLE'),
(4, 2, 'Godox', 'AD200', 2020, 6500, 52000, 'AVAILABLE'),
(4, 3, 'Godox', 'VL150', 2020, 6500, 52000, 'AVAILABLE'),

-- Audio
(5, 1, 'Rode', 'NTG4+', 2022, 4000, 30000, 'AVAILABLE'),
(5, 1, 'Zoom', 'H6 Recorder', 2021, 5000, 40000, 'AVAILABLE'),
(5, 2, 'Sennheiser', 'MKH 416', 2020, 7000, 60000, 'AVAILABLE'),
(5, 3, 'Tascam', 'DR-40X', 2022, 4500, 35000, 'AVAILABLE'),
(5, 3, 'Rode', 'Wireless Go II', 2023, 6000, 50000, 'AVAILABLE');

CREATE TABLE reservations (
    reservation_id INT AUTO_INCREMENT PRIMARY KEY,
    equipment_id INT NOT NULL,
    customer_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status ENUM('ACTIVE', 'CANCELLED') DEFAULT 'ACTIVE',
    FOREIGN KEY (equipment_id) REFERENCES equipment(equipment_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE rentals (
    rental_id INT AUTO_INCREMENT PRIMARY KEY,
    equipment_id INT NOT NULL,
    customer_id INT NOT NULL,
    branch_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    rental_amount DOUBLE NOT NULL,
    deposit_amount DOUBLE NOT NULL,
    membership_discount DOUBLE,
    long_rental_discount DOUBLE,
    final_amount DOUBLE NOT NULL,
    payment_status ENUM('PAID', 'PARTIALLY_PAID', 'UNPAID') DEFAULT 'UNPAID',
    rental_status ENUM('ACTIVE', 'RETURNED', 'OVERDUE', 'CANCELLED') DEFAULT 'ACTIVE',
    FOREIGN KEY (equipment_id) REFERENCES equipment(equipment_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (branch_id) REFERENCES branches(branch_id),
    INDEX idx_rental_status (rental_status),
    INDEX idx_end_date (end_date)
);

CREATE TABLE returns (
    return_id INT AUTO_INCREMENT PRIMARY KEY,
    rental_id INT NOT NULL,
    actual_return_date DATE NOT NULL,
    damage_description VARCHAR(255),
    damage_charge DOUBLE DEFAULT 0,
    late_fee DOUBLE DEFAULT 0,
    FOREIGN KEY (rental_id) REFERENCES rentals(rental_id)
);

-- Sample data for reservations
INSERT INTO reservations (equipment_id, customer_id, start_date, end_date, status) VALUES
(1, 1, '2024-12-15', '2024-12-18', 'ACTIVE'),
(3, 2, '2024-12-20', '2024-12-22', 'ACTIVE'),
(5, 3, '2024-12-25', '2024-12-28', 'ACTIVE');

-- Sample data for rentals (some overdue)
INSERT INTO rentals (equipment_id, customer_id, branch_id, start_date, end_date, rental_amount, deposit_amount, membership_discount, long_rental_discount, final_amount, payment_status, rental_status) VALUES
(2, 1, 1, '2024-11-25', '2024-12-05', 110000, 95000, 0, 11000, 99000, 'PAID', 'RETURNED'),
(4, 2, 2, '2024-12-01', '2024-12-10', 180000, 105000, 9000, 18000, 153000, 'PARTIALLY_PAID', 'ACTIVE'),
(6, 3, 3, '2024-11-20', '2024-11-25', 65000, 85000, 0, 0, 65000, 'UNPAID', 'ACTIVE'),
(8, 4, 1, '2024-11-15', '2024-11-20', 40000, 30000, 0, 0, 40000, 'PAID', 'RETURNED'),
(10, 5, 2, '2024-11-10', '2024-11-15', 48000, 45000, 2400, 0, 45600, 'PAID', 'ACTIVE'),
(12, 6, 1, '2024-11-05', '2024-11-08', 54000, 140000, 0, 0, 54000, 'UNPAID', 'ACTIVE'),
(15, 7, 3, '2024-11-01', '2024-11-05', 100000, 155000, 10000, 0, 90000, 'PAID', 'RETURNED'),
(18, 8, 2, '2024-10-28', '2024-11-02', 65000, 52000, 3250, 0, 61750, 'PAID', 'RETURNED'),
(20, 9, 1, '2024-10-25', '2024-10-30', 30000, 40000, 0, 0, 30000, 'UNPAID', 'ACTIVE'),
(22, 10, 3, '2024-10-20', '2024-10-25', 56000, 35000, 5600, 0, 50400, 'PAID', 'RETURNED');

-- Update some rentals to be overdue (end date before today)
UPDATE rentals SET end_date = DATE_SUB(CURDATE(), INTERVAL 2 DAY) WHERE rental_id = 3;
UPDATE rentals SET end_date = DATE_SUB(CURDATE(), INTERVAL 5 DAY) WHERE rental_id = 6;
UPDATE rentals SET end_date = DATE_SUB(CURDATE(), INTERVAL 1 DAY) WHERE rental_id = 10;
UPDATE rentals SET end_date = DATE_SUB(CURDATE(), INTERVAL 3 DAY) WHERE rental_id = 20;

-- Update equipment status based on rentals
UPDATE equipment e
JOIN rentals r ON e.equipment_id = r.equipment_id
SET e.status = 'RENTED'
WHERE r.rental_status = 'ACTIVE';

-- Sample return records
INSERT INTO returns (rental_id, actual_return_date, damage_description, damage_charge, late_fee) VALUES
(1, '2024-12-05', 'Minor scratch on LCD', 5000, 0),
(4, '2024-11-20', NULL, 0, 0),
(8, '2024-11-20', 'Dust on sensor', 3000, 0),
(3, '2024-11-05', NULL, 0, 0),
(6, '2024-11-02', 'Broken stand', 8000, 1500),
(10, '2024-10-25', NULL, 0, 0);

SELECT COUNT(*) as TotalEquipment FROM equipment;
SELECT COUNT(*) as TotalCustomers FROM customers;
SELECT COUNT(*) as TotalRentals FROM rentals;
SELECT COUNT(*) as OverdueRentals FROM rentals WHERE rental_status = 'ACTIVE' AND end_date < CURDATE();