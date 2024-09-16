
-- ========Insert table for users=========
INSERT INTO users (email, password, full_name, registered_on) 
VALUES 
('michael.jordan@example.com', 'hashedpassword1', 'Michael Jordan', CURDATE()),
('sarah.connor@example.com', 'hashedpassword2', 'Sarah Connor', CURDATE()),
('tony.stark@example.com', 'hashedpassword3', 'Tony Stark', CURDATE()),
('bruce.wayne@example.com', 'hashedpassword4', 'Bruce Wayne', CURDATE()),
('diana.prince@example.com', 'hashedpassword5', 'Diana Prince', CURDATE());


-- ==========Insert default values into priority_options==========
INSERT INTO priority_options (priority) VALUES ('Low'), ('Medium'), ('High');


-- ======Insert default values into status_options============

INSERT INTO status_options (status) VALUES ('Completed'), ('In_Progress'), ('Started'),('Yet_To_Start');


-- =============INSERT data into tasks table==========
INSERT INTO tasks (user_id, title, descriptions, category, priority_id, due_date, status_id, reminder, created_date, updated_on)
VALUES
    (1, 'Finish Project Report', 'Complete the final report for the project by end of the week.', 'Work', 2, '2024-09-20 17:00:00', 17, 30, NOW(), NOW()),  -- status_id 17: 'Completed'
    (2, 'Buy Groceries', 'Purchase groceries for the upcoming week including fruits and vegetables.', 'Personal', 3, '2024-09-18 10:00:00', 18, 60, NOW(), NOW()),  -- status_id 18: 'In_Progress'
    (1, 'Schedule Team Meeting', 'Organize a meeting with the team to discuss project progress.', 'Work', 1, '2024-09-19 14:00:00', 19, 15, NOW(), NOW()),  -- status_id 19: 'Started'
    (3, 'Book Dentist Appointment', 'Schedule an appointment for a dental checkup.', 'Health', 2, '2024-09-25 09:00:00', 20, 45, NOW(), NOW()),  -- status_id 20: 'Yet_To_Start'
    (2, 'Finish Reading Book', 'Complete reading the book that has been on the shelf for a while.', 'Personal', 3, '2024-09-30 20:00:00', 17, 120, NOW(), NOW()),  -- status_id 17: 'Completed'
    (3, 'Prepare Presentation', 'Create and finalize the presentation for the upcoming conference.', 'Work', 2, '2024-09-22 12:00:00', 18, 30, NOW(), NOW());  -- status_id 18: 'In_Progress'




