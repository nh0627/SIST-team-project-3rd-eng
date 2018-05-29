--[COURSE_HISTORY_DROPOUTS_VIEW] 
CREATE OR REPLACE VIEW course_history_dropouts_view
AS
SELECT ch.oc_id, ch.student_id, dropout_date 
FROM course_history ch, dropouts d WHERE ch.oc_id=d.oc_id(+) AND ch.student_id=d.student_id(+);

--[INSTRUCTOR_2_1_VIEW]
CREATE OR REPLACE VIEW instructor_2_1_view
AS
SELECT osv.os_id, bs_name, os_start_date, os_end_date, bc_title, oc_start_date, oc_end_date, classroom_name, textbook_title, publisher, isbn, instructor_id, profile_img,
    (SELECT COUNT(*) FROM course_history WHERE oc_id=osv.oc_id) registerred_number, 
    CASE
    WHEN (SYSDATE>=os_start_date AND SYSDATE<os_end_date) THEN '강의중'
    WHEN (SYSDATE<os_start_date) THEN '강의예정'
    WHEN (SYSDATE>=os_end_date) THEN '강의종료'
    END course_status
FROM os_detail_view osv,  basic_courses bc, classrooms cl
WHERE osv.bc_id=bc.bc_id
AND osv.classroom_id=cl.classroom_id;

--[INSTRUCTOR_2_2_VIEW]
CREATE OR REPLACE VIEW instructor_2_2_view
AS
SELECT oc.oc_id, os_id, sv.student_id, name_, profile_img, phone, initial_reg_date, 
    CASE
    WHEN (dropout_date IS NOT NULL) THEN '중도 탈락'
    WHEN (dropout_date IS NULL) AND (oc_end_date>SYSDATE) THEN '수료 예정'
    WHEN (dropout_date IS NULL) AND (oc_end_date<=SYSDATE) THEN '수료'
    END
    learning_status,
    NVL(dropout_date, oc_end_date)course_end_date, 
    instructor_id
FROM student_detail_view sv, course_history_dropouts_view hv, offered_courses oc, offered_subjects os
WHERE sv.student_id=hv.student_id
AND hv.oc_id=oc.oc_id
AND oc.oc_id=os.oc_id;

--[INSTRUCTOR_31_VIEW]
CREATE OR REPLACE VIEW instructor_31_view
AS
SELECT osv.os_id, bs_name, os_start_date, os_end_date, oc_title, ocv.oc_start_date, ocv.oc_end_date, classroom_name, textbook_title, isbn, publisher,
    NVL(attendance_percentage, 0) attendance_percentage, NVL(writing_percentage, 0) writing_percentage, NVL(practice_percentage, 0) practice_percentage,
    (SELECT COUNT(*) FROM course_history WHERE oc_id=ocv.oc_id) registerred_number,
    instructor_id, profile_img
FROM os_detail_view osv, oc_detail_view ocv, score_percentages sp
WHERE osv.oc_id=ocv.oc_id
AND osv.os_id=sp.os_id(+)
AND os_end_date <= SYSDATE;

--[INSTRUCTOR_32_1_VIEW]
CREATE OR REPLACE VIEW instructor_32_1_view
AS
SELECT osv.os_id, osv.bs_name, os_start_date, os_end_date, oc_title, ocv.oc_start_date, ocv.oc_end_date, classroom_name, textbook_title, isbn, publisher,
    NVL(attendance_percentage, 0) attendance_percentage, NVL(writing_percentage, 0) writing_percentage, NVL(practice_percentage, 0) practice_percentage,
    (SELECT COUNT(*) FROM course_history WHERE oc_id=ocv.oc_id) registerred_number, instructor_id, profile_img
FROM offered_subjects_scores_view osv, oc_detail_view ocv, score_percentages sp, textbooks t, login l
WHERE osv.oc_id=ocv.oc_id
AND osv.os_id=sp.os_id(+)
AND osv.textbook_id=t.textbook_id
AND instructor_id=login_id
AND attendance_percentage IS NOT NULL
AND osv.student_id IS NULL;

--[INSTRUCTOR_32_2_VIEW]
CREATE OR REPLACE VIEW instructor_32_2_view
AS
SELECT os.os_id,attendance_percentage,writing_percentage, practice_percentage, os_start_date, os_end_date,bs_id, textbook_id, instructor_id, oc_id
FROM score_percentages sp, offered_subjects os
WHERE sp.os_id=os.os_id;
[INSTRUCTOR_33_1_VIEW]
CREATE OR REPLACE VIEW instructor_33_1_view
AS
SELECT os.os_id, bs_name, os_start_date, os_end_date, oc_title, oc.oc_start_date, oc.oc_end_date, classroom_name, textbook_title, isbn, publisher, exam_date, exam_file, instructor_id, os.profile_img
FROM os_detail_view os, oc_detail_view oc, exams ex
WHERE os.oc_id=oc.oc_id
AND os.os_id=ex.os_id(+)
AND os_end_date <= SYSDATE;

--[INSTRUCTOR_33_2_VIEW]
CREATE OR REPLACE VIEW instructor_33_2_view
AS 
SELECT ex.os_id, exam_date, exam_file, os_start_date, os_end_date, bs_id, textbook_id, instructor_id, oc_id
FROM exams ex, offered_subjects os
WHERE ex.os_id=os.os_id;

--[INSTRUCTOR_41_1_VIEW]
CREATE OR REPLACE VIEW instructor_41_1_view
AS
SELECT osv.os_id, bs_name, os_start_date, os_end_date, oc_title, ocv.oc_start_date, ocv.oc_end_date, classroom_name, textbook_title, isbn, publisher,
    NVL(attendance_percentage,0) attendance_percentage,
    NVL(writing_percentage,0) writing_percentage,
    NVL(practice_percentage,0) practice_percentage,
    exam_date,
    (SELECT COUNT(*) FROM scores WHERE os_id=osv.os_id)||'/'||(SELECT COUNT(*) FROM course_history WHERE osv.oc_id=oc_id) score_added_number,
    instructor_id, profile_img
FROM os_detail_view osv, oc_detail_view ocv, score_percentages sp, exams ex
WHERE osv.oc_id=ocv.oc_id
AND osv.os_id=sp.os_id(+)
AND osv.os_id=ex.os_id(+);

--[INSTRUCTOR_41_2_VIEW]
CREATE OR REPLACE VIEW instructor_41_2_view
AS
SELECT olv.os_id, olv.student_id, name_, profile_img, phone, learning_status, course_end_date,
    attendance_score, writing_score, practice_score, (attendance_score+writing_score+practice_score) total_score, instructor_id
FROM os_learning_status_view olv, scores s
WHERE olv.student_id=s.student_id(+)
AND olv.os_id=s.os_id(+);

--[INSTRUCTOR_42_1_VIEW] 
CREATE OR REPLACE VIEW insturctor_42_1_view
AS
SELECT osv.os_id, bs_name, os_start_date, os_end_date, oc_title, ocv.oc_start_date, ocv.oc_end_date, classroom_name, textbook_title, isbn, publisher,
    attendance_percentage, writing_percentage, practice_percentage, exam_date,
    (SELECT COUNT(*) FROM scores WHERE os_id=osv.os_id)||'/'||(SELECT COUNT(*) FROM course_history WHERE oc_id=osv.oc_id) score_added_number,
    instructor_id, profile_img
FROM os_detail_view osv, oc_detail_view ocv, score_percentages sp, exams ex
WHERE osv.oc_id=ocv.oc_id
AND osv.os_id=sp.os_id
AND osv.os_id=ex.os_id
AND exam_date<=SYSDATE;


--[INSTRUCTOR_42_2_VIEW] 
CREATE OR REPLACE VIEW instructor_42_2_view
AS
SELECT olv.os_id, olv.student_id, name_, profile_img, phone, learning_status, course_end_date,
    attendance_score, writing_score, practice_score, (attendance_score+writing_score+practice_score) total_score, instructor_id
FROM os_learning_status_view olv, scores s
WHERE olv.student_id=s.student_id(+)
AND olv.os_id=s.os_id(+);


--[INSTRUCTOR_43_1_VIEW]
CREATE OR REPLACE VIEW instructor_43_1_view
AS
SELECT osv.os_id, bs_name, os_start_date, os_end_date, oc_title, ocv.oc_start_date, ocv.oc_end_date, classroom_name, textbook_title,
    attendance_percentage, writing_percentage, practice_percentage, exam_date,
    (SELECT COUNT(*) FROM scores WHERE os_id=osv.os_id)||'/'||(SELECT COUNT(*) FROM course_history WHERE oc_id=osv.oc_id) score_added_number, instructor_id
FROM os_detail_view osv, oc_detail_view ocv, score_percentages sp, exams ex
WHERE osv.oc_id=ocv.oc_id
AND osv.os_id=sp.os_id
AND osv.os_id=ex.os_id
AND exam_date<=SYSDATE
AND (SELECT COUNT(*) FROM scores WHERE os_id=osv.os_id)>0;

--[INSTRUCTOR_43_2_VIEW]
CREATE OR REPLACE VIEW instructor_43_2_view
AS
SELECT olv.os_id, score_id, olv.student_id, name_, phone, learning_status, course_end_date,
    attendance_score, writing_score, practice_score, (attendance_score+writing_score+practice_score) total_score, instructor_id
FROM os_learning_status_view olv, scores s
WHERE olv.student_id=s.student_id(+)
AND olv.os_id=s.os_id(+)
ORDER BY os_id;


--[INSTRUCTOR_AVAILABLE_VIEW]
CREATE OR REPLACE VIEW instructor_available_view
AS
SELECT i.instructor_id, REPLACE(LISTAGG(bs_name,'/') WITHIN GROUP(ORDER BY i.instructor_id),' ','') available_subjects
FROM instructor_detail_view i , basic_subjects b
WHERE i.bs_id=b.bs_id(+)
GROUP BY i.instructor_id;

--[INSTRUCTOR_DETAIL_VIEW]
CREATE OR REPLACE VIEW instructor_detail_view
AS 
SELECT i.instructor_id, bs_id, instructor_reg_date, name_, ssn, phone, profile_img, initial_reg_date, access_id, login_id
FROM instructors i, login l, available_subjects a
WHERE i.instructor_id=l.login_id
AND i.instructor_id=a.instructor_id(+);


--[INSTRUCTOR_LOGIN_AVAIL_VIEW]
CREATE OR REPLACE VIEW instructor_login_avail_view
AS
SELECT i.instructor_id,  name_, ssn, phone, profile_img, instructor_reg_date,REPLACE(available_subjects,' ','') available_subjects, access_id
FROM instructors i, login l, instructor_available_view iav
WHERE i.instructor_id=l.login_id
AND i.instructor_id=iav.instructor_id;


--[INSTRUCTOR_LOGIN_VIEW]
CREATE OR REPLACE VIEW instructor_login_view
AS
SELECT instructor_id, instructor_reg_date, name_, ssn, profile_img, phone, initial_reg_date, access_id
FROM instructors i, login l
WHERE i.instructor_id=l.login_id;


--[LOGIN_ACCESS_VIEW]
CREATE OR REPLACE VIEW login_access_view
AS
SELECT name_, ssn, login_id, phone, pw, l.profile_img, initial_reg_date, l.access_id, access_name FROM login l, access_level al WHERE l.access_id = al.access_id;

--[MANAGER_22_1_VIEW]
CREATE OR REPLACE VIEW manager_22_1_view
AS
SELECT i.instructor_id, name_, ssn, phone, profile_img, NVL(available_subjects, '-') available_subjects, instructor_reg_date
FROM login l, instructors i, instructor_available_view iav
WHERE l.login_id=i.instructor_id
AND i.instructor_id = iav.instructor_id 
AND access_id='LV002'
ORDER BY i.instructor_id;

--[MANAGER_22_2_VIEW]
CREATE OR REPLACE VIEW manager_22_2_view
AS
SELECT osv.os_id, bs_name os_name, os_start_date, os_end_date, bc_title oc_title, oc_start_date, oc_end_date, classroom_name, 
    CASE
    WHEN (SYSDATE>=os_start_date AND SYSDATE<os_end_date) THEN '강의중'
    WHEN (SYSDATE<os_start_date) THEN '강의예정'
    WHEN (SYSDATE>=os_end_date) THEN '강의종료'
    END course_status 
    ,instructor_id, name_, l.profile_img, ssn
FROM os_detail_view osv,  basic_courses bc, classrooms cl, login l
WHERE osv.bc_id=bc.bc_id
AND osv.classroom_id=cl.classroom_id
AND osv.instructor_id=l.login_id;

--[MANAGER_23_VIEW]
CREATE OR REPLACE VIEW manager_23_view
AS
SELECT i.instructor_id, name_, ssn, phone, profile_img, NVL(available_subjects, '-') available_subjects, instructor_reg_date,
    (DECODE((SELECT COUNT(*) FROM offered_subjects WHERE instructor_id=i.instructor_id),0,'Y','N')) delete_status
FROM login l, instructors i, instructor_available_view iav
WHERE l.login_id=i.instructor_id
AND i.instructor_id = iav.instructor_id 
AND access_id='LV002';

--[MANAGER_32_1_VIEW] 
CREATE OR REPLACE VIEW manager_32_1_view
AS
SELECT oc_id, os_id, bs_name os_name, os_start_date, os_end_date, textbook_title, publisher, isbn, name_, l.profile_img
FROM os_detail_view osv, login l
WHERE osv.instructor_id=l.login_id;


--[MANAGER_32_2_VIEW]
CREATE OR REPLACE VIEW manager_32_2_view
AS
SELECT chv.oc_id,  chv.student_id, name_, profile_img, ssn, phone, initial_reg_date,
    CASE 
    WHEN dropout_date IS NOT NULL THEN '중도 탈락'
    WHEN (dropout_date IS NULL) AND (oc_end_date > SYSDATE) THEN '수료 예정'
    WHEN (dropout_date IS NULL) AND (oc_end_date <= SYSDATE) THEN '수료'
    END learning_status,
    NVL(dropout_date, oc_end_date) course_end_date
FROM course_history_dropouts_view chv, student_detail_view sdv, offered_courses oc
WHERE chv.student_id=sdv.student_id
AND chv.oc_id=oc.oc_id;

--[MANAGER_33_VIEW]
CREATE OR REPLACE VIEW manager_33_view
AS
SELECT oc_id, oc_title, oc_start_date, oc_end_date, classroom_name, subject_offered_number,registerred_number,
        CASE
        WHEN ((SELECT COUNT(*) FROM course_history WHERE oc_id=odv.oc_id)=0) AND (SYSDATE<oc_start_date) THEN 'Y'
        ELSE 'N'
        END delete_status,
        CASE
        WHEN (SYSDATE>=oc_start_date AND SYSDATE<oc_end_date) THEN '강의중'
        WHEN (SYSDATE<oc_start_date) THEN '강의예정'
        WHEN (SYSDATE>=oc_end_date) THEN '강의종료'
        END course_status
FROM oc_detail_count_view odv;

--[MANAGER_52_VIEW]
CREATE OR REPLACE VIEW manager_52_view
AS 
SELECT student_id, name_, ssn, phone, initial_reg_date, profile_img, registration_count
    , CASE
     WHEN ((SELECT COUNT(*) FROM course_history ch WHERE ch.student_id = sdv.student_id) > 0) THEN 'N'
     ELSE 'Y'
     END AS deleteCheck 
FROM student_detail_view sdv ORDER BY sdv.student_id;

--[MANAGER_61_VIEW]
CREATE OR REPLACE VIEW manager_61_view
AS
SELECT o.os_id, o.os_name, o.os_start_date, o.os_end_date, o.textbook_title, o.publisher, o.isbn, o.name_, o.profile_img, o.oc_id, oc_title, oc_start_date, oc_end_date, available_subjects,
classroom_name, o.attendance_percentage, o.writing_percentage, o.practice_percentage, exam_date, exam_file 
FROM os_de_login_percentages_view o, oc_detail_view ocv, exams e 
WHERE o.os_id = e.os_id(+)
AND o.oc_id=ocv.oc_id;

--[OC_DE_CO_HIS_DROP_VIEW]
CREATE OR REPLACE VIEW oc_de_co_his_drop_view
AS
SELECT student_id, oc.oc_id, oc_title, oc.oc_start_date, oc.oc_end_date, oc.classroom_name
    , CASE
            WHEN (chd.dropout_date < oc.oc_end_date) THEN '중도 탈락'
            WHEN (oc.oc_end_date < SYSDATE) THEN '수료'
            WHEN (oc.oc_end_date > SYSDATE) THEN '수료 예정'
            ELSE '미정'
          END AS learning_status
    , CASE
        WHEN (chd.dropout_date < oc.oc_end_date) THEN dropout_date
        ELSE oc.oc_end_date 
        END AS course_end_date
FROM oc_detail_view oc, course_history_dropouts_view chd
WHERE oc.oc_id = chd.oc_id(+);

--[OC_DETAIL_COUNT_VIEW]
CREATE OR REPLACE VIEW oc_detail_count_view
AS  
SELECT oc_id, oc_title, oc_start_date, oc_end_date, classroom_name, 
        (SELECT COUNT(*) FROM offered_subjects WHERE oc_id=ocv.oc_id) subject_offered_number,
        (SELECT COUNT(*) FROM course_history WHERE oc_id=ocv.oc_id) registerred_number
FROM oc_detail_view ocv;

--[OC_DETAIL_VIEW]
CREATE OR REPLACE VIEW oc_detail_view
AS
SELECT oc.oc_id, bc.bc_title AS oc_title, oc.oc_start_date, oc.oc_end_date, c.classroom_name,
    CASE
    WHEN oc_start_date> SYSDATE THEN 'Y'
    ELSE 'N'
    END delete_status
FROM offered_courses oc, basic_courses bc, classrooms c
WHERE oc.bc_id=bc.bc_id AND oc.classroom_id=c.classroom_id;


--[OC_OS_LOGIN_DETAIL_VIEW]
CREATE OR REPLACE VIEW oc_os_login_detail_view
AS
SELECT oc.oc_id, oc_title, oc.oc_start_date, oc.oc_end_date, oc.classroom_name
        , os.os_id, os.bs_name AS os_name, os_start_date, os_end_date, os.textbook_title, os.isbn, l.name_, l.profile_img
FROM oc_detail_view oc, os_detail_view os, login l WHERE oc.oc_id = os.oc_id AND os.instructor_id = l.login_id ORDER BY os_id;

--[OFFERED_SUBJECTS_SCORES_VIEW]
CREATE OR REPLACE VIEW offered_subjects_scores_view
AS
SELECT  oc_id, os.os_id,  bs_name, student_id, os_start_date, os_end_date, os.bs_id, textbook_id, instructor_id,  score_id, attendance_score, writing_score, practice_score
FROM offered_subjects os, scores s, basic_subjects bs
WHERE os.os_id=s.os_id(+)
AND os.bs_id=bs.bs_id
ORDER BY os.os_id;

--[OS_DE_LO_PER_SCO_EX_VIEW] 
CREATE OR REPLACE VIEW os_de_lo_per_sco_ex_view
AS
SELECT o.os_id, o.os_name, o.os_start_date, o.os_end_date, o.textbook_title, o.publisher, o.isbn, o.name_, o.profile_img,o.oc_id, o.attendance_percentage, o.writing_percentage, o.practice_percentage
    , o.score_id, o.student_id, o.attendance_score, o.writing_score, o.practice_score, o.total_score, e.exam_date, e.exam_file, available_subjects
FROM os_de_lo_per_sco_view o, exams e WHERE o.os_id = e.os_id(+);

--[OS_DE_LO_PER_SCO_VIEW]
CREATE OR REPLACE VIEW os_de_lo_per_sco_view
AS
SELECT o.os_id, o.os_name, o.os_start_date, o.os_end_date, o.textbook_title, o.publisher, o.isbn, o.name_, o.profile_img, o.oc_id, o.attendance_percentage, o.writing_percentage, o.practice_percentage
    , s.score_id, s.student_id, s.attendance_score, s.writing_score, s.practice_score, (s.attendance_score + s.writing_score + s.practice_score) AS total_score, available_subjects
FROM os_de_login_percentages_view o, scores s WHERE o.os_id = s.os_id(+);

--[OS_DE_LOGIN_PERCENTAGES_VIEW]
CREATE OR REPLACE VIEW os_de_login_percentages_view
AS
SELECT odv.os_id, odv.bs_name AS os_name, odv.os_start_date, odv.os_end_date, textbook_title, publisher, isbn, l.name_, l.profile_img, odv.oc_id, sp.attendance_percentage, sp.writing_percentage, sp.practice_percentage, available_subjects,
    CASE
    WHEN os_start_date> SYSDATE THEN 'Y'
    ELSE 'N'
    END delete_status
FROM os_detail_view odv, login l, score_percentages sp, INSTRUCTOR_AVAILABLE_VIEW avv
WHERE login_id = odv.instructor_id AND odv.os_id = sp.os_id(+) AND odv.instructor_id=avv.instructor_id
ORDER BY odv.os_id; 

--[OS_DETAIL_VIEW]
CREATE OR REPLACE VIEW os_detail_view
AS
SELECT os.os_id, os_start_date, os_end_date, os.bs_id, bs_name, os.textbook_id, textbook_title, publisher, isbn, os.instructor_id, l.profile_img, os.oc_id, oc_start_date, oc_end_date, classroom_id, bc_id
FROM offered_subjects os, basic_subjects bs, textbooks t, instructors i, login l, offered_courses oc
WHERE os.bs_id = bs.bs_id
AND os.textbook_id=t.textbook_id
AND os.instructor_id=i.instructor_id
AND os.oc_id=oc.oc_id
AND i.instructor_id=l.login_id
ORDER BY os_id; 

--[OS_LEARNING_STATUS_SCORE_VIEW]
CREATE OR REPLACE VIEW os_learning_status_score_view
AS
SELECT oc_id, olv.os_id, olv.student_id, name_, phone, profile_img, learning_status, course_end_date, score_id,
    attendance_score, writing_score, practice_score, (attendance_score+writing_score+practice_score) total_score,
    instructor_id
FROM os_learning_status_view olv, scores s
WHERE olv.student_id=s.student_id(+)
AND olv.os_id=s.os_id(+);

--[OS_LEARNING_STATUS_VIEW]
 
CREATE OR REPLACE VIEW os_learning_status_view
AS
SELECT chv.oc_id, os.os_id, chv.student_id, name_, phone, profile_img,
    CASE 
    WHEN dropout_date IS NOT NULL THEN '중도탈락'
    WHEN (dropout_date IS NULL) AND (oc_end_date>SYSDATE) THEN '수료예정'
    WHEN (dropout_date IS NULL) AND (oc_end_date<SYSDATE) THEN '수료'
    END learning_status,
    NVL(dropout_date, oc_end_date) course_end_date,
    instructor_id
FROM course_history_dropouts_view chv, offered_subjects os, student_detail_view sdv, offered_courses oc
WHERE chv.oc_id=os.oc_id
AND chv.student_id=sdv.student_id
AND chv.oc_id=oc.oc_id;


--[STUDENT_DETAIL_VIEW]
CREATE OR REPLACE VIEW student_detail_view
AS
SELECT student_id, name_, ssn, phone, initial_reg_date
    , (SELECT COUNT(*) FROM course_history c WHERE c.student_id = s.student_id) AS registration_count, profile_img
FROM students s, login l WHERE s.student_id=l.login_id;
