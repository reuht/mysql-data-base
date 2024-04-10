CREATE DATABASE IF NOT EXISTS tecnocall_sales
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE tecnocall_sales;

CREATE TABLE IF NOT EXISTS operators(
    operatorId INT AUTO_INCREMENT PRIMARY KEY,
    operatorName VARCHAR(20) NOT NULL,
    createdAt DATETIME,
    updatedAt DATETIME,
    deletedAt DATETIME
); 

CREATE TABLE IF NOT EXISTS plans(
    planId INT AUTO_INCREMENT PRIMARY KEY,
    operatorId INT,
    ptar INT,
    plan VARCHAR(150) NOT NULL,
    renta DECIMAL(10,2),
    cod_tarifa VARCHAR(10) NOT NULL,
    createdAt DATETIME,
    updatedAt DATETIME,
    deletedAt DATETIME,
    FOREIGN KEY (operatorId) REFERENCES operators(operatorId)
); 

CREATE TABLE IF NOT EXISTS commissions(
    commissionId INT AUTO_INCREMENT PRIMARY KEY,
    planId INT NOT NULL, 
    commissionValue DECIMAL(10,2) NOT NULL,
    aditinal DECIMAL(10,2), 
    all_claro DECIMAL(10,2),
    createdAt DATETIME,
    updatedAt DATETIME,
    deletedAt DATETIME,
    FOREIGN KEY (planId) REFERENCES plans(planId)
);

CREATE TABLE IF NOT EXISTS users(
    userId INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(25) NOT NULL,
    lastName VARCHAR(25) NOT NULL,
    email VARCHAR(50) NOT NULL,
    phone1 VARCHAR(30) NOT NULL,
    phone2 VARCHAR(30) NOT NULL,
    address VARCHAR(100) NOT NULL,
    cod_municipality INT, 
    cod_neighborhood INT,
    cod_user INT NOT NULL, 
    user_document VARCHAR(20) NOT NULL,
    createdAt DATETIME,
    updatedAt DATETIME,
    deletedAt DATETIME
);

CREATE TABLE IF NOT EXISTS statusSales(
    statusSalesId INT AUTO_INCREMENT PRIMARY KEY,
    status_value VARCHAR(100),
    createdAt DATETIME,
    updatedAt DATETIME,
    deletedAt DATETIME
); 

CREATE TABLE IF NOT EXISTS clientAddress(
    clientAddressId INT AUTO_INCREMENT PRIMARY KEY,
    address_data VARCHAR(100) NOT NULL,
    createdAt DATETIME,
    updatedAt DATETIME,
    deletedAt DATETIME
);

CREATE TABLE IF NOT EXISTS clients(
    clientId INT AUTO_INCREMENT PRIMARY KEY,
    phone1 VARCHAR(30) NOT NULL,
    phone2 VARCHAR(30),
    email VARCHAR(50), 
    client_document VARCHAR(30) NOT NULL,
    clientAddressId INT NOT NULL,
    createdAt DATETIME,
    updatedAt DATETIME,
    deletedAt DATETIME,
    FOREIGN KEY(clientAddressId) REFERENCES clientAddress(clientAddressId)
); 

CREATE TABLE IF NOT EXISTS sales(
    saleId INT AUTO_INCREMENT PRIMARY KEY,
    operatorId INT NOT NULL,
    clientId INT NOT NULL,
    ptar INT,
    plan VARCHAR(150),
    renta DECIMAL(10,2),
    cod_tarifa VARCHAR(10),
    userId INT NOT NULL, 
    cta VARCHAR(20),
    ot VARCHAR(20),
    install_date DATETIME, 
    statusSalesId INT,
    number_of_services INT,
    contract_number VARCHAR(100),
    createdAt DATETIME,
    updatedAt DATETIME,
    deletedAt DATETIME,
    FOREIGN KEY (userId) REFERENCES users(userId),
    FOREIGN KEY (statusSalesId) REFERENCES statusSales(statusSalesId),
    FOREIGN KEY (clientId) REFERENCES clients(clientId),
    FOREIGN KEY (operatorId) REFERENCES operators(operatorId)
); 