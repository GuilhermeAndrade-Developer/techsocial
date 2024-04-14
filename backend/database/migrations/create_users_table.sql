CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    date_modified TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    created_by INT,
    modified_by INT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    document VARCHAR(20),
    email VARCHAR(255),
    password VARCHAR(255),
    phone_number VARCHAR(20),
    birth_date DATE
);
