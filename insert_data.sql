INSERT INTO person (personal_number, first_name, last_name, phone_number, address) VALUES
('9001011234', 'Alice', 'Andersson', '0701234567', 'Address 1'),
('9102022345', 'Bob', 'Berg', '0702345678', 'Address 2'),
('9203033456', 'Charlie', 'Carlsson', '0703456789', 'Address 3'),
('9304044567', 'David', 'Dahl', '0704567890', 'Address 4'),
('9405055678', 'Eva', 'Ek', '0705678901', 'Address 5'),
('9506066789', 'Fredrik', 'Falk', '0706789012', 'Address 6'),
('9607077890', 'Greta', 'Gran', '0707890123', 'Address 7'),
('9708088901', 'Hanna', 'Holm', '0708901234', 'Address 8'),
('9809099012', 'Isak', 'Inge', '0709012345', 'Address 9'),
('9901010123', 'Johanna', 'Jönsson', '0710123456', 'Address 10');

INSERT INTO job_title (job_title) VALUES
('Professor'),
('Lecturer'),
('Assistant Professor'),
('PhD Student'),
('Teaching Assistant');

INSERT INTO department (department_name, manager_id) VALUES
('Computer Science', 1),
('Mathematics', 2),
('Information Technology', 3);

INSERT INTO employee (employment_id, skill_set, salary, manager, person_id, department_id, job_title_id) VALUES
('EMP001', 'Databases, SQL', 45000, 'Manager A', 1, 1, 1),
('EMP002', 'Mathematics, Teaching', 40000, 'Manager B', 2, 2, 2),
('EMP003', 'Programming, Algorithms', 42000, 'Manager C', 3, 1, 3),
('EMP004', 'Machine Learning', 38000, 'Manager A', 4, 1, 4),
('EMP005', 'Teaching, Grading', 30000, 'Manager B', 5, 2, 5),
('EMP006', 'Math, Algebra', 39000, 'Manager B', 6, 2, 2),
('EMP007', 'Data Analysis', 37000, 'Manager C', 7, 3, 3),
('EMP008', 'AI Research', 41000, 'Manager A', 8, 1, 1),
('EMP009', 'Networks', 43000, 'Manager C', 9, 3, 4),
('EMP010', 'Discrete Math', 35000, 'Manager B', 10, 2, 5);

INSERT INTO skill (skill_name) VALUES
('SQL'),
('Python'),
('Teaching'),
('Machine Learning'),
('Algorithms');

INSERT INTO employee_skill (employee_id, skill_id) VALUES
(1,1),(1,2),(2,3),(3,5),(4,4),(5,3),(6,3),(7,2),(8,4),(9,5),(10,3);

INSERT INTO course_layout (course_code, course_name, min_students, max_students, hp) VALUES
('IV1350', 'Database Systems', 50, 200, 7.5),
('IX1500', 'Discrete Mathematics', 40, 150, 7.5),
('DD1321', 'Programming 1', 70, 250, 7.5);

INSERT INTO course_instance (course_layout_id, instance_id, study_year, study_period, num_students) VALUES
(1, 'IV1350-HT24', 2024, 'P1', 120),
(1, 'IV1350-VT25', 2025, 'P1', 150),
(2, 'IX1500-HT24', 2024, 'P1', 90),
(3, 'DD1321-VT25', 2025, 'P1', 200);

INSERT INTO teaching_activity (activity_name, factor) VALUES
('Lecture', 3.6),
('Lab', 2.4),
('Tutorial', 2.4),
('Seminar', 1.8),
('Other', 1.0),
('Admin', 1.0),
('Exam', 1.0);


INSERT INTO planned_activity (course_instance_id, teaching_activity_id, planned_hours) VALUES
(2,1,20),
(2,2,40),
(2,3,30),
(2,4,10),
(2,5,15),
(4,1,25),
(4,2,35),
(4,3,20),
(4,4,15),
(4,5,10),
(2,6,83),
(2,7,177),
(4,6,73),
(4,7,140.75);


INSERT INTO allocation (course_instance_id, teaching_activity_id, employee_id, allocated_hours) VALUES
(2,1,1,10),
(2,1,2,10),
(2,2,3,20),
(2,3,4,15),
(2,4,5,10),
(2,5,2,15),
(4,1,6,12),
(4,2,7,15),
(4,3,8,10),
(4,4,9,10),
(4,5,10,8),
(2,6,6,45),
(2,6,7,38),
(2,7,6,90),
(2,7,8,87),
(4,6,1,40),
(4,6,2,33),
(4,7,1,70.75),
(4,7,3,70);









