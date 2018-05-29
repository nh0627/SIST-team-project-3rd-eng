/***************** ���̺� ���� ********************/
-- ��� ���� ���̺�
CREATE TABLE access_level(
      access_id VARCHAR2(5), --pk
      access_name NVARCHAR2(5)
      );

--�α��� ���� ���̺�
CREATE TABLE login(
      name_ NVARCHAR2(10), --pk
      ssn VARCHAR2(15), --pk
      phone VARCHAR2(15),
      initial_reg_date DATE,
      access_id VARCHAR2(5), --fk
      login_id VARCHAR2(5)
      );

-- ������ ����  ���̺�
CREATE TABLE managers(
      manager_id VARCHAR2(5), --pk, fk
      manager_reg_date DATE
      );
  
-- ���ǽ� ���� ���̺�
CREATE TABLE classrooms(
        classroom_id VARCHAR2(5),  --pk
        classroom_name NVARCHAR2(10),
        maximum NUMBER,
        manager_id VARCHAR2(5)  --fk
        );
         
-- ���� ���� ����
CREATE TABLE offered_courses(
        oc_id VARCHAR2(5),  --pk
        oc_start_date DATE,
        oc_end_date DATE,
        classroom_id VARCHAR2(5), --fk
        bc_id VARCHAR2(5) --fk
        );

-- ���� ���� ����
CREATE TABLE basic_courses(
        bc_id VARCHAR2(5),  --pk
        bc_title NVARCHAR2(40)
        );

-- ���� history ����
CREATE TABLE course_history (
        oc_id VARCHAR2(5),  --pk, fk
        student_id VARCHAR2(5)  --pk, fk
        );
 
-- �ߵ�Ż�� ����
CREATE TABLE dropouts(
      student_id VARCHAR2(5), --pk, fk
      oc_id VARCHAR2(5), --pk, fk
      dropout_date DATE
      );
 
-- ������ ����
CREATE TABLE students (
        student_id VARCHAR2(5),  --pk, fk
        student_reg_date DATE
        );

-- ���� ����
CREATE TABLE scores (
      score_id VARCHAR2(5),  --pk
      attendance_score NUMBER,
      writing_score NUMBER,
      practice_score NUMBER,
      student_id VARCHAR2(5), --fk
      os_id VARCHAR2(5) --fk
      );
 
-- ���� ���� ����
CREATE TABLE offered_subjects(
      os_id VARCHAR2(5),  --pk
      os_start_date DATE,
      os_end_date DATE,
      bs_id VARCHAR2(5), --fk
      textbook_id VARCHAR2(5), --fk
      instructor_id VARCHAR2(5), --fk
      oc_id VARCHAR2(5) --fk(CASCADE)
      );
 
-- ���� ����
CREATE TABLE instructors(
      instructor_id VARCHAR2(5),  --pk, fk
      instructor_reg_date DATE
      );
 
-- ���� ���� ���� ����
CREATE TABLE available_subjects(
      instructor_id VARCHAR2(5),  --pk, fk
      bs_id VARCHAR2(5)  --pk, fk
      );
 
-- ���� ���� ����
CREATE TABLE basic_subjects(
      bs_id VARCHAR2(5),  --pk
      bs_name NVARCHAR2(10)
      );
 
-- ���� ����
CREATE TABLE textbooks(
      textbook_id VARCHAR2(5),  --pk
      textbook_title NVARCHAR2(20),
      publisher NVARCHAR2(10)
      );
 
 
-- ���� ����
CREATE TABLE exams(
      os_id VARCHAR2(5),  --pk, fk
      exam_date DATE,
      exam_file NVARCHAR2(40)
      );



-- ���� ����
CREATE TABLE score_percentages(
      os_id VARCHAR2(5),  --pk, fk
      attendance_percentage NUMBER,
      writing_percentage NUMBER,
      practice_percentage NUMBER
      );
  


/***************** PK/ UNIQUE ���� ���� ********************/
-- ��� ���� ���̺�     
ALTER TABLE access_level
ADD CONSTRAINT access_level_access_id_pk PRIMARY KEY (access_id);

--�α��� ���� ���̺�
ALTER TABLE login
ADD CONSTRAINT login_name_ssn_pk PRIMARY KEY (name_, ssn); 
 
ALTER TABLE login
ADD CONSTRAINT login_login_id_uk UNIQUE (login_id);       

-- ������ ����  ���̺�
ALTER TABLE managers
ADD CONSTRAINT managers_manager_id_pk PRIMARY KEY (manager_id); 

-- ���ǽ� ���� ���̺�
ALTER TABLE classrooms
ADD CONSTRAINT classrooms_classroom_id_pk PRIMARY KEY (classroom_id); 

-- ���� ���� ����
ALTER TABLE offered_courses
ADD CONSTRAINT oc_oc_id_pk PRIMARY KEY (oc_id);    

-- ���� ���� ����
ALTER TABLE basic_courses
ADD CONSTRAINT bc_bc_id_pk PRIMARY KEY (bc_id);     

-- ���� history ����
ALTER TABLE course_history
ADD CONSTRAINT history_oc_id_student_id_pk PRIMARY KEY (oc_id, student_id);    
 
-- �ߵ�Ż�� ����
ALTER TABLE dropouts
ADD CONSTRAINT dropouts_student_id_oc_id_pk PRIMARY KEY (student_id, oc_id);    

-- ������ ����
ALTER TABLE students
ADD CONSTRAINT students_student_id_pk PRIMARY KEY (student_id);        

-- ���� ����
ALTER TABLE scores
ADD CONSTRAINT scores_score_id_pk PRIMARY KEY (score_id);    

ALTER TABLE scores
ADD CONSTRAINT SCORES_STUDENT_ID_OS_ID UNIQUE (student_id, os_id);
 
-- ���� ���� ����
ALTER TABLE offered_subjects
ADD CONSTRAINT os_os_id_pk PRIMARY KEY (os_id);    

-- ���� ����
ALTER TABLE instructors
ADD CONSTRAINT instructors_instructor_id_pk PRIMARY KEY (instructor_id);     

-- ���� ���� ���� ����
ALTER TABLE available_subjects
ADD CONSTRAINT avail_instructor_id_bs_id_pk PRIMARY KEY (instructor_id, bs_id);    

-- ���� ���� ����
ALTER TABLE basic_subjects
ADD CONSTRAINT bs_bs_id_pk PRIMARY KEY (bs_id);    

-- ���� ����
ALTER TABLE textbooks
ADD CONSTRAINT textbooks_textbook_id_pk PRIMARY KEY (textbook_id);    

-- ���� ����
ALTER TABLE exams
ADD CONSTRAINT exams_os_id_pk PRIMARY KEY (os_id);    

-- ���� ����
ALTER TABLE score_percentages
ADD CONSTRAINT score_percentages_os_id_pk PRIMARY KEY (os_id);     



/***************** FK/ CHECK ���� ���� ********************/
--�α��� ���� ���̺�
ALTER TABLE login
ADD CONSTRAINT login_access_id_fk FOREIGN KEY (access_id)
REFERENCES access_level(access_id);   

-- ������ ����  ���̺�
ALTER TABLE managers
ADD CONSTRAINT managers_manager_id_fk FOREIGN KEY (manager_id)
REFERENCES login(login_id);  

-- ���ǽ� ���� ���̺�
ALTER TABLE classrooms
ADD CONSTRAINT classrooms_manager_id_fk FOREIGN KEY (manager_id)
REFERENCES managers(manager_id);  

-- ���� ���� ����
ALTER TABLE offered_courses
ADD CONSTRAINT oc_classroom_id_fk FOREIGN KEY (classroom_id)  
REFERENCES classrooms(classroom_id);
 
ALTER TABLE offered_courses
ADD CONSTRAINT oc_bc_id_fk FOREIGN KEY (bc_id)
REFERENCES basic_courses(bc_id);   

-- ���� history ����
ALTER TABLE course_history
ADD CONSTRAINT history_oc_id_fk FOREIGN KEY (oc_id)
REFERENCES offered_courses(oc_id);   
 
ALTER TABLE course_history
ADD CONSTRAINT history_student_id_fk FOREIGN KEY (student_id)
REFERENCES students(student_id);   

-- �ߵ�Ż�� ����
ALTER TABLE dropouts
ADD CONSTRAINT dropouts_student_id_oc_id_fk FOREIGN KEY (student_id, oc_id)
REFERENCES course_history(student_id, oc_id);  
 
-- ������ ����
ALTER TABLE students
ADD CONSTRAINT students_student_id_fk FOREIGN KEY (student_id)
REFERENCES login(login_id)
ON DELETE CASCADE;  

-- ���� ����
ALTER TABLE scores
ADD CONSTRAINT scores_student_id_fk FOREIGN KEY (student_id)
REFERENCES students(student_id);    
 
ALTER TABLE scores
ADD CONSTRAINT scores_os_id_fk FOREIGN KEY (os_id)
REFERENCES offered_subjects(os_id);  

-- ���� ���� ����
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

-- ���� ����
ALTER TABLE instructors
ADD CONSTRAINT instructors_instructor_id_fk FOREIGN KEY (instructor_id)
REFERENCES login(login_id)
ON DELETE CASCADE;

-- ���� ���� ���� ����
ALTER TABLE available_subjects
ADD CONSTRAINT avail_instructor_id_fk FOREIGN KEY (instructor_id)
REFERENCES instructors(instructor_id)
ON DELETE CASCADE;
 
ALTER TABLE available_subjects
ADD CONSTRAINT avail_bs_id_fk FOREIGN KEY (bs_id)
REFERENCES basic_subjects(bs_id);

-- ���� ����
ALTER TABLE exams
ADD CONSTRAINT exams_os_id_fk FOREIGN KEY (os_id)
REFERENCES offered_subjects(os_id);

-- ���� ����
ALTER TABLE score_percentages
ADD CONSTRAINT score_percentages_os_id_fk FOREIGN KEY (os_id)
REFERENCES offered_subjects(os_id);

ALTER TABLE score_percentages
ADD CONSTRAINT score_percentages_check
CHECK ((attendance_percentage>=20) AND (attendance_percentage + writing_percentage + practice_percentage) = 100);




-----------------------------------------------------------------------
-- 3�� ������Ʈ ����
-----------------------------------------------------------------------
-- ����(textbook) ���̺� ���� ����
ALTER TABLE textbooks
ADD (isbn VARCHAR2(20));


--�α���(login) ���̺� ���� ���� (������ ���� �߰�)
ALTER TABLE login
ADD (profile_img VARCHAR2(50));



--�α���(login) ���̺� ���� ���� (pw �߰�)
ALTER TABLE login
ADD (pw VARCHAR2(20));


--�α���(login) ���̺� ���� ���� (������ ���� DEFAULT ���� �߰�)
ALTER TABLE login
MODIFY profile_img VARCHAR2(50) DEFAULT 'avatar.png';