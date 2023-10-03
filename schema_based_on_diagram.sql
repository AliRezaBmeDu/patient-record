--Create patient table
CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    date_of_birth DATE
);

-- Create medical_histories
CREATE TABLE medical_histories (
    id SERIAL PRIMARY KEY,
    admitted_at TIMESTAMP,
    status VARCHAR(255),
    patient_id INT,
    FOREIGN KEY (patient_id) REFERENCES patients(id)
);


-- Create invoices table
CREATE TABLE invoices (
    id SERIAL PRIMARY KEY,
    total_amount DECIMAL(10, 2),
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id INT,
    FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id)
);

--Create treatment table
CREATE TABLE treatment (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    type VARCHAR(255)
);