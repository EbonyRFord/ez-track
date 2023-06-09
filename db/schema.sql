-- -- databases needed for schema 

-- department
-- id: INT PRIMARY KEY,
-- name: VARCHAR(30);

-- role
-- id: INT PRIMARY KEY,
-- title: VARCHAR(30),
-- salary: decimal
-- department_id: INT;

-- employee
-- id: INT PRIMARY KEY,
-- first_name: VARCHAR(30),
-- last_name: VARCHAR(30),
-- role_id: INT,
-- manager_id: INT; null if no manager;


DROP DATABASE IF EXISTS departments_db;
CREATE DATABASE departments_db;

USE departments_db;

CREATE TABLE department (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(30)
);

CREATE TABLE roles (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(30),
    salary DECIMAL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(id) ON DELETE SET NULL
);

CREATE TABLE employees (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    role_id INT,
    manager_id INT,
    FOREIGN KEY (role_id) REFERENCES roles(id) ON DELETE SET NULL,
    FOREIGN KEY (manager_id) REFERENCES employees(id) ON DELETE SET NULL,
);


