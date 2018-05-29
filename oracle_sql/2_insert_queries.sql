-- 등급 정보 테이블
INSERT INTO access_level(access_id, access_name) VALUES ('LV001', '관리자');
INSERT INTO access_level(access_id, access_name) VALUES ('LV002', '강사');
INSERT INTO access_level(access_id, access_name) VALUES ('LV003', '수강생');

COMMIT;





--로그인 정보 테이블
INSERT INTO login(name_, ssn, phone, initial_reg_date, access_id, login_id) 
VALUES ('jang', '111', '010-1111-1111', '2016-01-01', 'LV001', CONCAT('S', LPAD(SUBSTR(NVL((SELECT MAX(login_id) FROM login),'S000'),2)+1, 3, 0)));
INSERT INTO login(name_, ssn, phone, initial_reg_date, access_id, login_id) 
VALUES ('minjong', '222', '010-2222-2222', '2017-01-01', 'LV002', CONCAT('S', LPAD(SUBSTR(NVL((SELECT MAX(login_id) FROM login),'S000'),2)+1, 3, 0)));
INSERT INTO login(name_, ssn, phone, initial_reg_date, access_id, login_id) 
VALUES ('siwan', '123', '010-1234-1234', '2017-01-01', 'LV002', CONCAT('S', LPAD(SUBSTR(NVL((SELECT MAX(login_id) FROM login),'S000'),2)+1, 3, 0)));
INSERT INTO login(name_, ssn, phone, initial_reg_date, access_id, login_id) 
VALUES ('nahyeon', '456', '010-1588-3082', '2017-01-01', 'LV003', CONCAT('S', LPAD(SUBSTR(NVL((SELECT MAX(login_id) FROM login),'S000'),2)+1, 3, 0)));
INSERT INTO login(name_, ssn, phone, initial_reg_date, access_id, login_id) 
VALUES ('jihoon', '789', '010-1577-1577', '2017-08-01', 'LV003', CONCAT('S', LPAD(SUBSTR(NVL((SELECT MAX(login_id) FROM login),'S000'),2)+1, 3, 0)));
INSERT INTO login(name_, ssn, phone, initial_reg_date, access_id, login_id) 
VALUES ('jiyoung', '012', '010-1588-5588', '2017-11-01', 'LV003', CONCAT('S', LPAD(SUBSTR(NVL((SELECT MAX(login_id) FROM login),'S000'),2)+1, 3, 0)));
INSERT INTO login(name_, ssn, phone, initial_reg_date, access_id, login_id) 
VALUES ('bogum', '333', '010-3333-3333', '2018-01-01', 'LV002', CONCAT('S', LPAD(SUBSTR(NVL((SELECT MAX(login_id) FROM login),'S000'),2)+1, 3, 0)));
INSERT INTO login(name_, ssn, phone, initial_reg_date, access_id, login_id) 
VALUES ('subyeong', '444', '010-4444-4444', '2018-01-01', 'LV003', CONCAT('S', LPAD(SUBSTR(NVL((SELECT MAX(login_id) FROM login),'S000'),2)+1, 3, 0)));
INSERT INTO login(name_, ssn, phone, initial_reg_date, access_id, login_id) 
VALUES ('minkyoo', '555', '010-5555-5555', '2018-01-01', 'LV003', CONCAT('S', LPAD(SUBSTR(NVL((SELECT MAX(login_id) FROM login),'S000'),2)+1, 3, 0)));
INSERT INTO login(name_, ssn, phone, initial_reg_date, access_id, login_id) 
VALUES ('hoyun', '666', '010-6666-6666', '2018-02-02', 'LV003', CONCAT('S', LPAD(SUBSTR(NVL((SELECT MAX(login_id) FROM login),'S000'),2)+1, 3, 0)));
INSERT INTO login(name_, ssn, phone, initial_reg_date, access_id, login_id) 
VALUES ('jungah', '777', '010-7777-7777', '2018-02-02', 'LV003', CONCAT('S', LPAD(SUBSTR(NVL((SELECT MAX(login_id) FROM login),'S000'),2)+1, 3, 0)));
INSERT INTO login(name_, ssn, phone, initial_reg_date, access_id, login_id) 
VALUES ('jihoon', '888', '010-8888-8888', '2017-11-01', 'LV003', CONCAT('S', LPAD(SUBSTR(NVL((SELECT MAX(login_id) FROM login),'S000'),2)+1, 3, 0)));
INSERT INTO login(name_, ssn, phone, initial_reg_date, access_id, login_id) 
VALUES ('gildong', '999', '010-9999-9999', '2017-08-01', 'LV003', CONCAT('S', LPAD(SUBSTR(NVL((SELECT MAX(login_id) FROM login),'S000'),2)+1, 3, 0)));
INSERT INTO login(name_, ssn, phone, initial_reg_date, access_id, login_id) 
VALUES ('seowoo', '111', '010-1541-1541', '2017-01-01', 'LV003', CONCAT('S', LPAD(SUBSTR(NVL((SELECT MAX(login_id) FROM login),'S000'),2)+1, 3, 0)));


COMMIT;






-- 관리자 정보  테이블
INSERT INTO managers(manager_id , manager_reg_date) VALUES ('S001', '2016-01-01');

COMMIT;






-- 강사 정보
INSERT INTO instructors(instructor_id, instructor_reg_date) VALUES ('S002', '2017-01-01');
INSERT INTO instructors(instructor_id, instructor_reg_date) VALUES ('S003',  '2017-01-01');
INSERT INTO instructors(instructor_id, instructor_reg_date) VALUES ('S007',  '2018-01-01');

COMMIT;






-- 수강생 정보
INSERT INTO students(student_id, student_reg_date) VALUES ('S004', '2017-01-01');
INSERT INTO students(student_id, student_reg_date) VALUES ('S005', '2017-08-01');
INSERT INTO students(student_id, student_reg_date) VALUES ('S006', '2017-11-01');
INSERT INTO students(student_id, student_reg_date) VALUES ('S008', '2018-01-01');
INSERT INTO students(student_id, student_reg_date) VALUES ('S009', '2018-01-01');
INSERT INTO students(student_id, student_reg_date) VALUES ('S010', '2018-02-02');
INSERT INTO students(student_id, student_reg_date) VALUES ('S011', '2018-02-02');
INSERT INTO students(student_id, student_reg_date) VALUES ('S012', '2017-11-01');
INSERT INTO students(student_id, student_reg_date) VALUES ('S013', '2017-08-01');
INSERT INTO students(student_id, student_reg_date) VALUES ('S014', '2017-01-01');

COMMIT;






-- 강의실 정보 테이블
INSERT INTO classrooms(classroom_id, classroom_name, maximum, manager_id)
VALUES (CONCAT('CL', LPAD(SUBSTR(NVL((SELECT MAX(classroom_id) FROM classrooms),'CL000'),3)+1, 3, 0)), '1강의실', 20, 'S001');
INSERT INTO classrooms(classroom_id, classroom_name, maximum, manager_id)
VALUES (CONCAT('CL', LPAD(SUBSTR(NVL((SELECT MAX(classroom_id) FROM classrooms),'CL000'),3)+1, 3, 0)), '2강의실', 20, 'S001');
INSERT INTO classrooms(classroom_id, classroom_name, maximum, manager_id)
VALUES (CONCAT('CL', LPAD(SUBSTR(NVL((SELECT MAX(classroom_id) FROM classrooms),'CL000'),3)+1, 3, 0)), '3강의실', 30, 'S001');
INSERT INTO classrooms(classroom_id, classroom_name, maximum, manager_id)
VALUES (CONCAT('CL', LPAD(SUBSTR(NVL((SELECT MAX(classroom_id) FROM classrooms),'CL000'),3)+1, 3, 0)), '4강의실', 30, 'S001');


COMMIT;





-- 교재 정보    
INSERT INTO textbooks(textbook_id, textbook_title, publisher) 
VALUES(CONCAT('TX', LPAD(SUBSTR(NVL((SELECT MAX(textbook_id) FROM textbooks),'TX000'),3)+1, 3, 0)), '이것이Java다', '한빛미디어');
INSERT INTO textbooks(textbook_id, textbook_title, publisher) 
VALUES(CONCAT('TX', LPAD(SUBSTR(NVL((SELECT MAX(textbook_id) FROM textbooks),'TX000'),3)+1, 3, 0)), '이것이Oracle이다', '한빛미디어');
INSERT INTO textbooks(textbook_id, textbook_title, publisher) 
VALUES(CONCAT('TX', LPAD(SUBSTR(NVL((SELECT MAX(textbook_id) FROM textbooks),'TX000'),3)+1, 3, 0)), '이것이HTML이다', '한빛미디어');
INSERT INTO textbooks(textbook_id, textbook_title, publisher) 
VALUES(CONCAT('TX', LPAD(SUBSTR(NVL((SELECT MAX(textbook_id) FROM textbooks),'TX000'),3)+1, 3, 0)), '이것이AI다', '한빛미디어');

COMMIT;






-- 기초 과정 정보
INSERT INTO basic_courses(bc_id, bc_title) 
VALUES (CONCAT('BC', LPAD(SUBSTR(NVL((SELECT MAX(bc_id) FROM basic_courses),'BC000'),3)+1, 3, 0)), 'AI 전문가 양성과정');    
INSERT INTO basic_courses(bc_id, bc_title) 
VALUES (CONCAT('BC', LPAD(SUBSTR(NVL((SELECT MAX(bc_id) FROM basic_courses),'BC000'),3)+1, 3, 0)), 'Java 개발자 양성과정');
INSERT INTO basic_courses(bc_id, bc_title) 
VALUES (CONCAT('BC', LPAD(SUBSTR(NVL((SELECT MAX(bc_id) FROM basic_courses),'BC000'),3)+1, 3, 0)), 'DB 전문가 양성과정');


COMMIT;





 
-- 기초 과목 정보
INSERT INTO basic_subjects(bs_id, bs_name) 
VALUES (CONCAT('BS', LPAD(SUBSTR(NVL((SELECT MAX(bs_id) FROM basic_subjects),'BS000'),3)+1, 3, 0)), 'Java');
INSERT INTO basic_subjects(bs_id, bs_name) 
VALUES (CONCAT('BS', LPAD(SUBSTR(NVL((SELECT MAX(bs_id) FROM basic_subjects),'BS000'),3)+1, 3, 0)), 'Oracle');
INSERT INTO basic_subjects(bs_id, bs_name) 
VALUES (CONCAT('BS', LPAD(SUBSTR(NVL((SELECT MAX(bs_id) FROM basic_subjects),'BS000'),3)+1, 3, 0)), 'HTML');
INSERT INTO basic_subjects(bs_id, bs_name) 
VALUES (CONCAT('BS', LPAD(SUBSTR(NVL((SELECT MAX(bs_id) FROM basic_subjects),'BS000'),3)+1, 3, 0)), 'AI');

COMMIT;






-- 강의 가능 과목 정보
-- Java, Oracle, HTML / minjong
-- AI / siwan
-- Java, Oracle, HTML / bogum

INSERT INTO available_subjects(instructor_id, bs_id) VALUES('S002', 'BS001');
INSERT INTO available_subjects(instructor_id, bs_id) VALUES('S002', 'BS002');
INSERT INTO available_subjects(instructor_id, bs_id) VALUES('S002', 'BS003');
INSERT INTO available_subjects(instructor_id, bs_id) VALUES('S003', 'BS004');
INSERT INTO available_subjects(instructor_id, bs_id) VALUES('S007', 'BS001');
INSERT INTO available_subjects(instructor_id, bs_id) VALUES('S007', 'BS002');
INSERT INTO available_subjects(instructor_id, bs_id) VALUES('S007', 'BS003');

COMMIT;






-- 개설 과정 정보
INSERT INTO offered_courses(oc_id, oc_start_date, oc_end_date, classroom_id, bc_id) 
VALUES (CONCAT('OC', LPAD(SUBSTR(NVL((SELECT MAX(oc_id) FROM offered_courses),'OC000'),3)+1, 3, 0)),  '2017-01-01', '2017-07-31', 'CL001', 'BC002');
INSERT INTO offered_courses(oc_id, oc_start_date, oc_end_date, classroom_id, bc_id) 
VALUES (CONCAT('OC', LPAD(SUBSTR(NVL((SELECT MAX(oc_id) FROM offered_courses),'OC000'),3)+1, 3, 0)),  '2017-08-01', '2017-10-31', 'CL001', 'BC001');
INSERT INTO offered_courses(oc_id, oc_start_date, oc_end_date, classroom_id, bc_id) 
VALUES (CONCAT('OC', LPAD(SUBSTR(NVL((SELECT MAX(oc_id) FROM offered_courses),'OC000'),3)+1, 3, 0)),  '2017-11-01', '2018-05-31', 'CL002', 'BC002');
INSERT INTO offered_courses(oc_id, oc_start_date, oc_end_date, classroom_id, bc_id) 
VALUES (CONCAT('OC', LPAD(SUBSTR(NVL((SELECT MAX(oc_id) FROM offered_courses),'OC000'),3)+1, 3, 0)),  '2018-01-01', '2018-03-31', 'CL003', 'BC001');
INSERT INTO offered_courses(oc_id, oc_start_date, oc_end_date, classroom_id, bc_id) 
VALUES (CONCAT('OC', LPAD(SUBSTR(NVL((SELECT MAX(oc_id) FROM offered_courses),'OC000'),3)+1, 3, 0)),  '2018-03-01', '2018-05-31', 'CL003', 'BC003');
INSERT INTO offered_courses(oc_id, oc_start_date, oc_end_date, classroom_id, bc_id) 
VALUES (CONCAT('OC', LPAD(SUBSTR(NVL((SELECT MAX(oc_id) FROM offered_courses),'OC000'),3)+1, 3, 0)),  '2018-06-01', '2018-08-31', 'CL003', 'BC003');
INSERT INTO offered_courses(oc_id, oc_start_date, oc_end_date, classroom_id, bc_id) 
VALUES (CONCAT('OC', LPAD(SUBSTR(NVL((SELECT MAX(oc_id) FROM offered_courses),'OC000'),3)+1, 3, 0)),  '2018-09-01', '2018-12-31', 'CL004', 'BC001');

COMMIT;







-- 개설 과목 정보
-- Java과정(2017) -> Java(3개월) Oracle(3개월) HTML(1개월) / minjong
-- AI 과정(2017) -> Java(2개월) /minjong ,  AI(1개월) / siwan
-- Java과정(2017~2018) -> Java(3개월) Oracle(3개월) HTML(1개월) / minjong
-- AI 과정(2018) -> AI(1개월) /siwan , Java(2개월) /bogum 
-- DB 과정(2018상반기) -> AI(1개월) /siwan, Oracle(2개월) /bogum
-- DB 과정(2018하반기) -> AI(1개월) /siwan, Oracle(2개월) /bogum

-- 개설 과목> Java과정(2017) 
INSERT INTO offered_subjects(os_id, os_start_date, os_end_date, bs_id, textbook_id, instructor_id, oc_id) 
VALUES(CONCAT('OS', LPAD(SUBSTR(NVL((SELECT MAX(os_id) FROM offered_subjects),'OS000'),3)+1, 3, 0)),
    '2017-01-01', '2017-03-31','BS001', 'TX001', 'S002', 'OC001');
INSERT INTO offered_subjects(os_id, os_start_date, os_end_date, bs_id, textbook_id, instructor_id, oc_id) 
VALUES(CONCAT('OS', LPAD(SUBSTR(NVL((SELECT MAX(os_id) FROM offered_subjects),'OS000'),3)+1, 3, 0)),
    '2017-04-01', '2017-06-30','BS002', 'TX002', 'S002', 'OC001');
INSERT INTO offered_subjects(os_id, os_start_date, os_end_date, bs_id, textbook_id, instructor_id, oc_id) 
VALUES(CONCAT('OS', LPAD(SUBSTR(NVL((SELECT MAX(os_id) FROM offered_subjects),'OS000'),3)+1, 3, 0)),
    '2017-07-01', '2017-07-31','BS003', 'TX003', 'S002', 'OC001');


-- 개설 과목> AI과정(2017) 
INSERT INTO offered_subjects(os_id, os_start_date, os_end_date, bs_id, textbook_id, instructor_id, oc_id) 
VALUES(CONCAT('OS', LPAD(SUBSTR(NVL((SELECT MAX(os_id) FROM offered_subjects),'OS000'),3)+1, 3, 0)),
    '2017-08-01', '2017-09-30','BS001', 'TX001', 'S002', 'OC002');
INSERT INTO offered_subjects(os_id, os_start_date, os_end_date, bs_id, textbook_id, instructor_id, oc_id) 
VALUES(CONCAT('OS', LPAD(SUBSTR(NVL((SELECT MAX(os_id) FROM offered_subjects),'OS000'),3)+1, 3, 0)),
    '2017-10-01', '2017-10-31','BS004', 'TX004', 'S003', 'OC002');



-- 개설 과목> Java과정(2017~2018) 
INSERT INTO offered_subjects(os_id, os_start_date, os_end_date, bs_id, textbook_id, instructor_id, oc_id) 
VALUES(CONCAT('OS', LPAD(SUBSTR(NVL((SELECT MAX(os_id) FROM offered_subjects),'OS000'),3)+1, 3, 0)),
    '2017-11-01', '2018-01-31','BS001', 'TX001', 'S002', 'OC003');
INSERT INTO offered_subjects(os_id, os_start_date, os_end_date, bs_id, textbook_id, instructor_id, oc_id) 
VALUES(CONCAT('OS', LPAD(SUBSTR(NVL((SELECT MAX(os_id) FROM offered_subjects),'OS000'),3)+1, 3, 0)),
    '2018-02-01', '2018-04-30','BS002', 'TX002', 'S002', 'OC003');
INSERT INTO offered_subjects(os_id, os_start_date, os_end_date, bs_id, textbook_id, instructor_id, oc_id) 
VALUES(CONCAT('OS', LPAD(SUBSTR(NVL((SELECT MAX(os_id) FROM offered_subjects),'OS000'),3)+1, 3, 0)),
    '2018-05-01', '2018-05-31','BS003', 'TX003', 'S002', 'OC003');


-- 개설 과목> AI과정(2018) 
INSERT INTO offered_subjects(os_id, os_start_date, os_end_date, bs_id, textbook_id, instructor_id, oc_id) 
VALUES(CONCAT('OS', LPAD(SUBSTR(NVL((SELECT MAX(os_id) FROM offered_subjects),'OS000'),3)+1, 3, 0)),
    '2018-01-01', '2018-01-31','BS004', 'TX004', 'S003', 'OC004');
INSERT INTO offered_subjects(os_id, os_start_date, os_end_date, bs_id, textbook_id, instructor_id, oc_id) 
VALUES(CONCAT('OS', LPAD(SUBSTR(NVL((SELECT MAX(os_id) FROM offered_subjects),'OS000'),3)+1, 3, 0)),
    '2018-02-01', '2018-03-31','BS001', 'TX001', 'S007', 'OC004');


-- 개설 과목> DB 과정(2018상반기)
INSERT INTO offered_subjects(os_id, os_start_date, os_end_date, bs_id, textbook_id, instructor_id, oc_id) 
VALUES(CONCAT('OS', LPAD(SUBSTR(NVL((SELECT MAX(os_id) FROM offered_subjects),'OS000'),3)+1, 3, 0)),
    '2018-03-01', '2018-03-31','BS004', 'TX004', 'S003', 'OC005');
INSERT INTO offered_subjects(os_id, os_start_date, os_end_date, bs_id, textbook_id, instructor_id, oc_id) 
VALUES(CONCAT('OS', LPAD(SUBSTR(NVL((SELECT MAX(os_id) FROM offered_subjects),'OS000'),3)+1, 3, 0)),
    '2018-04-01', '2018-05-31','BS002', 'TX002', 'S007', 'OC005');


-- 개설 과목> DB 과정(2018하반기)
INSERT INTO offered_subjects(os_id, os_start_date, os_end_date, bs_id, textbook_id, instructor_id, oc_id) 
VALUES(CONCAT('OS', LPAD(SUBSTR(NVL((SELECT MAX(os_id) FROM offered_subjects),'OS000'),3)+1, 3, 0)),
    '2018-06-01', '2018-06-30','BS004', 'TX004', 'S003', 'OC006');
INSERT INTO offered_subjects(os_id, os_start_date, os_end_date, bs_id, textbook_id, instructor_id, oc_id) 
VALUES(CONCAT('OS', LPAD(SUBSTR(NVL((SELECT MAX(os_id) FROM offered_subjects),'OS000'),3)+1, 3, 0)),
    '2018-07-01', '2018-08-31','BS002', 'TX002', 'S007', 'OC006');
    

COMMIT;    







-- 과정 history 정보
INSERT INTO course_history(oc_id, student_id) VALUES ('OC001','S004');
INSERT INTO course_history(oc_id, student_id) VALUES ('OC002','S004');
INSERT INTO course_history(oc_id, student_id) VALUES ('OC002','S005');
INSERT INTO course_history(oc_id, student_id) VALUES ('OC003','S004');
INSERT INTO course_history(oc_id, student_id) VALUES ('OC003','S005');
INSERT INTO course_history(oc_id, student_id) VALUES ('OC003','S006');
INSERT INTO course_history(oc_id, student_id) VALUES ('OC004','S008');
INSERT INTO course_history(oc_id, student_id) VALUES ('OC004','S009');
INSERT INTO course_history(oc_id, student_id) VALUES ('OC006','S011');
INSERT INTO course_history(oc_id, student_id) VALUES ('OC003','S012');
INSERT INTO course_history(oc_id, student_id) VALUES ('OC002','S013');
INSERT INTO course_history(oc_id, student_id) VALUES ('OC004','S013');
INSERT INTO course_history(oc_id, student_id) VALUES ('OC001','S014');
INSERT INTO course_history(oc_id, student_id) VALUES ('OC006','S014');

COMMIT;






 
-- 중도탈락 정보
INSERT INTO dropouts(oc_id, student_id, dropout_date) VALUES ('OC001','S004','2017-01-31');
INSERT INTO dropouts(oc_id, student_id, dropout_date) VALUES ('OC002','S013','2017-10-01');

COMMIT;






-- 시험 정보 
INSERT INTO exams(os_id, exam_date, exam_file)
VALUES('OS001', '17/03/31', 'Java_test_2017.zip');
INSERT INTO exams(os_id, exam_date, exam_file)
VALUES('OS002', '17/06/30', 'Oracle_test_2017.zip');
INSERT INTO exams(os_id, exam_date, exam_file)
VALUES('OS003', '17/07/31', 'HTML_test_2017.zip');
INSERT INTO exams(os_id, exam_date, exam_file)
VALUES('OS004', '17/09/30', 'Java(AI)_test_2017.zip');
INSERT INTO exams(os_id, exam_date, exam_file)
VALUES('OS005', '17/10/31', 'AI(AI)_test_2017.zip');
INSERT INTO exams(os_id, exam_date, exam_file)
VALUES('OS006', '18/01/31', 'Java_test_2018.zip');

COMMIT;






-- 배점 정보
INSERT INTO score_percentages(os_id, attendance_percentage, writing_percentage, practice_percentage)
VALUES('OS001', 20, 40, 40);
INSERT INTO score_percentages(os_id, attendance_percentage, writing_percentage, practice_percentage)
VALUES('OS002', 20, 50, 30);
INSERT INTO score_percentages(os_id, attendance_percentage, writing_percentage, practice_percentage)
VALUES('OS003', 20, 60, 20);
INSERT INTO score_percentages(os_id, attendance_percentage, writing_percentage, practice_percentage)
VALUES('OS004', 20, 40, 40);
INSERT INTO score_percentages(os_id, attendance_percentage, writing_percentage, practice_percentage)
VALUES('OS005', 30, 30, 40);
INSERT INTO score_percentages(os_id, attendance_percentage, writing_percentage, practice_percentage)
VALUES('OS006', 20, 40, 40);


COMMIT;





-- 성적 정보
INSERT INTO scores(score_id, attendance_score, writing_score, practice_score, student_id, os_id)
VALUES(CONCAT('SC', LPAD(SUBSTR(NVL((SELECT MAX(score_id) FROM scores),'SC000'),3)+1, 3, 0)), 15 , 35 , 30 ,'S004', 'OS004');
INSERT INTO scores(score_id, attendance_score, writing_score, practice_score, student_id, os_id)
VALUES(CONCAT('SC', LPAD(SUBSTR(NVL((SELECT MAX(score_id) FROM scores),'SC000'),3)+1, 3, 0)), 20 , 40 , 20 ,'S005', 'OS004');
INSERT INTO scores(score_id, attendance_score, writing_score, practice_score, student_id, os_id)
VALUES(CONCAT('SC', LPAD(SUBSTR(NVL((SELECT MAX(score_id) FROM scores),'SC000'),3)+1, 3, 0)), 20 , 20 , 40 ,'S004', 'OS005');
INSERT INTO scores(score_id, attendance_score, writing_score, practice_score, student_id, os_id)
VALUES(CONCAT('SC', LPAD(SUBSTR(NVL((SELECT MAX(score_id) FROM scores),'SC000'),3)+1, 3, 0)), 30 , 30 , 30 ,'S005', 'OS005');
INSERT INTO scores(score_id, attendance_score, writing_score, practice_score, student_id, os_id) 
VALUES(CONCAT('SC', LPAD(SUBSTR(NVL((SELECT MAX(score_id) FROM scores),'SC000'),3)+1, 3, 0)), 20 , 30 , 40 ,'S004', 'OS006');
INSERT INTO scores(score_id, attendance_score, writing_score, practice_score, student_id, os_id) 
VALUES(CONCAT('SC', LPAD(SUBSTR(NVL((SELECT MAX(score_id) FROM scores),'SC000'),3)+1, 3, 0)), 10 , 40 , 40 ,'S005', 'OS006');
INSERT INTO scores(score_id, attendance_score, writing_score, practice_score, student_id, os_id) 
VALUES(CONCAT('SC', LPAD(SUBSTR(NVL((SELECT MAX(score_id) FROM scores),'SC000'),3)+1, 3, 0)), 20 , 40 , 30 ,'S006', 'OS006');
INSERT INTO scores(score_id, attendance_score, writing_score, practice_score, student_id, os_id) 
VALUES(CONCAT('SC', LPAD(SUBSTR(NVL((SELECT MAX(score_id) FROM scores),'SC000'),3)+1, 3, 0)), 10 , 10 , 10 ,'S013', 'OS004');
INSERT INTO scores(score_id, attendance_score, writing_score, practice_score, student_id, os_id) 
VALUES(CONCAT('SC', LPAD(SUBSTR(NVL((SELECT MAX(score_id) FROM scores),'SC000'),3)+1, 3, 0)), 20, 30, 40 ,'S014', 'OS001');
INSERT INTO scores(score_id, attendance_score, writing_score, practice_score, student_id, os_id) 
VALUES(CONCAT('SC', LPAD(SUBSTR(NVL((SELECT MAX(score_id) FROM scores),'SC000'),3)+1, 3, 0)), 20, 50, 30 ,'S014', 'OS002');
INSERT INTO scores(score_id, attendance_score, writing_score, practice_score, student_id, os_id) 
VALUES(CONCAT('SC', LPAD(SUBSTR(NVL((SELECT MAX(score_id) FROM scores),'SC000'),3)+1, 3, 0)), 20, 50, 20 ,'S014', 'OS003');

COMMIT;





-----------------------------------------------------------------------
-- 3차 프로젝트 수정
-----------------------------------------------------------------------
-- 교재(textbook) 테이블 수정 쿼리
UPDATE textbooks
SET ISBN='9788968481475', publisher='한빛미디어'
WHERE textbook_id='TX001';

UPDATE textbooks
SET ISBN='9791162240489', publisher='한빛미디어'
WHERE textbook_id='TX002';

UPDATE textbooks
SET ISBN='9791156643074', textbook_title = 'HTML5 웹 프로그래밍 입문', publisher='한빛아카데미'
WHERE textbook_id='TX003';

UPDATE textbooks
SET ISBN='9791156923107', textbook_title = 'AI는 세상을 이렇게 바꾼다', publisher='문운당'
WHERE textbook_id='TX004';


--로그인(login) 테이블 수정 쿼리 (프로필 사진 추가)
UPDATE login
SET profile_img='avatar.png'
WHERE access_id='LV003';

UPDATE login
SET profile_img='instructor.png'
WHERE access_id='LV002';

UPDATE login
SET profile_img='manager.png'
WHERE access_id='LV001';


--로그인(login) 테이블 수정 쿼리 (pw 추가)
UPDATE login
SET pw=ssn;



-- 과정 history 정보
INSERT INTO course_history(oc_id, student_id) VALUES ('OC005','S014');