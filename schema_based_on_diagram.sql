-- Create a database and connect
CREATE DATABASE patient_record;
\c patient_record;

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

-- Create a join table for medical_histories and treatment
CREATE TABLE history_treatment (
    history_id INT,
    treatment_id INT,
    PRIMARY KEY (history_id, treatment_id),
    CONSTRAINT fk_history
        FOREIGN KEY (history_id)
            REFERENCES medical_histories(id),
    CONSTRAINT fk_treatment
        Foreign Key (treatment_id)
            REFERENCES treatment(id)
);
-- Create a join table for invoices and treatment
CREATE TABLE invoice_items(
    id SERIAL PRIMARY KEY,
    unit_price DECIMAL,
    quantity INT,
    total_price DECIMAL,
    invoice_id INT,
    treatment_id INT,
    CONSTRAINT fk_treatment
        Foreign Key (treatment_id) REFERENCES treatment(id),
    CONSTRAINT fk_invoice
        Foreign Key (invoice_id) REFERENCES invoices(id)
);
