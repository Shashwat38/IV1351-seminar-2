CREATE TABLE person (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    personal_number VARCHAR(12) UNIQUE NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    phone_number VARCHAR(50) NOT NULL,
    address VARCHAR(500) NOT NULL
);

CREATE TABLE job_title (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    job_title VARCHAR(200) UNIQUE NOT NULL
);

CREATE TABLE department (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    department_name VARCHAR(200) UNIQUE NOT NULL,
    manager_id INT UNIQUE NOT NULL,
    FOREIGN KEY (manager_id)
        REFERENCES person(id)
        ON DELETE RESTRICT
);

CREATE TABLE employee (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    employment_id VARCHAR(50) UNIQUE NOT NULL,
    skill_set VARCHAR(500) NOT NULL,
    salary VARCHAR(10) NOT NULL,
    manager VARCHAR(200) NOT NULL,
    person_id INT NOT NULL,
    department_id INT NOT NULL,
    job_title_id INT NOT NULL,
    FOREIGN KEY (person_id)
        REFERENCES person(id)
        ON DELETE CASCADE,
    FOREIGN KEY (department_id)
        REFERENCES department(id)
        ON DELETE CASCADE,
    FOREIGN KEY (job_title_id)
        REFERENCES job_title(id)
        ON DELETE RESTRICT
);

CREATE TABLE skill (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    skill_name VARCHAR(200) NOT NULL
);

CREATE TABLE employee_skill (
    employee_id INT NOT NULL,
    skill_id INT NOT NULL,
    PRIMARY KEY (employee_id, skill_id),
    FOREIGN KEY (employee_id)
        REFERENCES employee(id)
        ON DELETE CASCADE,
    FOREIGN KEY (skill_id)
        REFERENCES skill(id)
        ON DELETE CASCADE
);

CREATE TABLE course_layout (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    course_code VARCHAR(10) UNIQUE NOT NULL,
    course_name VARCHAR(200) NOT NULL,
    min_students INT NOT NULL,
    max_students INT NOT NULL,
    hp FLOAT(2) NOT NULL
);

CREATE TABLE course_instance (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    course_layout_id INT NOT NULL,
    instance_id VARCHAR(30) UNIQUE NOT NULL,
    study_year INT NOT NULL,
    study_period CHAR(2) NOT NULL,
    num_students INT NOT NULL,
    FOREIGN KEY (course_layout_id)
        REFERENCES course_layout(id)
        ON DELETE CASCADE
);

CREATE TABLE teaching_activity (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    activity_name VARCHAR(40) UNIQUE NOT NULL,
    factor FLOAT(2) NOT NULL
);

CREATE TABLE planned_activity (
    course_instance_id INT NOT NULL,
    teaching_activity_id INT NOT NULL,
    planned_hours FLOAT(5) NOT NULL,
    PRIMARY KEY (course_instance_id, teaching_activity_id),
    FOREIGN KEY (course_instance_id)
        REFERENCES course_instance(id)
        ON DELETE CASCADE,
    FOREIGN KEY (teaching_activity_id)
        REFERENCES teaching_activity(id)
        ON DELETE CASCADE
);

CREATE TABLE allocation (
    course_instance_id INT NOT NULL,
    teaching_activity_id INT NOT NULL,
    employee_id INT NOT NULL,
    allocated_hours FLOAT(10) NOT NULL,
    PRIMARY KEY (course_instance_id, teaching_activity_id, employee_id),
    FOREIGN KEY (course_instance_id, teaching_activity_id)
        REFERENCES planned_activity(course_instance_id, teaching_activity_id)
        ON DELETE CASCADE,
    FOREIGN KEY (employee_id)
        REFERENCES employee(id)
        ON DELETE CASCADE
);
