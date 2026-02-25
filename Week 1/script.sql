CREATE DATABASE TestDB_2024_CS_28;

USE TestDB_2024_CS_28;

CREATE TABLE student (
    StudentID INT NOT NULL AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50),
    DateOfBirth DATE,
    EnrollmentYear INT,
    PRIMARY KEY (StudentID)
);

INSERT INTO student (FirstName, LastName, DateOfBirth, EnrollmentYear)
VALUES
('Hassan', 'Raza', '2005-06-18', 2023),
('Sara', 'Malik', '2006-02-11', 2023),
('Hamza', 'Iqbal', '2004-12-27', 2023),
('Noor', 'Farooq', '2005-03-09', 2023),
('Zain', 'Mehmood', '2004-07-21', 2023);