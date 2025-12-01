
-- QUERY 1

SELECT
    cl.course_code,
    ci.instance_id AS course_instance_id,
    cl.hp,
    ci.study_period,
    ci.num_students,
    SUM(CASE WHEN ta.activity_name = 'Lecture' THEN pa.planned_hours * ta.factor END) AS lecture_hours,
    SUM(CASE WHEN ta.activity_name = 'Tutorial' THEN pa.planned_hours * ta.factor END) AS tutorial_hours,
    SUM(CASE WHEN ta.activity_name = 'Lab' THEN pa.planned_hours * ta.factor END) AS lab_hours,
    SUM(CASE WHEN ta.activity_name = 'Seminar' THEN pa.planned_hours * ta.factor END) AS seminar_hours,
    SUM(CASE WHEN ta.activity_name NOT IN ('Lecture','Tutorial','Lab','Seminar') THEN pa.planned_hours * ta.factor END) AS other_overhead_hours,
    (2 * cl.hp + 28 + 0.2 * ci.num_students) AS admin_hours,
    (32 + 0.725 * ci.num_students) AS exam_hours,
    (
        SUM(pa.planned_hours * ta.factor)
      + (2 * cl.hp + 28 + 0.2 * ci.num_students)
      + (32 + 0.725 * ci.num_students)
    ) AS total_hours
FROM course_instance ci
JOIN course_layout cl ON ci.course_layout_id = cl.id
JOIN planned_activity pa ON pa.course_instance_id = ci.id
JOIN teaching_activity ta ON ta.id = pa.teaching_activity_id
WHERE ci.study_year = 2025
GROUP BY
    cl.course_code,
    ci.instance_id,
    cl.hp,
    ci.study_period,
    ci.num_students
ORDER BY
    cl.course_code,
    ci.instance_id;



-- QUERY 2

SELECT
    cl.course_code,
    ci.instance_id AS course_instance_id,
    cl.hp,
    (p.first_name || ' ' || p.last_name) AS teacher_name,
    jt.job_title AS designation,
    SUM(CASE WHEN ta.activity_name = 'Lecture' THEN a.allocated_hours * ta.factor END) AS lecture_hours,
    SUM(CASE WHEN ta.activity_name = 'Tutorial' THEN a.allocated_hours * ta.factor END) AS tutorial_hours,
    SUM(CASE WHEN ta.activity_name = 'Lab' THEN a.allocated_hours * ta.factor END) AS lab_hours,
    SUM(CASE WHEN ta.activity_name = 'Seminar' THEN a.allocated_hours * ta.factor END) AS seminar_hours,
    SUM(CASE WHEN ta.activity_name NOT IN ('Lecture','Tutorial','Lab','Seminar','Admin','Exam') THEN a.allocated_hours * ta.factor END) AS other_overhead_hours,
    SUM(CASE WHEN ta.activity_name = 'Admin' THEN a.allocated_hours * ta.factor END) AS admin_hours,
    SUM(CASE WHEN ta.activity_name = 'Exam' THEN a.allocated_hours * ta.factor END) AS exam_hours,
    SUM(a.allocated_hours * ta.factor) AS total_hours
FROM allocation a
JOIN employee e ON e.id = a.employee_id
JOIN person p ON p.id = e.person_id
JOIN job_title jt ON jt.id = e.job_title_id
JOIN teaching_activity ta ON ta.id = a.teaching_activity_id
JOIN course_instance ci ON ci.id = a.course_instance_id
JOIN course_layout cl ON cl.id = ci.course_layout_id
WHERE ci.study_year = 2025
GROUP BY
    cl.course_code,
    ci.instance_id,
    cl.hp,
    teacher_name,
    jt.job_title
ORDER BY
    cl.course_code,
    ci.instance_id,
    teacher_name;





-- QUERY 3

SELECT
    cl.course_code,
    ci.instance_id AS course_instance_id,
    cl.hp,
    ci.study_period,
    (p.first_name || ' ' || p.last_name) AS teacher_name,
    SUM(CASE WHEN ta.activity_name = 'Lecture' THEN a.allocated_hours * ta.factor END) AS lecture_hours,
    SUM(CASE WHEN ta.activity_name = 'Tutorial' THEN a.allocated_hours * ta.factor END) AS tutorial_hours,
    SUM(CASE WHEN ta.activity_name = 'Lab' THEN a.allocated_hours * ta.factor END) AS lab_hours,
    SUM(CASE WHEN ta.activity_name = 'Seminar' THEN a.allocated_hours * ta.factor END) AS seminar_hours,
    SUM(CASE WHEN ta.activity_name NOT IN ('Lecture','Tutorial','Lab','Seminar','Admin','Exam') THEN a.allocated_hours * ta.factor END) AS other_overhead_hours,
    SUM(CASE WHEN ta.activity_name = 'Admin' THEN a.allocated_hours * ta.factor END) AS admin_hours,
    SUM(CASE WHEN ta.activity_name = 'Exam' THEN a.allocated_hours * ta.factor END) AS exam_hours,
    SUM(a.allocated_hours * ta.factor) AS total_hours
FROM allocation a
JOIN employee e ON e.id = a.employee_id
JOIN person p ON p.id = e.person_id
JOIN teaching_activity ta ON ta.id = a.teaching_activity_id
JOIN course_instance ci ON ci.id = a.course_instance_id
JOIN course_layout cl ON cl.id = ci.course_layout_id
WHERE ci.study_year = 2025
  AND e.employment_id = 'EMP001'
GROUP BY
    cl.course_code,
    ci.instance_id,
    cl.hp,
    ci.study_period,
    teacher_name
ORDER BY
    cl.course_code,
    ci.instance_id;





-- QUERY 4

SELECT
    e.employment_id,
    (p.first_name || ' ' || p.last_name) AS teacher_name,
    ci.study_period,
    COUNT(DISTINCT ci.id) AS number_of_courses
FROM allocation a
JOIN employee e ON e.id = a.employee_id
JOIN person p ON p.id = e.person_id
JOIN course_instance ci ON ci.id = a.course_instance_id
WHERE ci.study_year = 2025
GROUP BY
    e.employment_id,
    teacher_name,
    ci.study_period
HAVING COUNT(DISTINCT ci.id) > 1
ORDER BY
    number_of_courses DESC,
    teacher_name;









