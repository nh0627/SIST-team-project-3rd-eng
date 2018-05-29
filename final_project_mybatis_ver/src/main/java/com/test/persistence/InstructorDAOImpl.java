package com.test.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.test.domain.Instructor;

@Repository
public class InstructorDAOImpl implements InstructorDAO {

	@Inject
	private SqlSession sqlSession;

	@Override
	public List<Instructor> instructorList(String instructor_id) {
	
		/* CREATE OR REPLACE VIEW instructor_available_view 
	       AS SELECT i.instructor_id, REPLACE(LISTAGG(bs_name,'/') WITHIN GROUP(ORDER BY i.instructor_id),' ', '')
	       available_subjects 
	       FROM basic_subjects b, instructor_detail_view i 
	       WHERE b.bs_id=i.bs_id GROUP BY i.instructor_id;
		 */
		
		return this.sqlSession.selectList("com.test.mapper.InstructorMapper.instructorList", instructor_id);
	}

	@Override
	public List<Instructor> courseScheduleList(String instructor_id) {

		/*
		 * CREATE OR REPLACE VIEW os_detail_view 
		 * AS 
		 * SELECT os.os_id, os_start_date,
		 * os_end_date, os.bs_id, bs_name, os.textbook_id, textbook_title,  publisher, isbn,
		 * os.instructor_id, os.oc_id, oc_start_date, oc_end_date, classroom_id, bc_id
		 * FROM offered_subjects os, basic_subjects bs, textbooks t, instructors i,
		 * offered_courses oc 
		 * WHERE os.bs_id = bs.bs_id AND os.textbook_id=t.textbook_id
		 * AND os.instructor_id=i.instructor_id AND os.oc_id=oc.oc_id ORDER BY os_id;
		 */
		/*
		 * CREATE OR REPLACE VIEW instructor_2_1_view 
		 * AS SELECT osv.os_id, bs_name,
		 * os_start_date, os_end_date, bc_title, oc_start_date, oc_end_date,
		 * classroom_name, textbook_title, publisher, isbn, instructor_id, (SELECT COUNT(*) FROM
		 * course_history 
		 * WHERE oc_id=osv.oc_id) registerred_number, 
		 * CASE WHEN (SYSDATE>os_start_date AND SYSDATE<os_end_date) THEN '강의중' WHEN
		 * (SYSDATE<os_start_date) THEN '강의예정' WHEN (SYSDATE>os_end_date) THEN '강의종료'
		 * END course_status FROM os_detail_view osv, basic_courses bc, classrooms cl
		 * WHERE osv.bc_id=bc.bc_id AND osv.classroom_id=cl.classroom_id;
		 */
		
		return this.sqlSession.selectList("com.test.mapper.InstructorMapper.courseScheduleList", instructor_id);
	}

	@Override
	public List<Instructor> studentSearch(Instructor i) {

		/*
		 * CREATE OR REPLACE VIEW student_detail_view 
		 * AS 
		 * SELECT student_id, name_, ssn, phone, initial_reg_date , (SELECT COUNT(*) 
		 * FROM course_history c 
		 * WHERE c.student_id = s.student_id) AS registration_count 
		 * FROM students s, login l
		 * WHERE s.student_id=l.login_id;
		 */
		/*
		 * CREATE OR REPLACE VIEW course_history_dropouts_view 
		 * AS 
		 * SELECT ch.oc_id, ch.student_id, dropout_date 
		 * FROM course_history ch, dropouts d 
		 * WHERE ch.oc_id=d.oc_id(+) AND ch.student_id=d.student_id(+);
		 */
		/*
		 * CREATE OR REPLACE VIEW instructor_2_2_view 
		 * AS 
		 * SELECT oc.oc_id, os_id, sv.student_id, name_, phone, initial_reg_date, 
		 * CASE WHEN (dropout_date IS NOT NULL) THEN '중도탈락' 
		 * WHEN (dropout_date IS NULL) AND (oc_end_date>SYSDATE) THEN '수료 예정' 
		 * WHEN (dropout_date IS NULL) AND (oc_end_date<SYSDATE) THEN '수료' END
		 * learning_status, NVL(dropout_date, oc_end_date)course_end_date, instructor_id
		 * FROM student_detail_view sv, course_history_dropouts_view hv, offered_courses
		 * oc, offered_subjects os 
		 * WHERE sv.student_id=hv.student_id AND hv.oc_id=oc.oc_id AND oc.oc_id=os.oc_id;
		 */
		
		
		return this.sqlSession.selectList("com.test.mapper.InstructorMapper.studentSearch", i);

	}

	@Override
	public List<Instructor> percentage_addible_osList(String instructor_id) {

		/*
		 * CREATE OR REPLACE VIEW os_detail_view AS SELECT os.os_id, os_start_date,
		 * os_end_date, os.bs_id, bs_name, os.textbook_id, textbook_title, publisher, isbn,
		 * os.instructor_id, os.oc_id, oc_start_date, oc_end_date, classroom_id, bc_id
		 * FROM offered_subjects os, basic_subjects bs, textbooks t, instructors i, offered_courses oc 
		 * WHERE os.bs_id = bs.bs_id AND os.textbook_id=t.textbook_id
		 * AND os.instructor_id=i.instructor_id 
		 * AND os.oc_id=oc.oc_id ORDER BY os_id;
		 */
		/*
		 * CREATE OR REPLACE VIEW oc_detail_view 
		 * AS SELECT oc.oc_id, bc.bc_title AS oc_title, oc.oc_start_date, oc.oc_end_date, c.classroom_name 
		 * FROM offered_courses oc, basic_courses bc, classrooms c 
		 * WHERE oc.bc_id=bc.bc_id
		 * AND oc.classroom_id=c.classroom_id;
		 */
		/*
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
		 */
		
		return this.sqlSession.selectList("com.test.mapper.InstructorMapper.percentage_addible_osList", instructor_id);
	}

	@Override
	public List<Instructor> percentage_deletable_osList(String instructor_id) {

		/*
		 * CREATE OR REPLACE VIEW offered_subjects_scores_view 
		 * AS SELECT oc_id, os.os_id, bs_name, student_id, os_start_date, os_end_date, os.bs_id,
		 * textbook_id, instructor_id, score_id, attendance_score, writing_score, practice_score 
		 * FROM offered_subjects os, scores s, basic_subjects bs 
		 * WHERE os.os_id=s.os_id(+) AND os.bs_id=bs.bs_id 
		 * ORDER BY os.os_id;
		 */

		/*
		 * CREATE OR REPLACE VIEW oc_detail_view 
		 * AS 
		 * SELECT oc.oc_id, bc.bc_title AS oc_title, oc.oc_start_date, oc.oc_end_date, c.classroom_name 
		 * FROM offered_courses oc, basic_courses bc, classrooms c 
		 * WHERE oc.bc_id=bc.bc_id
		 * AND oc.classroom_id=c.classroom_id;
		 */
		/*
		 * CREATE OR REPLACE VIEW instructor_32_1_view 
		 * AS 
		 * SELECT osv.os_id, osv.bs_name, os_start_date, os_end_date, oc_title, ocv.oc_start_date, ocv.oc_end_date,
		 * classroom_name, textbook_title, publisher, isbn,
		 * NVL(attendance_percentage, 0) attendance_percentage, NVL(writing_percentage, 0) writing_percentage,
		 * NVL(practice_percentage, 0) practice_percentage, 
		 * (SELECT COUNT(*) FROM course_history WHERE oc_id=ocv.oc_id) registerred_number, instructor_id 
		 * FROM offered_subjects_scores_view osv, oc_detail_view ocv, score_percentages sp, textbooks t 
		 * WHERE osv.oc_id=ocv.oc_id AND osv.os_id=sp.os_id(+) 
		 * AND osv.textbook_id=t.textbook_id 
		 * AND attendance_percentage IS NOT NULL 
		 * AND osv.student_id IS NULL;
		 */
		
		return this.sqlSession.selectList("com.test.mapper.InstructorMapper.percentage_deletable_osList", instructor_id);
	}

	@Override
	public List<Instructor> exam_osList(String instructor_id) {

		/*
		 * CREATE OR REPLACE VIEW os_detail_view 
		 * AS 
		 * SELECT os.os_id, os_start_date, os_end_date, os.bs_id, bs_name, os.textbook_id, textbook_title, publisher, isbn,
		 * os.instructor_id, os.oc_id, oc_start_date, oc_end_date, classroom_id, bc_id
		 * FROM offered_subjects os, basic_subjects bs, textbooks t, instructors i,
		 * offered_courses oc 
		 * WHERE os.bs_id = bs.bs_id 
		 * AND os.textbook_id=t.textbook_id
		 * AND os.instructor_id=i.instructor_id AND os.oc_id=oc.oc_id ORDER BY os_id;
		 */
		/*
		 * CREATE OR REPLACE VIEW oc_detail_view 
		 * AS 
		 * SELECT oc.oc_id, bc.bc_title AS oc_title, oc.oc_start_date, oc.oc_end_date, c.classroom_name 
		 * FROM offered_courses oc, basic_courses bc, classrooms c 
		 * WHERE oc.bc_id=bc.bc_id
		 * AND oc.classroom_id=c.classroom_id;
		 */
		/*
		 * CREATE OR REPLACE VIEW instructor_33_1_view 
		 * AS 
		 * SELECT os.os_id, bs_name, os_start_date, os_end_date, oc_title, oc.oc_start_date, oc.oc_end_date,
		 * classroom_name, textbook_title, publisher, isbn, exam_date, exam_file, instructor_id,
		 * os.profile_img 
		 * FROM os_detail_view os, oc_detail_view oc, exams ex 
		 * WHERE os.oc_id=oc.oc_id AND os.os_id=ex.os_id(+) AND os_end_date <= SYSDATE;
		 */
		
		return this.sqlSession.selectList("com.test.mapper.InstructorMapper.exam_osList", instructor_id);
	}

	@Override
	public List<Instructor> score_osList(String instructor_id) {

		/*
		 * CREATE OR REPLACE VIEW os_detail_view 
		 * AS 
		 * SELECT os.os_id, os_start_date,
		 * os_end_date, os.bs_id, bs_name, os.textbook_id, textbook_title, publisher, isbn,
		 * os.instructor_id, os.oc_id, oc_start_date, oc_end_date, classroom_id, bc_id
		 * FROM offered_subjects os, basic_subjects bs, textbooks t, instructors i,
		 * offered_courses oc 
		 * WHERE os.bs_id = bs.bs_id AND os.textbook_id=t.textbook_id
		 * AND os.instructor_id=i.instructor_id AND os.oc_id=oc.oc_id ORDER BY os_id;
		 */
		/*
		 * CREATE OR REPLACE VIEW oc_detail_view 
		 * AS 
		 * SELECT oc.oc_id, bc.bc_title AS
		 * oc_title, oc.oc_start_date, oc.oc_end_date, c.classroom_name 
		 * FROM offered_courses oc, basic_courses bc, classrooms c 
		 * WHERE oc.bc_id=bc.bc_id
		 * AND oc.classroom_id=c.classroom_id;
		 */
		/*
		 * CREATE OR REPLACE VIEW instructor_41_1_view 
		 * AS 
		 * SELECT osv.os_id, bs_name, os_start_date, os_end_date, oc_title, ocv.oc_start_date, ocv.oc_end_date,
		 * classroom_name, textbook_title, publisher, isbn, NVL(attendance_percentage,0)
		 * attendance_percentage, NVL(writing_percentage,0) writing_percentage,
		 * NVL(practice_percentage,0) practice_percentage, exam_date, (SELECT COUNT(*)
		 * FROM scores 
		 * WHERE os_id=osv.os_id)||'/'||(SELECT COUNT(*) FROM course_history
		 * WHERE osv.oc_id=oc_id) score_added_number, instructor_id FROM os_detail_view
		 * osv, oc_detail_view ocv, score_percentages sp, exams ex 
		 * WHERE osv.oc_id=ocv.oc_id AND osv.os_id=sp.os_id(+) AND osv.os_id=ex.os_id(+);
		 */

		
		return this.sqlSession.selectList("com.test.mapper.InstructorMapper.score_osList", instructor_id);
	}

	@Override
	public List<Instructor> scoreSearch(Instructor i) {

		/*
		 * CREATE OR REPLACE VIEW os_learning_status_view 
		 * AS 
		 * SELECT chv.oc_id, os.os_id,
		 * chv.student_id, name_, phone, CASE WHEN dropout_date IS NOT NULL THEN '중도탈락'
		 * WHEN (dropout_date IS NULL) AND (oc_end_date>SYSDATE) THEN '수료예정' WHEN
		 * (dropout_date IS NULL) AND (oc_end_date<SYSDATE) THEN '수료' END
		 * learning_status, NVL(dropout_date, oc_end_date) course_end_date,
		 * instructor_id 
		 * FROM course_history_dropouts_view chv, offered_subjects os,
		 * student_detail_view sdv, offered_courses oc 
		 * WHERE chv.oc_id=os.oc_id 
		 * AND chv.student_id=sdv.student_id AND chv.oc_id=oc.oc_id;
		 */
		/*
		 * CREATE OR REPLACE VIEW instructor_41_2_view 
		 * AS 
		 * SELECT olv.os_id, olv.student_id, name_, phone, learning_status, course_end_date,
		 * attendance_score, writing_score, practice_score,
		 * (attendance_score+writing_score+practice_score) total_score, instructor_id
		 * FROM os_learning_status_view olv, scores s 
		 * WHERE olv.student_id=s.student_id(+) 
		 * AND olv.os_id=s.os_id(+);
		 */
		
		return this.sqlSession.selectList("com.test.mapper.InstructorMapper.scoreSearch", i);
	}

	@Override
	public int percentageAdd(Instructor i) {

		return this.sqlSession.insert("com.test.mapper.InstructorMapper.percentageAdd", i);
	}

	@Override
	public int examAdd(Instructor i) {

		return this.sqlSession.insert("com.test.mapper.InstructorMapper.examAdd", i);
	}

	@Override
	public Instructor scorePercentage(String os_id) {
		return this.sqlSession.selectOne("com.test.mapper.InstructorMapper.scorePercentage", os_id);
	}

	@Override
	public int scoreAdd(Instructor i) {
		return this.sqlSession.insert("com.test.mapper.InstructorMapper.scoreAdd", i);
	}

	@Override
	public int percentageDelete(Instructor i) {
		
		/*
		 * CREATE OR REPLACE VIEW instructor_32_2_view 
		 * AS SELECT os.os_id,attendance_percentage,writing_percentage, practice_percentage,
		 * os_start_date, os_end_date,bs_id, textbook_id, instructor_id, oc_id 
		 * FROM score_percentages sp, offered_subjects os WHERE sp.os_id=os.os_id;
		 */
		
		return this.sqlSession.delete("com.test.mapper.InstructorMapper.percentageDelete", i);
	}

	@Override
	public int scoreDelete(Instructor i) {
		
		/*
		 * CREATE OR REPLACE VIEW instructor_43_2_view 
		 * AS 
		 * SELECT olv.os_id, score_id, olv.student_id, name_, phone, learning_status, course_end_date,
		 * attendance_score, writing_score, practice_score,
		 * (attendance_score+writing_score+practice_score) total_score, instructor_id
		 * FROM os_learning_status_view olv, scores s 
		 * WHERE olv.student_id=s.student_id(+) AND olv.os_id=s.os_id(+) ORDER BY os_id;
		 */
		
		return this.sqlSession.delete("com.test.mapper.InstructorMapper.scoreDelete", i);
	}

	@Override
	public int examInfoDelete(Instructor i) {
		
		/*
		 * CREATE OR REPLACE VIEW instructor_33_2_view 
		 * AS 
		 * SELECT ex.os_id, exam_date, exam_file, os_start_date, os_end_date, bs_id, textbook_id, instructor_id, oc_id 
		 * FROM exams ex, offered_subjects os 
		 * WHERE ex.os_id=os.os_id;
		 */
		
		return this.sqlSession.delete("com.test.mapper.InstructorMapper.examInfoDelete", i);
	}

	@Override
	public Instructor ocosInfo(String os_id) {
		return this.sqlSession.selectOne("com.test.mapper.InstructorMapper.ocosInfo", os_id);
	}


}
