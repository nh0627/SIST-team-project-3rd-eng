/***************** 테이블 생성 ********************/
-- 등급 정보 테이블
CREATE TABLE access_level(
      access_id VARCHAR2(5), --pk
      access_name NVARCHAR2(5)
      );

--로그인 정보 테이블
CREATE TABLE login(
      name_ NVARCHAR2(10), --pk
      ssn VARCHAR2(15), --pk
      phone VARCHAR2(15),
      initial_reg_date DATE,
      access_id VARCHAR2(5), --fk
      login_id VARCHAR2(5)
      );

-- 관리자 정보  테이블
CREATE TABLE managers(
      manager_id VARCHAR2(5), --pk, fk
      manager_reg_date DATE
      );
  
-- 강의실 정보 테이블
CREATE TABLE classrooms(
        classroom_id VARCHAR2(5),  --pk
        classroom_name NVARCHAR2(10),
        maximum NUMBER,
        manager_id VARCHAR2(5)  --fk
        );
         
-- 개설 과정 정보
CREATE TABLE offered_courses(
        oc_id VARCHAR2(5),  --pk
        oc_start_date DATE,
        oc_end_date DATE,
        classroom_id VARCHAR2(5), --fk
        bc_id VARCHAR2(5) --fk
        );

-- 기초 과정 정보
CREATE TABLE basic_courses(
        bc_id VARCHAR2(5),  --pk
        bc_title NVARCHAR2(40)
        );

-- 과정 history 정보
CREATE TABLE course_history (
        oc_id VARCHAR2(5),  --pk, fk
        student_id VARCHAR2(5)  --pk, fk
        );
 
-- 중도탈락 정보
CREATE TABLE dropouts(
      student_id VARCHAR2(5), --pk, fk
      oc_id VARCHAR2(5), --pk, fk
      dropout_date DATE
      );
 
-- 수강생 정보
CREATE TABLE students (
        student_id VARCHAR2(5),  --pk, fk
        student_reg_date DATE
        );

-- 성적 정보
CREATE TABLE scores (
      score_id VARCHAR2(5),  --pk
      attendance_score NUMBER,
      writing_score NUMBER,
      practice_score NUMBER,
      student_id VARCHAR2(5), --fk
      os_id VARCHAR2(5) --fk
      );
 
-- 개설 과목 정보
CREATE TABLE offered_subjects(
      os_id VARCHAR2(5),  --pk
      os_start_date DATE,
      os_end_date DATE,
      bs_id VARCHAR2(5), --fk
      textbook_id VARCHAR2(5), --fk
      instructor_id VARCHAR2(5), --fk
      oc_id VARCHAR2(5) --fk(CASCADE)
      );
 
-- 강사 정보
CREATE TABLE instructors(
      instructor_id VARCHAR2(5),  --pk, fk
      instructor_reg_date DATE
      );
 
-- 강의 가능 과목 정보
CREATE TABLE available_subjects(
      instructor_id VARCHAR2(5),  --pk, fk
      bs_id VARCHAR2(5)  --pk, fk
      );
 
-- 기초 과목 정보
CREATE TABLE basic_subjects(
      bs_id VARCHAR2(5),  --pk
      bs_name NVARCHAR2(10)
      );
 
-- 교재 정보
CREATE TABLE textbooks(
      textbook_id VARCHAR2(5),  --pk
      textbook_title NVARCHAR2(20),
      publisher NVARCHAR2(10)
      );
 
 
-- 시험 정보
CREATE TABLE exams(
      os_id VARCHAR2(5),  --pk, fk
      exam_date DATE,
      exam_file NVARCHAR2(40)
      );



-- 배점 정보
CREATE TABLE score_percentages(
      os_id VARCHAR2(5),  --pk, fk
      attendance_percentage NUMBER,
      writing_percentage NUMBER,
      practice_percentage NUMBER
      );
  


/***************** PK/ UNIQUE 제약 생성 ********************/
-- 등급 정보 테이블     
ALTER TABLE access_level
ADD CONSTRAINT access_level_access_id_pk PRIMARY KEY (access_id);

--로그인 정보 테이블
ALTER TABLE login
ADD CONSTRAINT login_name_ssn_pk PRIMARY KEY (name_, ssn); 
 
ALTER TABLE login
ADD CONSTRAINT login_login_id_uk UNIQUE (login_id);       

-- 관리자 정보  테이블
ALTER TABLE managers
ADD CONSTRAINT managers_manager_id_pk PRIMARY KEY (manager_id); 

-- 강의실 정보 테이블
ALTER TABLE classrooms
ADD CONSTRAINT classrooms_classroom_id_pk PRIMARY KEY (classroom_id); 

-- 개설 과정 정보
ALTER TABLE offered_courses
ADD CONSTRAINT oc_oc_id_pk PRIMARY KEY (oc_id);    

-- 기초 과정 정보
ALTER TABLE basic_courses
ADD CONSTRAINT bc_bc_id_pk PRIMARY KEY (bc_id);     

-- 과정 history 정보
ALTER TABLE course_history
ADD CONSTRAINT history_oc_id_student_id_pk PRIMARY KEY (oc_id, student_id);    
 
-- 중도탈락 정보
ALTER TABLE dropouts
ADD CONSTRAINT dropouts_student_id_oc_id_pk PRIMARY KEY (student_id, oc_id);    

-- 수강생 정보
ALTER TABLE students
ADD CONSTRAINT students_student_id_pk PRIMARY KEY (student_id);        

-- 성적 정보
ALTER TABLE scores
ADD CONSTRAINT scores_score_id_pk PRIMARY KEY (score_id);    

ALTER TABLE scores
ADD CONSTRAINT SCORES_STUDENT_ID_OS_ID UNIQUE (student_id, os_id);
 
-- 개설 과목 정보
ALTER TABLE offered_subjects
ADD CONSTRAINT os_os_id_pk PRIMARY KEY (os_id);    

-- 강사 정보
ALTER TABLE instructors
ADD CONSTRAINT instructors_instructor_id_pk PRIMARY KEY (instructor_id);     

-- 강의 가능 과목 정보
ALTER TABLE available_subjects
ADD CONSTRAINT avail_instructor_id_bs_id_pk PRIMARY KEY (instructor_id, bs_id);    

-- 기초 과목 정보
ALTER TABLE basic_subjects
ADD CONSTRAINT bs_bs_id_pk PRIMARY KEY (bs_id);    

-- 교재 정보
ALTER TABLE textbooks
ADD CONSTRAINT textbooks_textbook_id_pk PRIMARY KEY (textbook_id);    

-- 시험 정보
ALTER TABLE exams
ADD CONSTRAINT exams_os_id_pk PRIMARY KEY (os_id);    

-- 배점 정보
ALTER TABLE score_percentages
ADD CONSTRAINT score_percentages_os_id_pk PRIMARY KEY (os_id);     



/***************** FK/ CHECK 제약 생성 ********************/
--로그인 정보 테이블
ALTER TABLE login
ADD CONSTRAINT login_access_id_fk FOREIGN KEY (access_id)
REFERENCES access_level(access_id);   

-- 관리자 정보  테이블
ALTER TABLE managers
ADD CONSTRAINT managers_manager_id_fk FOREIGN KEY (manager_id)
REFERENCES login(login_id);  

-- 강의실 정보 테이블
ALTER TABLE classrooms
ADD CONSTRAINT classrooms_manager_id_fk FOREIGN KEY (manager_id)
REFERENCES managers(manager_id);  

-- 개설 과정 정보
ALTER TABLE offered_courses
ADD CONSTRAINT oc_classroom_id_fk FOREIGN KEY (classroom_id)  
REFERENCES classrooms(classroom_id);
 
ALTER TABLE offered_courses
ADD CONSTRAINT oc_bc_id_fk FOREIGN KEY (bc_id)
REFERENCES basic_courses(bc_id);   

-- 과정 history 정보
ALTER TABLE course_history
ADD CONSTRAINT history_oc_id_fk FOREIGN KEY (oc_id)
REFERENCES offered_courses(oc_id);   
 
ALTER TABLE course_history
ADD CONSTRAINT history_student_id_fk FOREIGN KEY (student_id)
REFERENCES students(student_id);   

-- 중도탈락 정보
ALTER TABLE dropouts
ADD CONSTRAINT dropouts_student_id_oc_id_fk FOREIGN KEY (student_id, oc_id)
REFERENCES course_history(student_id, oc_id);  
 
-- 수강생 정보
ALTER TABLE students
ADD CONSTRAINT students_student_id_fk FOREIGN KEY (student_id)
REFERENCES login(login_id)
ON DELETE CASCADE;  

-- 성적 정보
ALTER TABLE scores
ADD CONSTRAINT scores_student_id_fk FOREIGN KEY (student_id)
REFERENCES students(student_id);    
 
ALTER TABLE scores
ADD CONSTRAINT scores_os_id_fk FOREIGN KEY (os_id)
REFERENCES offered_subjects(os_id);  

-- 개설 과목 정보
ALTER TABLE offered_subjects
ADD CONSTRAINT os_bs_id_fk FOREIGN KEY (bs_id)
REFERENCES basic_subjects(bs_id);  
 
ALTER TABLE offered_subjects
ADD CONSTRAINT os_textbook_id_fk FOREIGN KEY (textbook_id)
REFERENCES textbooks(textbook_id);  
 
ALTER TABLE offered_subjects
ADD CONSTRAINT os_instructor_id_fk FOREIGN KEY (instructor_id)
REFERENCES instructors(instructor_id);  
 
ALTER TABLE offered_subjects
ADD CONSTRAINT os_oc_id_fk FOREIGN KEY (oc_id)
REFERENCES offered_courses(oc_id)
ON DELETE CASCADE;  

-- 강사 정보
ALTER TABLE instructors
ADD CONSTRAINT instructors_instructor_id_fk FOREIGN KEY (instructor_id)
REFERENCES login(login_id)
ON DELETE CASCADE;

-- 강의 가능 과목 정보
ALTER TABLE available_subjects
ADD CONSTRAINT avail_instructor_id_fk FOREIGN KEY (instructor_id)
REFERENCES instructors(instructor_id)
ON DELETE CASCADE;
 
ALTER TABLE available_subjects
ADD CONSTRAINT avail_bs_id_fk FOREIGN KEY (bs_id)
REFERENCES basic_subjects(bs_id);

-- 시험 정보
ALTER TABLE exams
ADD CONSTRAINT exams_os_id_fk FOREIGN KEY (os_id)
REFERENCES offered_subjects(os_id);

-- 배점 정보
ALTER TABLE score_percentages
ADD CONSTRAINT score_percentages_os_id_fk FOREIGN KEY (os_id)
REFERENCES offered_subjects(os_id);

ALTER TABLE score_percentages
ADD CONSTRAINT score_percentages_check
CHECK ((attendance_percentage>=20) AND (attendance_percentage + writing_percentage + practice_percentage) = 100);




-----------------------------------------------------------------------
-- 3차 프로젝트 수정
-----------------------------------------------------------------------
-- 교재(textbook) 테이블 수정 쿼리
ALTER TABLE textbooks
ADD (isbn VARCHAR2(20));


--로그인(login) 테이블 수정 쿼리 (프로필 사진 추가)
ALTER TABLE login
ADD (profile_img VARCHAR2(50));



--로그인(login) 테이블 수정 쿼리 (pw 추가)
ALTER TABLE login
ADD (pw VARCHAR2(20));


--로그인(login) 테이블 수정 쿼리 (프로필 사진 DEFAULT 제약 추가)
ALTER TABLE login
MODIFY profile_img VARCHAR2(50) DEFAULT 'avatar.png';