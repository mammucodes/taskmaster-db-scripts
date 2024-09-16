CREATE TABLE users (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,                -- Auto-generated unique ID
    email VARCHAR(50) NOT NULL UNIQUE,   -- Email address (50 characters max)
    password VARCHAR(60) NOT NULL,        -- Password (hashed, e.g., bcrypt)
gistered_on DATE,   --  add while insertingRegistration da
full_name VARCHAR(100) NOT NULL       -- Full name (100 characters max)
);
ALTER TABLE users 
CHANGE   usersegistered_on  registered_on DATE;


INSERT INTO users (email, password, full_name, registered_on) 
VALUES 
('michael.jordan@example.com', 'hashedpassword1', 'Michael Jordan', CURDATE()),
('sarah.connor@example.com', 'hashedpassword2', 'Sarah Connor', CURDATE()),
('tony.stark@example.com', 'hashedpassword3', 'Tony Stark', CURDATE()),
('bruce.wayne@example.com', 'hashedpassword4', 'Bruce Wayne', CURDATE()),
('diana.prince@example.com', 'hashedpassword5', 'Diana Prince', CURDATE());


-- =====CREATING PRIORTY_OPTIONS TABLE===========
-- CREATING  Table for priority options


CREATE TABLE priority_options (
    id INT AUTO_INCREMENT PRIMARY KEY,
    priority VARCHAR(50) NOT NULL UNIQUE
);

-- ======= CREATING Table for status options==========
CREATE TABLE status_options (
    id INT AUTO_INCREMENT PRIMARY KEY,
    status VARCHAR(50) NOT NULL UNIQUE
);

-- ==========Insert default values into priority_options==========
INSERT INTO priority_options (priority) VALUES ('Low'), ('Medium'), ('High');
select * from  priority_options;

-- ======Insert default values into status_options============
DELETE FROM status_options;
select * from  status_options;

INSERT INTO status_options (status) VALUES ('Completed'), ('In_Progress'), ('Started'),('Yet_To_Start');

-- ========CREATING Table for TASKS==========
CREATE TABLE tasks (
    task_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,       -- Auto-generated unique ID for task
    user_id INT UNSIGNED NOT NULL,                         -- Foreign key to user (assuming users table already exists)
    title VARCHAR(80) NOT NULL,                  -- Title of the task, cannot be NULL
    descriptions   varchar(3000),                         -- Description of the task
    category VARCHAR(50),                        -- Category of the task
    priority_id INT,                              -- Foreign key to priority options
    due_date TIMESTAMP,                   -- Due date of the task, default is NULL
    status_id INT,                                -- Foreign key to status options
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Created date with timestamp
    updated_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Updated on date with timestamp
    reminder INT, -- Reminder in minutes, only if due date exists // check while passing in java
    FOREIGN KEY (user_id) REFERENCES users(id),    -- Foreign key constraint for user_id
    FOREIGN KEY (priority_id) REFERENCES priority_options(id), -- Foreign key constraint for priority_id
    FOREIGN KEY (status_id) REFERENCES status_options(id) -- Foreign key constraint for status_id
);

-- =============INSERT data into tasks table==========
INSERT INTO tasks (user_id, title, descriptions, category, priority_id, due_date, status_id, reminder, created_date, updated_on)
VALUES
    (1, 'Finish Project Report', 'Complete the final report for the project by end of the week.', 'Work', 2, '2024-09-20 17:00:00', 17, 30, NOW(), NOW()),  -- status_id 17: 'Completed'
    (2, 'Buy Groceries', 'Purchase groceries for the upcoming week including fruits and vegetables.', 'Personal', 3, '2024-09-18 10:00:00', 18, 60, NOW(), NOW()),  -- status_id 18: 'In_Progress'
    (1, 'Schedule Team Meeting', 'Organize a meeting with the team to discuss project progress.', 'Work', 1, '2024-09-19 14:00:00', 19, 15, NOW(), NOW()),  -- status_id 19: 'Started'
    (3, 'Book Dentist Appointment', 'Schedule an appointment for a dental checkup.', 'Health', 2, '2024-09-25 09:00:00', 20, 45, NOW(), NOW()),  -- status_id 20: 'Yet_To_Start'
    (2, 'Finish Reading Book', 'Complete reading the book that has been on the shelf for a while.', 'Personal', 3, '2024-09-30 20:00:00', 17, 120, NOW(), NOW()),  -- status_id 17: 'Completed'
    (3, 'Prepare Presentation', 'Create and finalize the presentation for the upcoming conference.', 'Work', 2, '2024-09-22 12:00:00', 18, 30, NOW(), NOW());  -- status_id 18: 'In_Progress'

