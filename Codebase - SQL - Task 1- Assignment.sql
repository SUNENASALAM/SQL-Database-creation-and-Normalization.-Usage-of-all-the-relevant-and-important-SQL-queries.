-- Codebase: Advanced Databases
-- Task1: Part 1: Assumptions made: There is a database for storing the data of the Patients, Appointments, Doctors and Medical records in a hospital. As a first step,
-- Let's create a Database called "Hospital_Data" in order to store the tables Patient_Data, Doctor_Data, Appointments_Data, Medical_records_Data, Department_Data into it.

Create Database Hospital_data; --we could see our hospital data is present in the Database list of the Object Explorer

-- Create a table named "Patient_Data" so as to store the information of patient getting into a hospital

CREATE TABLE Patient_Data (
    Patient_ID INT PRIMARY KEY IDENTITY, -- Considering it is the unique Key Identifier for the table Patient_Data
    Full_Name VARCHAR(100) NOT NULL,
    Address VARCHAR(255) NOT NULL,
    Date_Of_Birth DATE NOT NULL,
    Gender VARCHAR(10) NOT NULL CHECK (Gender IN ('Male', 'Female', 'Other')),
    Insurance VARCHAR(50) NOT NULL,
    Email VARCHAR(100),
    Phone VARCHAR(20),  -- Adjusted to store phone numbers with international codes
    Username VARCHAR(50) NOT NULL,
    Password VARCHAR(50) NOT NULL,
    Age INT, -- New attribute to store patient's age
    Reg_Date DATE DEFAULT GETDATE(),
    Leave_Date DATE,
    UNIQUE (Username),
    Medical_History TEXT, -- Additional column to store patient's medical history
    Emergency_Contact_Name VARCHAR(20),  -- Adjusted to store phone numbers with international codes
	Emergency_Contact VARCHAR(20),  -- Adjusted to store phone numbers with international codes
    Last_Visit_Date DATE, -- Additional column to store the date of the patient's last visit
    Is_Active BIT -- Additional column to indicate whether the patient's account is active (1) or inactive (0)
);

-- Hence our table got created, let's view the column fields of it by using the SELECT query:
SELECT * FROM Patient_Data;

-- Insert a few records into the table so as to use it for the task
 INSERT INTO Patient_Data (Full_Name, Address, Date_Of_Birth, Gender, Insurance, Email, Phone, Username, Password, Age, Reg_Date, Leave_Date, Emergency_Contact_Name, Emergency_Contact, Last_Visit_Date, Is_Active)
VALUES
('Sibil Kakkadath', 'Kakkadath House, Calicut', '1970-01-01', 'Male', 'Life Insurance', 'sibil123@example.com', '+44 7767 555938', 'sibilk', 'P@ssw0rd1', 32, '2023-01-10', NULL, 'Ramakrishnan', '+44 7767 555938', '2023-10-20', 1),
('Pranav Premarajan', 'Mannil House, Thrissur', '1985-09-25', 'Male', 'Life Insurance', 'pranav987@example.com', '+44 7767 555938', 'pranavp', 'Pass@word2', 37, '2022-12-15', '2023-01-15', 'Mohanan', '+44 7767 555938', '2022-12-15', 0),
('Amana Billadakath', 'Billadakath HOuse', '1978-03-10', 'Female', 'Jeevan Safety Insurance', 'amana555@example.com', '+44 7767 555938', 'amanab', 'Secure#Password3', 44, '2021-11-30', '2023-02-28', 'Seetha', '+44 7767 555938', '2023-01-05', 0),
('Lakshmi Mohan', 'Anna Nagar Colony', '1995-11-30', 'Female', 'Aayur Insurance', 'lakshmi8899@example.com', '+44 7767 555938', 'lakshmim', 'Passw0rd4!', 29, '2023-02-20', NULL, 'Bagavan', '+44 7767 555938', '2022-11-10', 1),
('Priyadarsh K T', 'Nagarcoil Veetil, Palakkad', '1965-04-15', 'Male', 'Aarogya Insurance', 'priyadarsh2000@example.com', '+44 7767 555938', 'priyadarshkt', 'Pa$$w0rd5', 41, '2022-03-15', NULL, 'Manoharan', '+44 7767 555938', '2023-03-15', 1),
('Ancy Johnson', 'Manzil House', '1992-12-05', 'Female', 'Life Insurance', 'ancy_5566@example.com', '+44 7767 555938', 'ancyj', 'StrongP@ss6', 29, '2022-08-25', NULL, 'Krishnamoorthy', '+44 7767 555938', '2022-09-25', 1),
('Aneena Salam', 'Cherankodu Veetil', '1975-06-12', 'Female', 'Life Insurance', 'aneena77@example.com', '+44 7767 555938', 'aneenas', 'Passw0rd7@', 46, '2023-03-01', '2023-02-15', 'Janaja Raman', '+44 7767 555938', '2023-02-28', 0),
('Seenath P U', 'Pallikkad North House, Malappuram', '1955-11-20', 'Male', 'Life Insurance', 'seenathp2023@example.com', '+44 7767 555938', 'seenathpu', 'Pa$$w0rd8', 34, '2023-01-15', '2022-12-15', 'Lalitha Antharjanam', '+44 7767 555938', '2022-08-15', 0),
('Abdul Salam Malanku Rowther', 'House No.23, Thrissur', '1983-09-03', 'Male', 'Aarogya Insurance', 'abdulrowther123@example.com', '+44 7767 555938', 'abduls', 'Str0ngPa$$9', 38, '2022-07-20', '2022-12-15', 'Ambili Ram', '+44 7767 555938', '2022-07-10', 0),
('Akshay Sanker', 'Ozhavappadam House', '1958-09-30', 'Male', 'Jeevan Safety Insurance', 'akshay2022@example.com', '+44 7767 555938', 'akshays', 'Passw0rd10#', 28, '2023-03-05', NULL, 'Pooja Krishna', '+44 7767 555938', '2023-04-15', 1),
('Jinu Jude', 'Akshaya Nagar, Ernamkulam', '1979-12-25', 'Male', 'Jeevan Safety Insurance', 'jinu.jude@example.com', '+44 7767 555938', 'jinuj', 'JinuJude11!', 40, '2022-10-20', '2023-01-10', 'Gargi Menon', '+44 7767 555938', '2022-10-20', 0),
('Navnit M S', 'Ram Nagar, Trivandrum', '1990-08-15', 'Male', 'Aarogya Insurance', 'navnit_1234@example.com', '+44 7767 555938', 'navnitms', 'Pa$$w0rd12', 32, '2023-03-05', NULL, 'Anna Biju', '+44 7767 555938', '2023-03-05', 1),
('Aiswarya Mohanan', 'Chullichaala Veetil, Nemmara', '1977-11-28', 'Female', 'Life Insurance', 'aiswarya.m@example.com', '+44 7767 555938', 'aiswaryam', 'AiswaryaM13@', 44, '2023-04-10', NULL, 'Shasheela Nair', '+44 7767 555938', '2023-04-10', 1),
('Suchithra', 'Gargi Manzil, Alappuzha', '1982-05-20', 'Female', 'Life Insurance', 'suchithra2001@example.com', '+44 7767 555938', 'suchithra', 'SecureP@ss14', 39, '2022-09-15', NULL, 'Sharfiya Gafoor', '+44 7767 555938', '2022-09-15', 1),
('Aswathy S', 'Anjanam Veetil, Kollam', '1968-07-03', 'Female', 'Life Insurance', 'aswathy.s@example.com', '+44 7767 555938', 'aswathys', 'Passw0rd15$', 35, '2022-12-05', '2023-02-28', 'Ummul Bisher', '+44 7767 555938', '2022-12-05', 0);

--To view the table, whether the data have been inserted as per the details I have given, using the select statement
SELECT * FROM Patient_Data;

--Since, we should infill the medical history of the patients in the table, can't leave them blank. Need to do like this
UPDATE Patient_Data
SET Medical_History = 
    CASE 
        WHEN Full_Name = 'Sibil Kakkadath' THEN 'Diagnosed with hypertension and taking medication regularly. No major surgeries.'
        WHEN Full_Name = 'Pranav Premarajan' THEN 'History of asthma, occasional allergic reactions to certain foods. No surgeries.'
        WHEN Full_Name = 'Amana Billadakath' THEN 'Diagnosed with diabetes, managed with insulin therapy. Underwent appendectomy in 2010.'
        WHEN Full_Name = 'Lakshmi Mohan' THEN 'History of migraines, occasional episodes. No major surgeries.'
        WHEN Full_Name = 'Priyadarsh K T' THEN 'No significant medical history. No surgeries.'
        WHEN Full_Name = 'Ancy Johnson' THEN 'Diagnosed with celiac disease, follows gluten-free diet. No surgeries.'
        WHEN Full_Name = 'Aneena Salam' THEN 'History of hypertension, controlled with lifestyle changes. No major surgeries.'
        WHEN Full_Name = 'Seenath P U' THEN 'Diagnosed with rheumatoid arthritis, managed with medications. No surgeries.'
        WHEN Full_Name = 'Abdul Salam Malanku Rowther' THEN 'History of heart disease, underwent angioplasty in 2015.'
        WHEN Full_Name = 'Akshay Sanker' THEN 'No significant medical history. No surgeries.'
        WHEN Full_Name = 'Jinu Jude' THEN 'Diagnosed with asthma, uses inhalers as needed. No major surgeries.'
        WHEN Full_Name = 'Navnit M S' THEN 'No significant medical history. No surgeries.'
        WHEN Full_Name = 'Aiswarya Mohanan' THEN 'History of thyroid disorder, managed with medications. Underwent cholecystectomy in 2018.'
        WHEN Full_Name = 'Suchithra' THEN 'Diagnosed with type 2 diabetes, controlled with diet and exercise. No major surgeries.'
        WHEN Full_Name = 'Aswathy S' THEN 'No significant medical history. No surgeries.'
    END;

	--Now to view the table, check the data
SELECT * FROM Patient_Data;

-- Now, let's create another table called "Doctor_data" for storing Doctor information in it
CREATE TABLE Doctor_Data (
    Doctor_ID VARCHAR(10) PRIMARY KEY,
    Full_Name VARCHAR(100) NOT NULL,
    Gender VARCHAR(10) NOT NULL CHECK (Gender IN ('Male', 'Female', 'Other')), -- Contains three types of values --> Categorical
    Joined_In DATE,
    Qualification VARCHAR(100),
    Total_Exp_Attained INT CHECK (Total_Exp_Attained >= 0),
    Has_Separate_Clinic VARCHAR(3) CHECK (Has_Separate_Clinic IN ('Yes', 'No')), -- Contains two values --> Categorical
    Consultation_Fee DECIMAL(10, 2),
    Contact_Phone VARCHAR(20),
    Email_Address VARCHAR(100),
    Clinic_Address VARCHAR(255),
    IsActive BIT -- Gives either 1 or 0 with respective to the active stage of him in the hospital
);

-- To view the structure of the table
SELECT * FROM Doctor_Data;

-- Inserting 15 rows into the table Doctor_Data so as to us it for the tasks. 
-- While inserting, added a new statement in the first column of all the data fields so as to get the doctor ID a unique value combining the first two letter 
-- of the doctors name and the rest three any three unique integer values.

INSERT INTO Doctor_Data (Doctor_ID, Full_Name, Gender, Joined_In, Qualification, Total_Exp_Attained, Has_Separate_Clinic, Consultation_Fee, Contact_Phone, Email_Address, Clinic_Address, IsActive)
VALUES
('Sa207', 'Sanam Teresa', 'Female', '2018-05-15', 'MD General Medicine', 10, 'Yes', 100.00, '+44 7757 555938', 'sanam.teresa@example.com', 'House No. 123, City', 1),
('Sa379', 'Sarath Chandran', 'Male', '2015-09-10', 'MD Oncology', 8, 'No', 80.00, '+44 7757 555938', 'sarath.chandran@example.com', 'House No. 456 Elm St, Town', 1),
('Al332', 'Albin Joy', 'Male', '2014-07-20', 'MD Cardiology', 15, 'Yes', 120.00, '+44 7757 555938', 'albin.joy@example.com', 'House No. 789 Oak St, Village', 1),
('Pr684', 'Prabitha Kumari', 'Female', '2019-03-12', 'MD Dermatology', 7, 'No', 90.00, '+44 7757 555938', 'prabitha.kumari@example.com', 'House No. 321 Pine St, County', 1),
('Su078', 'Sumesh Ram', 'Male', '2017-01-25', 'MD Orthopedics', 12, 'Yes', 110.00, '+44 7757 555938', 'sumesh.ram@example.com', 'House No. 555 Cedar St, District', 1),
('Ra546', 'Ramesh Sasi', 'Male', '2016-08-05', 'MD Psychiatry', 9, 'No', 85.00, '+44 7757 555938', 'ramesh.sasi@example.com', 'House No. 777 Maple St, Borough', 1),
('Sh165', 'Shanib Raheem', 'Male', '2014-12-30', 'MD Neurology', 14, 'Yes', 130.00, '+44 7757 555938', 'shanib.raheem@example.com', 'House No. 888 Walnut St, Precinct', 1),
('Di621', 'Dilshad Firoz', 'Male', '2020-02-18', 'MD Gynecology', 4, 'No', 75.00, '+44 7757 555938', 'dilshad.firoz@example.com', 'House No. 999 Pine St, Sector', 1),
('An629', 'Anasul K P', 'Male', '2013-06-08', 'MD Oncology', 20, 'Yes', 140.00, '+44 7757 555938', 'anasul.kp@example.com', 'House No. 111 Cedar St, Block', 1),
('Sh384', 'Shamil Haaris', 'Male', '2018-11-03', 'MD Ophthalmology', 5, 'No', 95.00, '+44 7757 555938', 'shamil.haaris@example.com', 'House No. 222 Maple St, Zone', 1),
('Ar401', 'Arun Sabu', 'Male', '2016-04-20', 'MD ENT', 18, 'Yes', 115.00, '+44 7757 555938', 'arun.sabu@example.com', 'House No. 333 Oak St, Division', 1),
('Li446', 'Lijoy K', 'Male', '2019-09-15', 'MD Oncology', 6, 'No', 80.00, '+44 7757 555938', 'lijoy.k@example.com', 'House No. 444 Cedar St, Sector', 1),
('Ba948', 'Balakrishnan P K', 'Male', '2015-11-10', 'MD Cardiology', 16, 'Yes', 125.00, '+44 7757 555938', 'balakrishnan.pk@example.com', 'House No. 555 Elm St, District', 1),
('Su486', 'Subrahmanian Nair', 'Male', '2017-07-05', 'MD Dermatology', 10, 'No', 90.00, '+44 7757 555938', 'subrahmanian.nair@example.com', 'House No. 666 Walnut St, Zone', 1),
('Mo060', 'Moideenkutty Aliyar', 'Male', '2020-04-01', 'MD Orthopedics', 8, 'Yes', 110.00, '+44 7757 555938', 'moideenkutty.aliyar@example.com', 'House No. 777 Birch St, Block', 1);

-- to check whether the rows have been filled accordingly or not, lets query the table

SELECT * FROM Doctor_Data; -- Dtaa have been successfully filled into the table

-- Now, let's create another table for storing the Appointment details of the patients.
CREATE TABLE Appointment_Data (
    Appt_ID INT PRIMARY KEY IDENTITY,
    Patient_ID INT,
    Doctor_ID VARCHAR(10),
    Appt_Date DATE NOT NULL,
    Dept_Name VARCHAR(50),
    Appt_Status VARCHAR(20) DEFAULT 'Pending' CHECK (Appt_Status IN ( 'Pending', 'Cancelled', 'Completed')),
    Feedback TEXT,
    Scheduled_By VARCHAR(100), -- Additional column to store who scheduled the appointment
    Room_No INT -- Additional column for room number
);

--- To view the table we have created
SELECT * FROM Appointment_Data;

INSERT INTO Appointment_Data (Patient_ID, Doctor_ID, Appt_Date, Dept_Name, Appt_Status, Feedback, Scheduled_By, Room_No)
VALUES
(9, 'Al332', '2024-07-01', 'General', 'Pending', 'Excellent service and care provided.', 'Anupama Parameswaran', 101),
(13, 'An629', '2024-08-02', 'Oncology', 'Pending', 'Doctor was very attentive and helpful.', 'Arathi Menon', 102),
(10, 'Ar401', '2024-06-03', 'Cardiology', 'Cancelled', 'Smooth appointment process and friendly staff.', 'Sukumaran K R', 103),
(3, 'Ba948', '2024-09-04', 'Orthopedics', 'Completed', 'Received prompt attention and thorough examination.', 'Susmitha Das', 104),
(6, 'Di621', '2024-07-05', 'Dermatology', 'Pending', 'Doctor explained everything clearly and provided effective treatment.', 'Manmohanan Nair', 105),
(7, 'Li446', '2024-07-06', 'Oncology', 'Pending', 'Satisfied with the consultation and medical advice.', 'Soman Das', 106),
(15, 'Mo060', '2024-07-07', 'Psychiatry', 'Pending', 'Great experience, felt listened to and understood.', 'Mayilvahanam', 107),
(11, 'Pr684', '2024-08-08', 'Oncology', 'Cancelled', 'Compassionate care and detailed explanation of treatment options.', 'Rajeswaran K M', 108),
(4, 'Ra546', '2024-07-09', 'Gynecology', 'Pending', 'Professional and respectful treatment by the doctor.', 'Rahul Eswar', 109),
(12, 'Sa207', '2024-05-10', 'Ophthalmology', 'Completed', 'Highly recommend the doctor for eye care needs.', 'Anand Raj', 110),
(2, 'Sa379', '2024-06-11', 'Oncology', 'Cancelled', 'Efficient appointment and helpful guidance from the doctor.', 'Prayagara Pratap', 111),
(5, 'Sh165', '2024-07-12', 'Pediatrics', 'Pending', 'Child-friendly environment and skilled pediatrician.', 'Manasa Mukundan', 112),
(8, 'Sh384', '2024-08-13', 'Cardiology', 'Completed', 'Doctor took time to address all concerns and provided useful advice.', 'Thejaswinin P', 113),
(1, 'Su078', '2024-09-14', 'Orthopedics', 'Cancelled', 'Received appropriate treatment and care.', 'Roshan James', 114),
(14, 'Su486', '2024-06-15', 'Dermatology', 'Pending', 'Effective treatment plan and friendly staff.', 'Feneeshya Elizabeth', 115);

--- To check whether the values have been inserted into the table we have created
SELECT * FROM Appointment_Data;

-- Creating another table to fill out the medical records of the patients as requested in the task
CREATE TABLE Medical_Records_Data (
    Record_ID INT PRIMARY KEY IDENTITY,
    Patient_ID INT,
    Appt_ID INT,
    Diagnosis TEXT,
    Medication VARCHAR(100),
    Medication_Prescribed_Date DATE,
    Allergies TEXT,
    Doctor_ID VARCHAR(10),
    Medical_Test_Results TEXT,
    Surgery_Performed BIT,
    FOREIGN KEY (Patient_ID) REFERENCES Patient_Data(Patient_ID),
    FOREIGN KEY (Appt_ID) REFERENCES Appointment_Data(Appt_ID),
    FOREIGN KEY (Doctor_ID) REFERENCES Doctor_Data(Doctor_ID)
);

-- Let's review the table in order to check the column structure of it
SELECT * FROM Medical_Records_Data;

-- Insert a few rows into the table so as to continue with the tasks
INSERT INTO Medical_Records_Data (Patient_ID, Appt_ID, Diagnosis, Medication, Medication_Prescribed_Date, Allergies, Doctor_ID, Medical_Test_Results, Surgery_Performed)
VALUES
(1, 1, 'Patient presented with elevated blood pressure and occasional headaches. Further evaluation revealed hypertension.', 'Lisinopril, Amlodipine', '2023-05-01', 'Penicillin allergy',  'Sa207', 'Blood pressure within normal limits', 0),
(2, 2, 'Patient complained of persistent cough, shortness of breath, and chest discomfort. Diagnosis confirmed bronchitis.', 'Azithromycin, Prednisone', '2023-06-02', 'None', 'Pr684', 'Negative for pneumonia', 0),
(3, 3, 'Patient experienced severe pain and swelling in the arm after a fall. X-ray revealed a fractured arm.', 'Ibuprofen, Acetaminophen', '2023-07-03', 'None', 'Ba948', 'X-ray confirmed fracture', 1),
(4, 4, 'Patient reported recurrent severe headaches associated with nausea and sensitivity to light. Diagnosis concluded migraine.', 'Sumatriptan, Naproxen', '2023-08-04', 'Aspirin allergy', 'Ra546', 'Relief from symptoms after medication', 0),
(5, 5, 'Patient presented with persistent acne lesions on the face. Diagnosis confirmed acne vulgaris.', 'Tretinoin, Benzoyl peroxide', '2023-09-05', 'Sulfa allergy', 'Di621', 'Improvement noted after treatment', 0),
(6, 6, 'Patient complained of abdominal pain, nausea, and diarrhea. Diagnosis revealed gastroenteritis.', 'Ondansetron, Loperamide', '2023-10-06', 'None',  'Li446', 'Stool sample results pending', 0),
(7, 7, 'Patient reported persistent feelings of worry, nervousness, and restlessness. Diagnosis confirmed anxiety disorder.', 'Sertraline, Lorazepam', '2023-11-07', 'None',  'Mo060', 'Improved mood reported by patient', 0),
(8, 8, 'Patient presented with missed menstrual periods and positive pregnancy test. Diagnosis confirmed pregnancy.', 'Prenatal vitamins, Folic acid', '2023-12-08', 'None','Ar401', 'Ultrasound scheduled for next visit', 0),
(9, 9, 'Patient exhibited frequent urination, increased thirst, and unexplained weight loss. Diagnosis revealed diabetes mellitus.', 'Metformin, Insulin', '2024-01-09', 'None',  'Al332', 'Blood glucose levels monitored regularly', 0),
(10, 10, 'Patient complained of nasal congestion, facial pain, and headache. Diagnosis concluded sinusitis.', 'Amoxicillin, Pseudoephedrine', '2024-02-10', 'None', 'Sa379', 'Symptoms improving with medication', 0),
(11, 11, 'Patient presented with redness, itching, and discharge in the eyes. Diagnosis confirmed conjunctivitis.', 'Erythromycin ointment, Artificial tears', '2024-03-11', 'None', 'Sh165', 'Eye irritation resolved after treatment', 0),
(12, 12, 'Patient exhibited fatigue, weight gain, and dry skin. Diagnosis revealed hypothyroidism.', 'Levothyroxine, Liothyronine', '2024-04-12', 'None', 'Sh384', 'Thyroid hormone levels within normal range', 0),
(13, 13, 'Patient experienced wheezing, coughing, and shortness of breath. Diagnosis concluded asthma.', 'Albuterol inhaler, Fluticasone inhaler', '2024-05-13', 'None','An629', 'Peak flow readings improving', 0),
(14, 14, 'Patient reported joint pain and stiffness, especially after waking up. Diagnosis confirmed osteoarthritis.', 'Naproxen, Acetaminophen', '2024-06-14', 'None',  'Su078', 'X-ray confirms joint degeneration', 0),
(15, 15, 'Patient exhibited persistent sadness, loss of interest, and fatigue. Diagnosis confirmed depression.', 'Escitalopram, Bupropion', '2024-07-15', 'None',  'Su486', 'Patient mood improving', 0);

--check whether the data have been filled into the table rightly:

SELECT * FROM Medical_Records_Data;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Let's create a database diagram with these four tables we have
--Since we have created a database diagram, let's add some stored procedures and review its usage.
-- Consider the table Patient_Data
SELECT * FROM Patient_Data;

UPDATE Patient_Data
SET Age = 26, Phone = '+44 7786 999546', Last_Visit_Date = '2024-10-22'
WHERE Patient_ID = 4;

UPDATE Patient_Data
SET Age = 57, Phone = '+44 7786 945678', Leave_Date = '2024-09-27', Emergency_Contact = '+44 7769 783645', Last_Visit_Date = '2024-09-02'
WHERE Patient_ID = 5;

UPDATE Patient_Data
SET Age = 66, Gender = 'Female', Phone = '+44 7706 999546',Leave_Date = '2024-10-08', Emergency_Contact = '+44 7469 793645',  Last_Visit_Date = '2024-09-22'
WHERE Patient_ID = 8;

UPDATE Patient_Data
SET Age = 26, Phone = '+44 7786 999546',Leave_Date = '2024-10-18', Emergency_Contact = '+44 7469 790645', Last_Visit_Date = '2024-09-22'
WHERE Patient_ID = 10;

UPDATE Patient_Data
SET Age = 42, Phone = '+44 7786 497256',Emergency_Contact = '+44 7449 790645', Last_Visit_Date = '2024-08-02'
WHERE Patient_ID = 11;

UPDATE Patient_Data
SET Age = 31, Phone = '+44 7786 999246', Emergency_Contact = '+44 7459 790645',Last_Visit_Date = '2024-07-22'
WHERE Patient_ID = 12;

UPDATE Patient_Data
SET Age = 53, Phone = '+44 7786 996546', Emergency_Contact = '+44 7499 790645',Last_Visit_Date = '2024-09-12'
WHERE Patient_ID = 15;

UPDATE Patient_Data
SET Age = 26, Phone = '+44 7786 999246', Emergency_Contact = '+44 7469 730645', Last_Visit_Date = '2024-10-29'
WHERE Patient_ID = 16;

-- Check whether all rows have been updated or not
SELECT * FROM Patient_Data; -- Success!

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Stored Procedure to add a new record of the patient into the table Patient_Data : 
-- This will be really helpful for the hospital to easily add different patient records.
CREATE PROCEDURE Add_Patient_Data
(
    @Full_Name VARCHAR(100),
    @Address VARCHAR(255),
    @Date_Of_Birth DATE,
    @Gender VARCHAR(10),
    @Insurance VARCHAR(50),
    @Email VARCHAR(100),
    @Phone VARCHAR(20),
    @Username VARCHAR(50),
    @Password VARCHAR(50),
    @Age INT,
    @Reg_Date DATE,
    @Leave_Date DATE,
    @Medical_History TEXT,
    @Emergency_Contact_Name VARCHAR(20),
    @Emergency_Contact VARCHAR(20),
    @Last_Visit_Date DATE,
    @Is_Active BIT
)
AS
BEGIN
    INSERT INTO Patient_Data (Full_Name, Address, Date_Of_Birth, Gender, Insurance, Email, Phone, Username, Password, Age, Reg_Date, Leave_Date, Medical_History, Emergency_Contact_Name, Emergency_Contact, Last_Visit_Date, Is_Active)
    VALUES (@Full_Name, @Address, @Date_Of_Birth, @Gender, @Insurance, @Email, @Phone, @Username, @Password, @Age, @Reg_Date, @Leave_Date, @Medical_History, @Emergency_Contact_Name, @Emergency_Contact, @Last_Visit_Date, @Is_Active)
END

-- To execute the stored procedure, i.e., if we want to add a new patient record into the table Patient_Data: Let's query it like this
EXEC Add_Patient
	'Sunena Salam',
    'M Y Manzil, Palakkad',
    '1998-08-29', 
    'Female', 
    'Life Insurance',
    'sune.sala@example.com',
    '+44 6676 888904',
    'sunenasalam',
    'sunu123',
    25,
    '2024-04-03', -- so as to get the current date since that will be date which the patient have been registered
    '2023-05-02',
    'No significant medical history',
    'Abdul Salam', 
    '+44 7767 555938',
    NULL,
    1;

--View the table so as to check whether the new row have been added or not!
SELECT * FROM Patient_Data;

-- Let's create another stored procedure to update the already existing patient record in the database
	CREATE PROCEDURE Update_Patient_Data_
(
    @Patient_ID INT,
    @Full_Name VARCHAR(100),
    @Address VARCHAR(255),
    @Date_Of_Birth DATE,
    @Gender VARCHAR(10),
    @Insurance VARCHAR(50),
    @Email VARCHAR(100),
    @Phone VARCHAR(20),
    @Username VARCHAR(50),
    @Password VARCHAR(50),
    @Age INT,
	@Reg_Date DATE,
    @Leave_Date DATE,
    @Medical_History TEXT,
    @Emergency_Contact_Name VARCHAR(20),
    @Emergency_Contact VARCHAR(20),
    @Last_Visit_Date DATE,
    @Is_Active BIT
)
AS
BEGIN
    UPDATE Patient_Data
    SET Full_Name = @Full_Name,
        Address = @Address,
        Date_Of_Birth = @Date_Of_Birth,
        Gender = @Gender,
        Insurance = @Insurance,
        Email = @Email,
        Phone = @Phone,
        Username = @Username,
        Password = @Password,
        Age = @Age,
		Reg_Date = @Reg_Date,
        Leave_Date = @Leave_Date,
        Medical_History = @Medical_History,
        Emergency_Contact_Name = @Emergency_Contact_Name,
        Emergency_Contact = @Emergency_Contact,
        Last_Visit_Date = @Last_Visit_Date,
        Is_Active = @Is_Active
    WHERE Patient_ID = @Patient_ID
END

-- Consider we want to update the Patient named Sibil Kakkadath's 
	--> Age from 32 to 54 since it has been wrongly marked in the dataset. 
	--> Also let's assume the leave date to be  '2024-09-10' from NULL,
	--> Last_Visit_Date from 2023-10-20 to '2024-10-20'
EXEC Update_Patient_Data_
    @Patient_ID = 1,
    @Full_Name = 'Sibil Kakkadath',
    @Address = 'Kakkadath House, Calicut',
    @Date_Of_Birth = '1970-01-01',
    @Gender = 'Male',
    @Insurance = 'Life Insurance',
    @Email = 'sibil123@example.com',
    @Phone = '+44 7767 555938',
    @Username = 'sibilk',
    @Password = 'P@ssw0rd1',
    @Age = 54,
	@Reg_Date = '2023-01-10',
    @Leave_Date = '2024-09-10',
    @Medical_History = 'Diagnosed with hypertension and taking medication regularly. No major surgeries.',
    @Emergency_Contact_Name = 'Ramakrishnan',
    @Emergency_Contact = '+44 7767 555938',
    @Last_Visit_Date = '2024-10-20',
    @Is_Active = 1;

-- Consider we want to update the Patient named Pranav Premarajan 
	--> Age from 32 to 54 since it has been wrongly marked in the dataset. 
	--> Also let's assume the Phone number to be +44 7767 987678,
	--> Leave date from '2023-01-15' to '2024-09-20'
	--> Last_Visit_Date from 2022-12-15 to '2024-10-15
	--> Emergency Contact to  '+44 7767 555945'
	--> Is_Active from 0 to 1

EXEC Update_Patient_Data_
    @Patient_ID = 2,
    @Full_Name = 'Pranav Premarajan',
    @Address = 'Mannil House, Thrissur',
    @Date_Of_Birth = '1985-09-25',
    @Gender = 'Male',
    @Insurance = 'Life Insurance',
    @Email = 'pranav987@example.com',
    @Phone = '+44 7767 987678',
    @Username = 'pranavp',
    @Password = 'Pass@word2',
    @Age = 36,
	@Reg_Date = '2022-12-15',
    @Leave_Date = '2024-09-20',
    @Medical_History = 'History of asthma, occasional allergic reactions to certain foods. No surgeries.',
    @Emergency_Contact_Name = 'Mohanan',
    @Emergency_Contact = '+44 7767 555945',
    @Last_Visit_Date = '2024-10-15',
    @Is_Active = 1;

	--let's check whether the data of the patient have been updated or not

	SELECT * FROM Patient_Data; -- the updated row is visible!

-- Consider the Doctor_Data table: 
-- Let's create a stored procedure to delete the already existing doctor data in the database
-- This stored procedure allows you to delete a doctor from the doctor_data table based on the Doctor_ID.

CREATE PROCEDURE Delete_Doctor_Data
    @Doctor_ID VARCHAR(10)
AS
BEGIN
    DELETE FROM Doctor_Data
    WHERE Doctor_ID = @Doctor_ID;
END;

-- Lets insert a new row in Doctor_Data so as to delete it for the stored procedure execution

INSERT INTO Doctor_Data (Doctor_ID, Full_Name, Gender, Joined_In, Qualification, Total_Exp_Attained, Has_Separate_Clinic, Consultation_Fee, Contact_Phone, Email_Address, Clinic_Address, IsActive)
VALUES
('Sh277', 'Shineesha Rahman', 'Female', '2017-05-15', 'MD General Medicine', 10, 'Yes', 150.00, '+44 7798 555838', 'shineesha.rahman@example.com', '123 apt St, City', 1);

--checking the existence of the row in Doctor_Data table
SELECT * FROM Doctor_Data; -- Row is successfully added

-- To call the stored procedure, let's assume that we want to delete a doctor details whose Doctor_ID is "su486"
EXEC Delete_Doctor_Details @Doctor_ID = 'Sh277';

-- checking whether the row got deleted or not from the table Doctor_Data
SELECT * FROM Doctor_Data; -- Row is successfully deleted

-- Now, let's create another stored procedure to retrieve information about a doctor from the doctor_Data table based on the Doctor_ID.

CREATE PROCEDURE Get_DoctorBy_ID_Data
    @Doctor_ID VARCHAR(10)
AS
BEGIN
    SELECT *
    FROM Doctor_Data
    WHERE Doctor_ID = @Doctor_ID;
END;

-- Let's check the readability by finding the doctor details having Doctor_ID = "Ar401"
EXEC Get_DoctorBy_ID @Doctor_ID = 'Ar401'; -- prints only the row having the Doctor_ID

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Now, let's create user-defined functions in the table Appointment_Data
-- This function calculates the wait time until an appointment based on the appointment date and the current date.
CREATE FUNCTION dbo.Calculate_Wait_Time_Data
(
    @AppointmentDate DATE
)
RETURNS INT
AS
BEGIN
    DECLARE @WaitTime INT
    SET @WaitTime = DATEDIFF(DAY, GETDATE(), @AppointmentDate)
    RETURN @WaitTime
END;

-- To execute the function

SELECT dbo.Calculate_Wait_Time_Data(Appt_Date) AS WaitTime 
FROM Appointment_Data; -- Hence we get the wait time according to the date of the Appt_Date column.

-- Let's create another user-defined function so as to  retrieve the name of the person who scheduled the appointment.
CREATE FUNCTION dbo.Get_Scheduled_By_Name_Data
(
    @AppointmentID INT
)
RETURNS VARCHAR(100)
AS
BEGIN
    DECLARE @ScheduledBy VARCHAR(100)
    SELECT @ScheduledBy = Scheduled_By
    FROM Appointment_Data
    WHERE Appt_ID = @AppointmentID
    RETURN @ScheduledBy
END;

-- Let'r retrive the name of the person scheduled the appointment for the patient_ID = 4

SELECT dbo.Get_Scheduled_By_Name(Appt_ID) AS ScheduledBy 
FROM Appointment_Data
WHERE Patient_ID = 4; -- Got Rahul Eswar as the result since he scheduled the appointment for the patient whose ID is 4.

-- Now, consider the table Medical_Records_Data:
-- Let's create a user defined function so as to retrieve the latest medication prescribed for a given patient based on the patient's ID
CREATE FUNCTION dbo.Get_Latest_Medication_Data (@PatientID INT)
RETURNS VARCHAR(100)
AS
BEGIN
    DECLARE @LatestMedication VARCHAR(100)
    SELECT TOP 1 @LatestMedication = Medication
    FROM Medical_Records_Data
    WHERE Patient_ID = @PatientID
    ORDER BY Medication_Prescribed_Date DESC;
    RETURN @LatestMedication;
END;

-- Now, lets see what all are the latest medication prescribed for the patient whose ID is 6

SELECT dbo.Get_Latest_Medication(6) AS LatestMedication; -- results the medicine details accordingly, according to the data provided, the Patient whose ID is 6 have got the Medicine Prescribed as "Ondansetron, Loperamide"

-- Nextly, let's define a Function to retrieve the latest medication prescribed date for a given patient
CREATE FUNCTION dbo.Get_Latest_Med_Date
(
    @PatientID INT
)
RETURNS DATE
AS
BEGIN
    DECLARE @LatestDate DATE;

    SELECT TOP 1 @LatestDate = Medication_Prescribed_Date
    FROM Medical_Records_Data
    WHERE Patient_ID = @PatientID
    ORDER BY Medication_Prescribed_Date DESC;

    RETURN @LatestDate;
END;

-- suppose we want to get the latest medication prescribed date for the patient whose patient ID is 8,
-- Example of executing the GetLatestMedicationDateFunction
DECLARE @PatientID INT = 8; 
SELECT dbo.Get_Latest_Medication_Date(@PatientID) AS LatestMedicationDate;
GO -- returns the date column value accordingly.The date we got is 2023-12-08, which is true according to the dataset

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Usage of TRIGGER:
-- Trigger to update patient status to "Pending" when a new appointment is inserted
CREATE TRIGGER Update_Patient_Status_On_New_Appointment
ON Appointment_Data
AFTER INSERT
AS
BEGIN
    -- Update the status of the patient associated with the new appointment to "Pending"
    UPDATE Appointment_Data
    SET Appt_Status = 'Pending'
    WHERE Patient_ID IN (SELECT Patient_ID FROM inserted);
END;

-- To check the usage of the trigger
-- Inserting test data 
INSERT INTO Appointment_Data(Patient_ID, Appt_Date)
VALUES (26, GETDATE());

-- Check patient status after the insertion
SELECT * FROM Appointment_Data WHERE Patient_ID = 26; -- Hence we could see that the appointment status have been changed to Pending as mentioned! 
-- Thus, confirm that the query is working successfully

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Usage of Views
-- Now, let's create four views for the four tables and use the queries and subqueries into the views so as to analyse the usage of it.
-- View for Patient_Data
CREATE VIEW Patient_Data_View AS
SELECT *
FROM Patient_Data;

-- View for Doctor_Data
CREATE VIEW Doctor_Data_View AS
SELECT *
FROM Doctor_Data;

-- View for Appointment_Data
CREATE VIEW Appointment_Data_View AS
SELECT *
FROM Appointment_Data;

-- View for Medical_Records_Data
CREATE VIEW Medical_Records_Data_View AS
SELECT *
FROM Medical_Records_Data;

--Now, using the views, let's create some analytic situations so as to use the table using joins and subqueries

-- Suppose, we need to find all the appointments along with patient and doctor information, the following query helps -->
SELECT A.*, P.Full_Name AS Patient_Name, D.Full_Name AS Doctor_Name
FROM Appointment_Data_View A
JOIN Patient_Data_View P ON A.Patient_ID = P.Patient_ID
JOIN Doctor_Data_View D ON A.Doctor_ID = D.Doctor_ID;

-- Suppose we want to list all the patients along with their appointment details, the following query helps -->
SELECT P.*, A.*
FROM Patient_Data_View P
LEFT JOIN Appointment_Data_View A ON P.Patient_ID = A.Patient_ID;

-- Suppose we want to get the total count of appointments for each doctor, the following query helps -->
SELECT D.Full_Name AS Doctor_Name, COUNT(A.Appt_ID) AS Total_Appointments
FROM Doctor_Data_View D
LEFT JOIN Appointment_Data_View A ON D.Doctor_ID = A.Doctor_ID
GROUP BY D.Full_Name;

-- Suppose we want to find all the appointments where patients have a  'Life Insurance' as their insurance company, the following query helps -->
SELECT A.*, P.Full_Name AS Patient_Name, P.Insurance
FROM Appointment_Data_View A
JOIN Patient_Data_View P ON A.Patient_ID = P.Patient_ID
WHERE P.Insurance = 'Life Insurance';

-- Suppose we want to retrieve information about the patients who have appointments last month, the following query helps
SELECT P.*
FROM Patient_Data_View P
JOIN Appointment_Data_View A ON P.Patient_ID = A.Patient_ID
WHERE A.Appt_Date >= DATEADD(MONTH, -1, GETDATE());

-- Suppose we want to find all the appointments were surgery were performed along with the doctor details, the following query helps -->
SELECT A.*, D.*
FROM Appointment_Data_View A
JOIN Doctor_View D ON A.Doctor_ID = D.Doctor_ID
JOIN Medical_Records_Data_View M ON A.Appt_ID = M.Appt_ID
WHERE M.Surgery_Performed = 1;

-- Suppose we want to list all the patients who had no appointments yet, the following query helps -->
SELECT P.*
FROM Patient_Data_View P
LEFT JOIN Appointment_Data_View A ON P.Patient_ID = A.Patient_ID
WHERE A.Patient_ID IS NULL;

-- Suppose we want to retrive all the appointments along with the department information, the following query helps -->
SELECT A.*, A.Dept_Name
FROM Appointment_Data_View A
JOIN Doctor_Data_View D ON A.Doctor_ID = D.Doctor_ID;

-- Suppose we want to find the average age of the patient who visited each department, the folllowing query helps -->
SELECT A.Dept_Name, AVG(P.Age) AS Average_Age
FROM Appointment_Data_View A
JOIN Doctor_Data_View D ON A.Doctor_ID = D.Doctor_ID
JOIN Patient_Data_View P ON A.Patient_ID = P.Patient_ID
GROUP BY A.Dept_Name;

-- Suppose we want to list all patients who have allergies and their curresponding appointments, the following query helps -->
SELECT P.*, A.*
FROM Patient_Data_View P
JOIN Medical_Records_Data_View M ON P.Patient_ID = M.Patient_ID
JOIN Appointment_Data_View A ON M.Appt_ID = A.Appt_ID
WHERE M.Allergies IS NOT NULL;

-- Suppose we want to retrieve all the appointments scheduled for a specific doctor "Balakrishnan P K" along with patient details, the following query helps -->
SELECT A.*, P.*
FROM Appointment_Data_View A
JOIN Patient_Data_View P ON A.Patient_ID = P.Patient_ID
WHERE A.Doctor_ID = 'Ba948';

-- Suppose we want to find the doctor who has the highest number of appointments, the following query helps -->
SELECT TOP 1 D.Full_Name AS Doctor_Name, COUNT(*) AS Total_Appointments
FROM Appointment_Data_View A
JOIN Doctor_Data_View D ON A.Doctor_ID = D.Doctor_ID
GROUP BY D.Full_Name
ORDER BY COUNT(*) DESC;


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Now, let's focus on Normalizing the table - using 3NF
-- Since we have already created the tables and the tables already exist in the database Hospital_data, if we want to apply normalization to them, you wouldn't recreate the tables from scratch. 
-- Instead, we can alter the existing tables to ensure they conform to the desired normalization level.

-- Let's consider the first table, Patient_Data 
-- Let's  demonstrate splitting multivalued attributes (Emergency Contact Name and Emergency Contact) from the Patient table into a separate table (Emergency_Contact) to achieve a higher level of normalization. 
-- Example: Normalize Patient table by moving Emergency Contact details to a separate table

-- Create Emergency Contact table
CREATE TABLE Emergency_Contact (
    Patient_ID INT PRIMARY KEY,
    Emergency_Contact_Name VARCHAR(20),
    Emergency_Contact VARCHAR(20),
    FOREIGN KEY (Patient_ID) REFERENCES Patient_Data(Patient_ID)
);

-- Remove Emergency Contact columns from Patient table
ALTER TABLE Patient_Data
DROP COLUMN Emergency_Contact_Name;
ALTER TABLE Patient_Data
DROP COLUMN Emergency_Contact;

-- View the Patient_Data table again

SELECT * FROM Patient_Data; -- The two columns Emergency_Contact and Emergency_Contact_Name have been removed successfully.

-- View the newly created Emergency_Contact Table

SELECT * FROM Emergency_Contact;

-- Let's insert some values into the emergency contact table.
INSERT INTO Emergency_Contact (Patient_ID, Emergency_Contact_Name, Emergency_Contact)
VALUES
(1, 'Ramakrishnan', '+44 7767 555938'),
(2, 'Mohanan', '+44 7767 555938'),
(3, 'Seetha', '+44 7767 555938'),
(4, 'Bagavan', '+44 7767 555938'),
(5, 'Manoharan', '+44 7767 555938'),
(6, 'Krishnamoorthy', '+44 7767 555938'),
(7, 'Janaja Raman', '+44 7767 555938'),
(8, 'Lalitha Antharjanam', '+44 7767 555938'),
(9, 'Ambili Ram', '+44 7767 555938'),
(10, 'Pooja Krishna', '+44 7767 555938'),
(11, 'Gargi Menon', '+44 7767 555938'),
(12, 'Anna Biju', '+44 7767 555938'),
(13, 'Shasheela Nair', '+44 7767 555938'),
(14, 'Sharfiya Gafoor', '+44 7767 555938'),
(15, 'Ummul Bisher', '+44 7767 555938');

--Checking whether the values have been successfully inserted or not
SELECT * FROM Emergency_Contact;


-- Overall, all the tables have been carefully analyzed and normalized to ensure data integrity and minimize redundancy. They are in compliance with the principles of normalization up to 3NF.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Task1: Part2: 

-- Question: 2: Add the constraint to check that the appointment date is not in the past.
ALTER TABLE Appointment_Data
ADD CONSTRAINT CHK_Appointment_Date_Not_In_Past 
CHECK (Appt_Date >= GETDATE()); --to ensure that the appointment date is not in the past looks correct. 
-- It uses the CHECK constraint to enforce the condition that the Appt_Date column must be greater than or equal to the current date and time, 
-- as provided by the GETDATE() function.

-- There is a message indicating that there is existing data in the Appointment_Data table where the Appt_Date is in the past, which conflicts with the newly added check constraint. 
-- Since we can ignore the error because we may be using the existing data in the future cases.
-- The overall constraint creation is done successfully!

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Question 3: List all the patients with older than 40 and have Cancer in diagnosis.
SELECT pd.Patient_ID, pd.Full_Name, pd.Date_Of_Birth, CAST(md.Diagnosis AS VARCHAR(MAX)) AS Diagnosis
FROM Patient_Data pd
JOIN Medical_Records_Data md ON pd.Patient_ID = md.Patient_ID
WHERE YEAR(pd.Date_Of_Birth) <= YEAR(GETDATE()) - 40 -- Older than 40
AND CAST(md.Diagnosis AS VARCHAR(MAX)) LIKE '%Cancer%';

-- Thiw query returns no data since there is no diagnosis mentioned as cancer in them. To get the data, let's insert some rows in the specified tables so as to get meaningful results.

UPDATE Medical_Records_Data
SET Diagnosis = 'Suffering from Cancer for a period of 5 years already. Going through chemo for a period of 3 years rapicly. Condition getting critical day by day', Surgery_Performed = '1'
WHERE Patient_ID = 10;

UPDATE Medical_Records_Data
SET Diagnosis = 'Early stage of Pancreatic Cancer found. Still in observation', Surgery_Performed = '0'
WHERE Patient_ID = 13;

-- Now, lets execute the query to find the patient's info whose age is above 40 and have cancer here
SELECT pd.Patient_ID, pd.Full_Name, pd.Date_Of_Birth, CAST(md.Diagnosis AS VARCHAR(MAX)) AS Diagnosis
FROM Patient_Data pd
JOIN Medical_Records_Data md ON pd.Patient_ID = md.Patient_ID
WHERE YEAR(pd.Date_Of_Birth) <= YEAR(GETDATE()) - 40 -- Older than 40
AND CAST(md.Diagnosis AS VARCHAR(MAX)) LIKE '%Cancer%'; -- Got the results accordingly.

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Question 4: The hospital also requires stored procedures or user-defined functions to do the following things:

-- Part a) Search the database of the hospital for matching character strings by name of medicine. Results should be sorted with most recent medicine prescribed date first
CREATE PROCEDURE Search_By_Medicine_Name
    @MedicineName VARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;
    SELECT 
        md.Medication,
        md.Medication_Prescribed_Date,
        md.Diagnosis,
        p.Full_Name AS Patient_Name,
        d.Full_Name AS Doctor_Name
    FROM 
        Medical_Records_Data md
    INNER JOIN 
        Patient_Data p ON md.Patient_ID = p.Patient_ID
    INNER JOIN 
        Doctor_Data d ON md.Doctor_ID = d.Doctor_ID
    WHERE 
        md.Medication LIKE '%' + @MedicineName + '%'
    ORDER BY 
        md.Medication_Prescribed_Date DESC;
END;

EXEC Search_By_Medicine_Name @MedicineName = 'Acetaminophen'; -- returns the list showing the Patient_Name and Doctor_name alongwith Diagnosis, Medication and Medication_Prescribed_Date as well

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Part b) Return a full list of diagnosis and allergies for a specific patient who has an appointment today (i.e., the system date when the query is run)

CREATE FUNCTION Get_Diagnosis_Allergies_Today (@PatientID INT)
RETURNS TABLE
AS
RETURN
(
    SELECT md.Diagnosis, md.Allergies
    FROM Medical_Records_Data md
    INNER JOIN Appointment_Data ad ON md.Appt_ID = ad.Appt_ID
    WHERE md.Patient_ID = @PatientID
    AND CONVERT(DATE, ad.Appt_Date) = CONVERT(DATE, GETDATE())
);

-- This function takes the PatientID as input and returns a table with two columns: Diagnosis and Allergies. 
-- It joins the Medical_Records_Data and Appointment_Data tables on the appointment ID and filters the records for the specified patient and appointments scheduled for the current date.

SELECT Diagnosis, Allergies
FROM Get_Diagnosis_Allergies_Today(1); -- considering we want to check it for the patient_ID ==1. 
-- So as to get some values in the result, let's insert manually some meaningful data

UPDATE Appointment_Data
SET Appt_Date = GETDATE()
WHERE Patient_ID = 1;

UPDATE Appointment_Data
SET Patient_ID = 1
WHERE Appt_ID = 1;

SELECT * FROM Appointment_Data; -- For patient_Id == 1, changed the Appt_Date to the current date

-- Lets view the results now:

SELECT Diagnosis, Allergies
FROM dbo.Get_Diagnosis_Allergies_Today(1);

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Part c) Update the details for an existing doctor

-- Let's write a stored procedure to update the details of an existing doctor into the table
CREATE PROCEDURE Update_DoctorDetails_Data
    @DoctorID VARCHAR(10),
    @NewName VARCHAR(100),
    @NewSpecialization VARCHAR(50),
    @NewEmail VARCHAR(100),
    @NewPhone VARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Doctor_Data
    SET Full_Name = @NewName,
        Qualification = @NewSpecialization,
        Email_Address = @NewEmail,
        Contact_Phone = @NewPhone
    WHERE Doctor_ID = @DoctorID;
END;

EXEC UpdateDoctorDetails_Data 'Ba948', 'Balakrishnan P K', 'MD Oncology',  'balakrishnan.pk@example.com', '+44 1234 567890'; -- trying to update only the Qualification of the Doctor

SELECT * FROM Doctor_Data; --Hence we could see that the qualification have been updated.

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Part d) Delete the appointment who status is already completed.
-- Let's create another Appointments table in order to do the task since its gonna affectthe foreign key constraint if we do it in prevailing table

CREATE TABLE Appointment_Data_Delete (
    Appt_ID INT PRIMARY KEY IDENTITY,
    Appt_Date DATE NOT NULL,
    Dept_Name VARCHAR(50),
    Appt_Status VARCHAR(20) DEFAULT 'Pending' CHECK (Appt_Status IN ( 'Pending', 'Cancelled', 'Completed')),
    Feedback TEXT,
    Scheduled_By VARCHAR(100), -- Additional column to store who scheduled the appointment
    Room_No INT -- Additional column for room number
);

-- Insert some records to fill it up with completed Appointment status data:

INSERT INTO Appointment_Data_Delete( Appt_Date, Dept_Name, Appt_Status, Feedback, Scheduled_By, Room_No)
VALUES
( '2024-07-01', 'General', 'Completed', 'Excellent service and care provided.', 'Anupama Parameswaran', 101),
( '2024-08-02', 'Oncology', 'Pending', 'Doctor was very attentive and helpful.', 'Arathi Menon', 102),
('2024-06-03', 'Cardiology', 'Cancelled', 'Smooth appointment process and friendly staff.', 'Sukumaran K R', 103),
( '2024-09-04', 'Orthopedics', 'Completed', 'Received prompt attention and thorough examination.', 'Susmitha Das', 104);

-- Creating a stored procedure to do the task
CREATE PROCEDURE Delete_Completed_Appointments_Details
AS
BEGIN
    SET NOCOUNT ON;
    -- Delete appointments with a completed status
    DELETE FROM Appointment_Data_Delete
    WHERE Appt_Status = 'Completed';
END;

-- calling the UDF to check whether its done its duty or not
EXEC Delete_Completed_Appointments_Details; 

-- TO see whether it got deleted or not
SELECT * FROM Appointment_Data_Delete;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Question 5: The hospitals wants to view the appointment date and time, showing all previousand current appointments for all doctors, and including details of the department(the doctor is associated with), doctor’s specialty and any associate review/feedbackgiven for a doctor. You should create a view containing all the required information.

CREATE VIEW Appointment_Details_View AS
SELECT 
    A.Appt_Date,
    D.Full_Name AS Doctor_Name,
    D.Qualification AS Doctor_Specialty,
    A.Dept_Name AS Department_Name,
    A.Feedback AS Doctor_Feedback
FROM 
    Appointment_Data A
JOIN 
    Doctor_Data D ON A.Doctor_ID = D.Doctor_ID;

	-- To print the values in the view
SELECT * FROM Appointment_Details_View; -- Hence got packed with all the required information in a separate table by using view.

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Question 6: Create a trigger so that the current state of an appointment can be changed toavailable when it is cancelled
	
CREATE TRIGGER Update_Appointment_State
ON Appointment_Data
AFTER UPDATE
AS
BEGIN
    IF UPDATE(Appt_Status)
    BEGIN
        UPDATE Appointment_Data
        SET Appt_Status = 'Available'
        WHERE Appt_Status = 'Cancelled';
    END
END;
-- This trigger fires after an update operation is performed on the Appointment_Data table. If the update includes a change to the Appt_Status column, it checks if the new status is "Cancelled". If it is, then it updates the Appt_Status column to "Available" for the corresponding appointment(s).

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Question 7: Write a select query which allows the hospital to identify the number ofcompleted appointments with the specialty of doctors as ‘Gastroenterologists’.

ALTER TABLE Appointment_Data
DROP CONSTRAINT CK__Appointme__Appt___0D7A0286; -- In order to review the result, we had to remove the constraint that we created for the task 2, question 2

-- Now, alter the table for getting some completed status showing results in it
UPDATE Doctor_Data
SET Qualification = 'Gastroenterologist'
WHERE Doctor_ID = 'Su486'; -- In order to get the selection where the doctor has qualification as provided

UPDATE Appointment_Data
SET Doctor_ID = 'Su486'
WHERE Appt_ID = 15; -- In order to get the same Doctor_ID while conditioning

UPDATE Appointment_Data
SET Appt_Status = 'Completed'
WHERE Appt_ID = 15; -- Change the status of the Doctor_ID to completed. 

SELECT COUNT(*) AS NumCompletedAppointments
FROM Appointment_Data AS a
JOIN Doctor_Data AS d ON a.Doctor_ID = d.Doctor_ID
WHERE a.Appt_Status = 'Completed' AND d.Qualification = 'Gastroenterologist';
--Hence, when we run the query, there will be a value 1 showing as a result which indictaes that there is 1 doctor with a 
-- qualification of 'Gastroenterologist' whose appointment status is in the completed stage right now.