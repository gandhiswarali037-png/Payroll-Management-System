-- Create Database
CREATE DATABASE payroll;
USE payroll;

-- 1. USERS TABLE
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('admin','employee') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. DEPARTMENTS TABLE
CREATE TABLE departments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

-- 3. EMPLOYEES TABLE
CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    department_id INT,
    position VARCHAR(100),
    join_date DATE,
    
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (department_id) REFERENCES departments(id) ON DELETE SET NULL
);

-- 4. SALARY TABLE
CREATE TABLE salary (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    basic_salary DECIMAL(10,2),
    bonus DECIMAL(10,2),
    deduction DECIMAL(10,2),
    net_salary DECIMAL(10,2),
    
    FOREIGN KEY (employee_id) REFERENCES employees(id) ON DELETE CASCADE
);

-- 5. ATTENDANCE TABLE
CREATE TABLE attendance (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    date DATE,
    status ENUM('present','absent') DEFAULT 'present',
    
    FOREIGN KEY (employee_id) REFERENCES employees(id) ON DELETE CASCADE
);

-- Insert Departments
INSERT INTO departments (department_name) VALUES
('IT'), ('HR'), ('Finance'), ('Marketing'), ('Sales');

-- Insert Users
INSERT INTO users (name,email,password,role) VALUES
('Admin','admin@gmail.com','123456','admin'),
('rangole vaishnavi','rangolevaishanavi6@gmail.com','123456','employee'),
('gandhi swarali','gandhiswarali@gmail.com','123456','employee'),
('vedpathak sneha','vedpathaksneha@gmail.com','123456','employee'),
('jadhav pragati','pragatijadhav@gmail.com','123456','employee');

-- Insert Employees
INSERT INTO employees (user_id, department_id, position, join_date) VALUES
(1, 1, 'System Admin', '2022-01-01'),
(2, 1, 'Software Developer', '2023-01-15'),
(3, 2, 'HR Manager', '2022-03-10'),
(4, 3, 'Financial Analyst', '2023-05-20'),
(5, 4, 'Marketing Specialist', '2023-02-28');

-- Insert Salary
INSERT INTO salary (employee_id, basic_salary, bonus, deduction, net_salary) VALUES
(1, 80000, 10000, 5000, 85000),
(2, 60000, 4000, 3000, 61000),
(3, 55000, 3000, 2000, 56000),
(4, 70000, 5000, 4000, 71000),
(5, 45000, 2000, 1000, 46000);

-- Insert Attendance
INSERT INTO attendance (employee_id, date, status) VALUES
(1, '2026-03-01', 'present'),
(2, '2026-03-01', 'present'),
(3, '2026-03-01', 'absent'),
(4, '2026-03-01', 'present'),
(5, '2026-03-01', 'present');