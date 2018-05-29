package com.test.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.test.domain.Manager;

@Repository
public class ManagerDAOImpl implements ManagerDAO {
	@Inject
	private SqlSession sqlSession;

	// 로그인 정보 메소드 
	@Override
	public List<Manager> loginInfo(String login_id) {

		return this.sqlSession.selectList("com.test.mapper.ManagerMapper.loginInfo", login_id);
	}
	
	// 등록된 과정 목록 출력 메소드 
	@Override
	public List<Manager> bcList() {
		
		// 등록된 과정 목록 - 기초 과정 id, 기초 과정명
		return this.sqlSession.selectList("com.test.mapper.ManagerMapper.bcList");
	}
	
	// 등록된 과목 목록 출력 메소드 
	@Override
	public List<Manager> bsList() {
		
		// 등록된 과목 목록 - 기초 과목 id, 기초 과목명
		return this.sqlSession.selectList("com.test.mapper.ManagerMapper.bsList");
	}

	// 강의실 목록 출력 메소드 
	@Override
	public List<Manager> classroomList() {
		
		// 강의실 목록 - 강의실 id, 강의실명, 정원, 관리자 id
		return this.sqlSession.selectList("com.test.mapper.ManagerMapper.classroomList");
	}
		
	// 교재 목록 출력 메소드 
	@Override
	public List<Manager> textbookList() {
				
		// 등록된 교재 목록 - 교재 id, 교재명, 출판사
		return this.sqlSession.selectList("com.test.mapper.ManagerMapper.textbookList");
	}

	// 강사 목록 출력 메소드  
	@Override
	public List<Manager> instructorList() {
		
		
		/*
		CREATE OR REPLACE VIEW instructor_detail_view
		AS 
		SELECT i.instructor_id, bs_id, instructor_reg_date, name_, ssn, phone, initial_reg_date, access_id, login_id
		FROM instructors i, login l, available_subjects a
		WHERE i.instructor_id=l.login_id
		AND i.instructor_id=a.instructor_id;
		*/

		/*
		CREATE OR REPLACE VIEW manager_22_1_view
		AS
		SELECT i.instructor_id, name_, ssn, phone, available_subjects, instructor_reg_date
		FROM login l, instructors i, instructor_available_view iav
		WHERE l.login_id=i.instructor_id
		AND i.instructor_id = iav.instructor_id 
		AND access_id='LV002'
		ORDER BY i.instructor_id;
		*/
		return this.sqlSession.selectList("com.test.mapper.ManagerMapper.instructorList");
	}
	
	// oc_id로 특정 개설 과정의 과목 정보 검색 메소드 
	@Override
	public List<Manager> oc_osSearch(String oc_id) {
		
		/*
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

		*/
		
		// 특정 개설 과정의 과목 정보 검색 목록 - 개설 과목 id, 개설과목명, 개설과목시작일, 개설과목종료일, 교재명, 강사명
	
		return this.sqlSession.selectList("com.test.mapper.ManagerMapper.oc_osSearch", oc_id);
	}
	
	// oc_id로 특정 개설 과정의 수강생 검색 메소드 
	@Override
	public List<Manager> oc_studentSearch(String oc_id) {
				
		/*
		CREATE OR REPLACE VIEW manager_32_2_view
		AS
		SELECT chv.oc_id,  chv.student_id, name_, ssn, phone, initial_reg_date,
		    CASE 
		    WHEN dropout_date IS NOT NULL THEN '중도 탈락'
		    WHEN (dropout_date IS NULL) AND (oc_end_date > SYSDATE) THEN '수료 예정'
		    WHEN (dropout_date IS NULL) AND (oc_end_date <= SYSDATE) THEN '수료'
		    END learning_status,
		    NVL(dropout_date, oc_end_date) course_end_date
		FROM course_history_dropouts_view chv, student_detail_view sdv, offered_courses oc
		WHERE chv.student_id=sdv.student_id
		AND chv.oc_id=oc.oc_id;
		*/
		
		return this.sqlSession.selectList("com.test.mapper.ManagerMapper.oc_studentSearch", oc_id);
	}
	
	// 개설 과정 목록(삭제 가능 여부 포함) 출력 메소드 
	@Override
	public List<Manager> ocList_ds() {
		
		/*
		CREATE OR REPLACE VIEW manager_33_view
		AS
		SELECT oc_id, oc_title, oc_start_date, oc_end_date, classroom_name, subject_offered_number, registerred_number,
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
		*/

		// 개설 과정 목록 - 개설과정 id, 개설과정명, 개설과정시작일, 개설과정 종료일, 강의실명, 개설 과목수, 수강생 등록 인원, 삭제 가능 여부

		return this.sqlSession.selectList("com.test.mapper.ManagerMapper.ocList_ds");
	}
	
	
	// 등록된 강사 목록 출력 메소드 41 
	@Override
	public List<Manager> instructorList41() {
				
		/*
		CREATE OR REPLACE VIEW instructor_detail_view
		AS 
		SELECT i.instructor_id, bs_id, instructor_reg_date, name_, ssn, phone, initial_reg_date, access_id, login_id
		FROM instructors i, login l, available_subjects a
		WHERE i.instructor_id=l.login_id
		AND i.instructor_id=a.instructor_id;
		*/

		/*
		CREATE OR REPLACE VIEW instructor_available_view
		AS
		SELECT i.instructor_id, LISTAGG(bs_name,'/') WITHIN GROUP(ORDER BY i.instructor_id) available_subjects
		FROM basic_subjects b, instructor_detail_view i 
		WHERE b.bs_id=i.bs_id
		GROUP BY i.instructor_id;
		*/
		
		// 등록된 강사 목록 - 강사id, 강사명, 주민번호 뒷자리, 전화번호, 강의 가능 과목, 최초 등록일
	
		return this.sqlSession.selectList("com.test.mapper.ManagerMapper.instructorList41");
	}
	

	// 개설 과정 목록 출력 메소드 
	@Override
	public List<Manager> ocList51() {
				
		/*
		CREATE OR REPLACE VIEW oc_detail_view
		AS
		SELECT oc.oc_id, bc.bc_title AS oc_title, oc.oc_start_date, oc.oc_end_date, c.classroom_name
		FROM offered_courses oc, basic_courses bc, classrooms c
		WHERE oc.bc_id=bc.bc_id AND oc.classroom_id=c.classroom_id;
		*/

		/*
		CREATE OR REPLACE VIEW oc_detail_count_view
		AS  
		SELECT oc_id, oc_title, oc_start_date, oc_end_date, classroom_name, 
		        (SELECT COUNT(*) FROM offered_subjects WHERE oc_id=ocv.oc_id) subject_offered_number,
		        (SELECT COUNT(*) FROM course_history WHERE oc_id=ocv.oc_id) registerred_number
		FROM oc_detail_view ocv;
		*/
		
		// 개설 과정 목록 - 개설과정 id, 개설과정명, 개설과정시작일, 개설과정종료일, 강의실명, 개설 과목수, 수강생 등록 인원
		return this.sqlSession.selectList("com.test.mapper.ManagerMapper.ocList51");
	}
	
	// 수강생 id로 특정 수강생의 수강 취소 가능 과정 검색 메소드  
	@Override
	public List<Manager> ocSearchToCancle(String student_id) {
		
			/* 개설과정/수료여부 view:
			CREATE OR REPLACE VIEW oc_de_co_his_drop_view
			AS
			SELECT student_id, oc.oc_id, oc_title, oc.oc_start_date, oc.oc_end_date, oc.classroom_name
			    , CASE
			            WHEN (chd.dropout_date < oc.oc_end_date) THEN '중도 탈락'
			            WHEN (oc.oc_end_date <= SYSDATE) THEN '수료'
			            WHEN (oc.oc_end_date > SYSDATE) THEN '수료 예정'
			            ELSE '미정'
			          END AS learning_status
			    , CASE
			        WHEN (chd.dropout_date < oc.oc_end_date) THEN dropout_date
			        ELSE oc.oc_end_date 
			        END AS course_end_date
			FROM oc_detail_view oc, course_history_dropouts_view chd
			WHERE oc.oc_id = chd.oc_id(+);
			*/
		
			return this.sqlSession.selectList("com.test.mapper.ManagerMapper.ocSearchToCancle", student_id);
		}		
	
	// 수강생 id로 특정 수강생의 중도 탈락 가능 과정 검색 메소드  
	@Override
	public List<Manager> ocSearchForDropout(String student_id) {
				
				/* 개설과정/수료여부 view:
				CREATE OR REPLACE VIEW oc_de_co_his_drop_view
				AS
				SELECT student_id, oc.oc_id, oc_title, oc.oc_start_date, oc.oc_end_date, oc.classroom_name
				    , CASE
				            WHEN (chd.dropout_date < oc.oc_end_date) THEN '중도 탈락'
				            WHEN (oc.oc_end_date <= SYSDATE) THEN '수료'
				            WHEN (oc.oc_end_date > SYSDATE) THEN '수료 예정'
				            ELSE '미정'
				          END AS learning_status
				    , CASE
				        WHEN (chd.dropout_date < oc.oc_end_date) THEN dropout_date
				        ELSE oc.oc_end_date 
				        END AS course_end_date
				FROM oc_detail_view oc, course_history_dropouts_view chd
				WHERE oc.oc_id = chd.oc_id(+);
				*/

				return this.sqlSession.selectList("com.test.mapper.ManagerMapper.ocSearchForDropout", student_id);
			}
	
	
	// 수강생 id로 특정 수강생의 수강 과정 검색 메소드  
	@Override
	public List<Manager> ocSearch(String student_id) {
			
		/* 과정 history/중도탈락 view: course_history_dropouts
		CREATE OR REPLACE VIEW course_history_dropouts_view AS
		SELECT ch.oc_id, ch.student_id, dropout_date FROM course_history ch, dropouts d WHERE ch.oc_id=d.oc_id(+) AND ch.student_id=d.student_id(+);
		*/
		/* 개설 과정 정보 view: oc_detail
		CREATE OR REPLACE VIEW oc_detail_view
		AS
		SELECT oc.oc_id, bc.bc_title AS oc_title, oc.oc_start_date, oc.oc_end_date, c.classroom_name
		FROM offered_courses oc, basic_courses bc, classrooms c
		WHERE oc.bc_id=bc.bc_id AND oc.classroom_id=c.classroom_id;
		*/
		/*
		개설과정/수료여부 view:
       	CREATE OR REPLACE VIEW oc_de_co_his_drop_view
		AS
		SELECT chd.student_id, oc.oc_id, oc_title, oc.oc_start_date, oc.oc_end_date, oc.classroom_name
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
		*/
		
		// 특정 수강생의 수강 과정 목록 - 개설과정id, 개설과정명, 개설과정시작일, 개설과정종료일, 강의실명, 수료 여부, 수료예정(중도탈락) 날짜 
	
		return this.sqlSession.selectList("com.test.mapper.ManagerMapper.ocSearch", student_id);
	}
	
	// oc_id로 특정 과정의 개설 과목 목록(시험 정보 포함) 검색 메소드  
	@Override
	public List<Manager> osInfoSearch(String oc_id) {
			
		/*
		CREATE OR REPLACE VIEW os_de_lo_per_sco_view
		AS
		SELECT o.os_id, o.os_name, o.os_start_date, o.os_end_date, o.textbook_title, o.publisher, o.isbn, o.name_, o.profile_img, o.oc_id, o.attendance_percentage, o.writing_percentage, o.practice_percentage
		    , s.score_id, s.student_id, s.attendance_score, s.writing_score, s.practice_score, (s.attendance_score + s.writing_score + s.practice_score) AS total_score, available_subjects
		FROM os_de_login_percentages_view o, scores s WHERE o.os_id = s.os_id(+);
		 */
		/*
    	CREATE OR REPLACE VIEW manager_61_view
    	AS
    	SELECT os.os_id, os.os_name, os.os_start_date, os.os_end_date, os.textbook_title, os.publisher, os.isbn, os.name_, os.profile_img, os.available_subjects, oc.oc_id, oc.oc_title, oc_start_date, oc_end_date, oc.classroom_name, os.attendance_percentage, os.writing_percentage, os.practice_percentage
        	, exam_date, exam_file
    	FROM os_de_login_percentages_view os, exams e, oc_detail_view oc WHERE os.os_id = e.os_id(+) AND oc.oc_id = os.oc_id;
		*/
		
		// 특정 과정의 개설 과목 목록 - 개설과목id, 개설과목명, 개설과목시작일, 개설과목종료일, 교재명, 강사명, 개설과정명, 개설과정시작일, 개설과정종료일, 강의실명, 출결배점, 필기배점, 실기배점, 시험 날짜, 시험 파일
		
		return this.sqlSession.selectList("com.test.mapper.ManagerMapper.osInfoSearch", oc_id);
	}

	// 수강생 정보 검색 출력 메소드 
	// 수강생 id, 수강생 이름, 주민번호 뒷자리 기준으로 검색
	@Override
	public List<Manager> studentInfoSearch(Map<String, Object> map) {

			/*
			 * 수강생 정보 view: student_detail_view CREATE OR REPLACE VIEW student_detail_view
			 * AS SELECT student_id, name_, ssn, phone, initial_reg_date , (SELECT COUNT(*)
			 * FROM course_history c WHERE c.student_id = s.student_id) AS
			 * registration_count FROM students s, login l WHERE s.student_id=l.login_id;
			 */

			// 수강생 정보 - 수강생 id, 수강생 이름, 주민번호 뒷자리, 전화번호, 최초 등록일, 수강 횟수

			return this.sqlSession.selectList("com.test.mapper.ManagerMapper.studentInfoSearch", map);
	}

	// 수강생 정보 검색 출력 메소드  
	// 수강생 id, 수강생 이름, 주민번호 뒷자리 기준으로 검색
	@Override
	public List<Manager> studentInfoSearchPaging(Map<String, Object> map) {
		
		/* 수강생 정보 view: student_detail_view
		CREATE OR REPLACE VIEW student_detail_view
		AS
		SELECT student_id, name_, ssn, phone, initial_reg_date
		    , (SELECT COUNT(*) FROM course_history c WHERE c.student_id = s.student_id) AS registration_count
		FROM students s, login l WHERE s.student_id=l.login_id;
		*/
		// 수강생 정보 - 수강생 id, 수강생 이름, 주민번호 뒷자리, 전화번호, 최초 등록일, 수강 횟수
		
		return this.sqlSession.selectList("com.test.mapper.ManagerMapper.studentInfoSearchPaging", map);
	}
	
	
	// 
	@Override
	public Manager studentInfo(String student_id) {
		
		return this.sqlSession.selectOne("com.test.mapper.ManagerMapper.studentInfo", student_id);
	}
	
	// 총 수강생 수 출력 메소드  
	@Override
	public int studentCount() {

		/*
		CREATE OR REPLACE VIEW student_detail_view
		AS
		SELECT student_id, name_, ssn, phone, initial_reg_date, access_id
	    	, (SELECT COUNT(*) FROM course_history c WHERE c.student_id = s.student_id) AS registration_count
		FROM students s, login l WHERE s.student_id=l.login_id;
		*/
		/*
		 CREATE OR REPLACE VIEW manager_52_view
			AS 
			SELECT student_id, name_, ssn, phone, initial_reg_date, registration_count
	   		, CASE
	   		WHEN ((SELECT COUNT(*) FROM course_history ch WHERE ch.student_id = sdv.student_id) > 0) THEN 'N'
	   		ELSE 'Y'
	   		END AS deleteCheck 
			FROM student_detail_view sdv ORDER BY sdv.student_id;
		 */
		
		return this.sqlSession.selectOne("com.test.mapper.ManagerMapper.studentCount");
	}
	
	// os_id로 수강생 성적 검색 메소드  
	@Override
	public List<Manager> studentScoreList(String os_id) {
		
		// 수강생 성적 검색 목록 - 수강생 id, 수강생 이름, 주민번호 뒷자리, 전화번호, 출결 점수, 필기 점수, 실기 점수, 총점

		return this.sqlSession.selectList("com.test.mapper.ManagerMapper.studentScoreList", os_id);
	}
	
	// 개설 과정 목록 출력 메소드 61  
	@Override
	public List<Manager> ocList61() {
		
		/*
		개설과정 detail view:
		CREATE OR REPLACE VIEW oc_detail_view
		AS
		SELECT oc.oc_id, bc.bc_title AS oc_title, oc.oc_start_date, oc.oc_end_date, c.classroom_name
		FROM offered_courses oc, basic_courses bc, classrooms c
		WHERE oc.bc_id=bc.bc_id AND oc.classroom_id=c.classroom_id;
		*/
		/* 
		CREATE OR REPLACE VIEW oc_detail_count_view
	   	AS  
 		SELECT oc_id, oc_title, oc_start_date, oc_end_date, classroom_name, 
    	(SELECT COUNT(*) FROM offered_subjects WHERE oc_id=ocv.oc_id) subject_offered_number,
    	(SELECT COUNT(*) FROM course_history WHERE oc_id=ocv.oc_id) registerred_number
		FROM oc_detail_view ocv;
		 */
		
		// 개설 과정 목록 - 개설 과정id, 개설과정명, 개설과정시작일, 개설과정종료일, 강의실명, 개설과목수, 수강생 등록 인원

		return this.sqlSession.selectList("com.test.mapper.ManagerMapper.ocList61");
	}

	
	// oc_id로 특정 과목의 성적 검색 메소드  
	@Override
	public List<Manager> stu_scoreSearch(Manager m) {
		
		/*
		개설과목/강사명/배점 view:
		CREATE OR REPLACE VIEW os_de_login_percentages_view
		AS
		SELECT odv.os_id, odv.bs_name AS os_name, odv.os_start_date, odv.os_end_date, odv.textbook_title, l.name_, odv.oc_id, sp.attendance_percentage, sp.writing_percentage, sp.practice_percentage
		FROM os_detail_view odv, login l, score_percentages sp
		WHERE login_id = instructor_id AND odv.os_id = sp.os_id(+)
		ORDER BY odv.os_id;
		*/
		/*
		개설과목/강사명/배점/학생별 점수 view:
		CREATE OR REPLACE VIEW os_de_lo_per_sco_view
		AS
		SELECT o.os_id, o.os_name, o.os_start_date, o.os_end_date, o.textbook_title, o.name_, o.oc_id, o.attendance_percentage, o.writing_percentage, o.practice_percentage
		    , s.score_id, s.student_id, s.attendance_score, s.writing_score, s.practice_score, (s.attendance_score + s.writing_score + s.practice_score) AS total_score
		FROM os_de_login_percentages_view o, scores s WHERE o.os_id = s.os_id(+);
		*/
		/*
		CREATE OR REPLACE VIEW os_de_lo_per_sco_ex_view
		AS
		SELECT o.os_id, o.os_name, o.os_start_date, o.os_end_date, o.textbook_title, o.name_, o.oc_id, o.attendance_percentage, o.writing_percentage, o.practice_percentage
		    , o.score_id, o.student_id, o.attendance_score, o.writing_score, o.practice_score, o.total_score, e.exam_date, e.exam_file
		FROM oc_de_lo_per_sco_view o, exams e WHERE o.os_id = e.os_id(+);
		*/
		
		// 특정 과목의 성적 검색 목록 - 개설과목id, 개설과목명, 성적 id, 개설과목시작일, 개설과목종료일, 교재명, 강사명, 출결배점, 필기배점, 실기배점, 출결점수, 필기점수, 실기점수, 총점, 시험 날짜, 시험 파일
		
		return this.sqlSession.selectList("com.test.mapper.ManagerMapper.stu_scoreSearch", m);
	}
	
	
	// -------------------------------------------------------------------------------------------------------
	
	

		
	// 개설 과정 입력 메소드 
	@Override
	public int ocAdd(Manager m) {
		
		return this.sqlSession.insert("com.test.mapper.ManagerMapper.ocAdd",  m);
	}
	
	// 개설 과목 입력 메소드 
	@Override
	public int osAdd(Manager m) {
		
		return this.sqlSession.insert("com.test.mapper.ManagerMapper.osAdd", m);
	}
	
	// 
	@Override
	public List<Manager> getinstructor(String bs_id) {
		
		return this.sqlSession.selectList("com.test.mapper.ManagerMapper.getinstructor", bs_id);
	}
	
	// 수강생 개설과정 등록 메소드 
	@Override
	public int studentOcAdd(Manager m) {

		return this.sqlSession.insert("com.test.mapper.ManagerMapper.studentOcAdd", m);
	}


	// 수강생 입력 메소드 
	// **************************************************트랜잭션************************************************************************
	@Override
	public int studentAdd_1(Manager m) {
			
		return this.sqlSession.insert("com.test.mapper.ManagerMapper.studentAdd_1", m);
	}
	
	// 수강생 입력 메소드 
	// **************************************************트랜잭션************************************************************************
	@Override
	public int studentAdd_2(Manager m) {
			
		return this.sqlSession.insert("com.test.mapper.ManagerMapper.studentAdd_2", m);
	}


	// 개설 과정 삭제 메소드 
	@Override
	public int ocDelete(String oc_id) {

		return this.sqlSession.delete("com.test.mapper.ManagerMapper.ocDelete", oc_id);
	}
	
	// 개설 과목 삭제 메소드 
	@Override
	public int osDelete(String os_id) {

		return this.sqlSession.delete("com.test.mapper.ManagerMapper.osDelete", os_id);
	}
	
	// 수강 취소 메소드 
	@Override
	public int courseCancel(Manager m) {

		return this.sqlSession.delete("com.test.mapper.ManagerMapper.courseCancel", m);
	}

	// 수강생 중도탈락 메소드 
	@Override
	public int studentDropout(Manager m) {

		return this.sqlSession.insert("com.test.mapper.ManagerMapper.studentDropout", m);
	}

	// 수강생 삭제 메소드 
	@Override
	public int studentDelete(String student_id) {

		return this.sqlSession.delete("com.test.mapper.ManagerMapper.studentDelete", student_id);
	}

	// 수강생 삭제 메소드 - 프로필 사진명 얻어오기 
	public Manager getProfileImgName(Manager m) {
		return this.sqlSession.selectOne("com.test.mapper.ManagerMapper.getProfileImgName", m);
	}


	// ---------------------------------------------------------------------------------------------------------------
	// 목록의 타이틀 정보 반환 메소드 
	@Override
	public Manager ocInfo(String oc_id) {
		
		/*
		CREATE OR REPLACE VIEW oc_detail_view
		AS
		SELECT oc.oc_id, bc.bc_title AS oc_title, oc.oc_start_date, oc.oc_end_date, c.classroom_name,
		    CASE
		    WHEN oc_start_date> SYSDATE THEN 'Y'
		    ELSE 'N'
		    END delete_status
		FROM offered_courses oc, basic_courses bc, classrooms c
		WHERE oc.bc_id=bc.bc_id AND oc.classroom_id=c.classroom_id;

		 */
		
		
		return this.sqlSession.selectOne("com.test.mapper.ManagerMapper.ocInfo", oc_id);
	}
	
	// 목록의 타이틀 정보 반환 메소드 
	@Override
	public Manager osInfo(String os_id) {
					
		return this.sqlSession.selectOne("com.test.mapper.ManagerMapper.osInfo", os_id);
	}
	
	
	//-----------------
	
	@Override
	public List<Manager> bcList_ds() {

		return this.sqlSession.selectList("com.test.mapper.ManagerMapper.bcList_ds");
	}

	@Override
	public List<Manager> bsList_ds() {

		return this.sqlSession.selectList("com.test.mapper.ManagerMapper.bsList_ds");
	}

	@Override
	public List<Manager> classroomList_ds() {
		
		return this.sqlSession.selectList("com.test.mapper.ManagerMapper.classroomList_ds");
	}

	@Override
	public List<Manager> managerSearch(Manager m) {
		return this.sqlSession.selectList("com.test.mapper.ManagerMapper.managerSearch", m);
	}

	@Override
	public List<Manager> textbookList_ds() {

		return this.sqlSession.selectList("com.test.mapper.ManagerMapper.textbookList_ds");
	}

	@Override
	public List<String> availableSubjectList(String instructor_id) {

		return this.sqlSession.selectList("com.test.mapper.ManagerMapper.availableSubjectList", instructor_id);
	}
	
	@Override
	public List<Manager> instructorSearch(Manager m) {
		return this.sqlSession.selectList("com.test.mapper.ManagerMapper.instructorSearch", m);
	}

	@Override
	public List<Manager> courseInfoList(String instructor_id) {

		return this.sqlSession.selectList("com.test.mapper.ManagerMapper.courseInfoList", instructor_id);
	}

	@Override
	public List<Manager> instructorList_ds() {

		return this.sqlSession.selectList("com.test.mapper.ManagerMapper.instructorList_ds");
	}
	
	@Override
	public List<Manager> ocList() {
		return this.sqlSession.selectList("com.test.mapper.ManagerMapper.ocList");
	}
	
	@Override
	public List<Manager> ocDate(Manager m) {
		return this.sqlSession.selectList("com.test.mapper.ManagerMapper.ocDate");
	}

	@Override
	public List<Manager> oc_osSearch(Manager m) {

		return this.sqlSession.selectList("com.test.mapper.ManagerMapper.oc_osSearch", m);
	}

	@Override
	public List<Manager> oc_studentSearch(Manager m) {

		return this.sqlSession.selectList("com.test.mapper.ManagerMapper.oc_studentSearch", m);
	}
	
	@Override
	public List<Manager> ocAddibleList() {
		return this.sqlSession.selectList("com.test.mapper.ManagerMapper.ocAddibleList");
	}
	
	@Override
	public List<Manager> oc_osSearch41(Manager m) {
		return this.sqlSession.selectList("com.test.mapper.ManagerMapper.oc_osSearch41", m);
	}

	@Override
	public List<Manager> osList() {
		return this.sqlSession.selectList("com.test.mapper.ManagerMapper.osList");
	}
	
	@Override
	public List<Manager> osDeletableList() {
		return this.sqlSession.selectList("com.test.mapper.ManagerMapper.osDeletableList");
	}
	
	@Override
	public List<Manager> studentList() {
		return this.sqlSession.selectList("com.test.mapper.ManagerMapper.studentList");
	}
	
	@Override
	public List<Manager> studentSearch(Manager m) {
		return this.sqlSession.selectList("com.test.mapper.ManagerMapper.studentSearch", m);
	}

	@Override
	public List<Manager> ocSearchToCancle(Manager m) {

		return this.sqlSession.selectList("com.test.mapper.ManagerMapper.ocSearchToCancle", m);
	}

	@Override
	public List<Manager> ocSearchForDropout(Manager m) {

		return this.sqlSession.selectList("com.test.mapper.ManagerMapper.ocSearchForDropout", m);
	}
	
	@Override
	public List<Manager> studentSearch_ds(Manager m) {
		return this.sqlSession.selectList("com.test.mapper.ManagerMapper.studentSearch_ds", m);
	}

	@Override
	public List<Manager> studentSearch(String name_2) {
		return this.sqlSession.selectList("com.test.mapper.ManagerMapper.studentSearch_ds", name_2);
	}

	@Override
	public List<Manager> ocSearch(Manager m) {

		return this.sqlSession.selectList("com.test.mapper.ManagerMapper.ocSearch", m);
	}

	@Override
	public List<Manager> osInfoSearch(Manager m) {

		return this.sqlSession.selectList("com.test.mapper.ManagerMapper.osInfoSearch", m);
	}

	@Override
	public List<Manager> studentScoreList(Manager m) {
		return this.sqlSession.selectList("com.test.mapper.ManagerMapper.studentScoreList", m);
	}

	@Override
	public List<Manager> osInfoSearch61(Manager m) {
		return this.sqlSession.selectList("com.test.mapper.ManagerMapper.osInfoSearch61", m);
	}

	@Override
	public int bcAdd(Manager m) {
		return this.sqlSession.insert("com.test.mapper.ManagerMapper.bcAdd", m);
	}

	@Override
	public int bsAdd(Manager m) {
		return this.sqlSession.insert("com.test.mapper.ManagerMapper.bsAdd", m);
	}

	@Override
	public int classroomAdd(Manager m) {
		return this.sqlSession.insert("com.test.mapper.ManagerMapper.classroomAdd", m);
	}

	@Override
	public int textbookAdd(Manager m) {
		return this.sqlSession.insert("com.test.mapper.ManagerMapper.textbookAdd", m);
	}

	@Override
	public int instructorAdd_1(Manager m) {
		return this.sqlSession.insert("com.test.mapper.ManagerMapper.instructorAdd_1", m);
	}
	
	@Override
	public int instructorAdd_2(Manager m) {
		return this.sqlSession.insert("com.test.mapper.ManagerMapper.instructorAdd_2", m);
	}
	
	@Override
	public int instructorAdd_3(Manager m) {
		return this.sqlSession.insert("com.test.mapper.ManagerMapper.instructorAdd_3", m);
	}

	@Override
	public int inst_availableSubjectAdd(Manager m) {
		return this.sqlSession.insert("com.test.mapper.ManagerMapper.inst_availableSubjectAdd", m);
	}

	@Override
	public List<Manager> getinstructor(Manager m) {
		return this.sqlSession.selectList("com.test.mapper.ManagerMapper.getinstructor", m);
	}

	@Override
	public int studentAdd(Manager m) {
		return this.sqlSession.insert("com.test.mapper.ManagerMapper.studentAdd", m);
	}

	@Override
	public int bcDelete(String bc_id) {
		return this.sqlSession.delete("com.test.mapper.ManagerMapper.bcDelete", bc_id);
	}

	@Override
	public int bsDelete(String bs_id) {
		return this.sqlSession.delete("com.test.mapper.ManagerMapper.bsDelete", bs_id);
	}

	@Override
	public int classroomDelete(String classroom_id) {
		return this.sqlSession.delete("com.test.mapper.ManagerMapper.classroomDelete", classroom_id);
	}

	@Override
	public int textbookDelete(String textbook_id) {
		return this.sqlSession.delete("com.test.mapper.ManagerMapper.textbookDelete", textbook_id);
	}

	@Override
	public int instructorDelete(String instructor_id) {
		return this.sqlSession.delete("com.test.mapper.ManagerMapper.instructorDelete", instructor_id);
	}

	@Override
	public Manager ocInfo(Manager m) {
		return this.sqlSession.selectOne("com.test.mapper.ManagerMapper.ocInfo", m);
	}

	@Override
	public int availableSubjectCheck(Manager m) {
		return this.sqlSession.selectOne("com.test.mapper.ManagerMapper.availableSubjectCheck", m);
	}
	
	@Override
	public Manager instructorInfo(String instructor_id) {
		return this.sqlSession.selectOne("com.test.mapper.ManagerMapper.instructorInfo", instructor_id);
	}

	@Override
	public Manager osInfo(Manager m) {
		return this.sqlSession.selectOne("com.test.mapper.ManagerMapper.osInfo", m);
	}

	@Override
	public Manager studentInfo(Manager m) {
		return this.sqlSession.selectOne("com.test.mapper.ManagerMapper.studentInfo", m);
	}

	@Override
	public int studentDropout(String oc_id, String student_id, String dropout_date) {
		return this.sqlSession.selectOne("com.test.mapper.ManagerMapper.studentDropout");
	}

	@Override
	public int instructorUpdate_1(String instructor_id) {
		return this.sqlSession.delete("com.test.mapper.ManagerMapper.instructorUpdate_1", instructor_id);
	}
	
	@Override
	public int instructorUpdate_2(Manager m) {
		return this.sqlSession.insert("com.test.mapper.ManagerMapper.instructorUpdate_2", m);
	}

}


