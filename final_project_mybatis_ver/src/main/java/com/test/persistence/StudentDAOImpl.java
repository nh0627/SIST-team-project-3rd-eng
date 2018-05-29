package com.test.persistence;

import java.util.List;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.test.domain.*;

@Repository
public class StudentDAOImpl implements StudentDAO {

	@Inject
	private SqlSession sqlSession;

	@Override
	public List<Student> studentList(Student s) {
		
		/* 수강생 정보 view: student_detail_view
		CREATE OR REPLACE VIEW student_detail_view
		AS
		SELECT student_id, name_, ssn, phone, initial_reg_date
		    , (SELECT COUNT(*) FROM course_history c WHERE c.student_id = s.student_id) AS registration_count
		FROM students s, login l WHERE s.student_id=l.login_id;
		*/
		
		return this.sqlSession.selectList("com.test.mapper.StudentMapper.studentList", s);
	}

	
	@Override
	public List<Student> studentCourseList(Student s) {
		
		/* 과정 history/중도탈락 view: course_history_dropouts
		CREATE OR REPLACE VIEW course_history_dropouts AS
		SELECT ch.oc_id, ch.student_id, dropout_date FROM course_history ch, dropouts d WHERE ch.oc_id=d.oc_id(+) AND ch.student_id=d.student_id(+);
		*/
		/* 개설 과정 정보 view: oc_detail
		CREATE OR REPLACE VIEW oc_detail_view
		AS
		SELECT oc.oc_id, bc.bc_title AS oc_title, oc.oc_start_date, oc.oc_end_date, c.classroom_name
		FROM offered_courses oc, basic_courses bc, classrooms c
		WHERE oc.bc_id=bc.bc_id AND oc.classroom_id=c.classroom_id;
		*/
		/* 개설과정/수료여부 view:
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
		*/
	
		return this.sqlSession.selectList("com.test.mapper.StudentMapper.studentCourseList", s);
		
	}

	@Override
	public List<Student> scoreList(Student s) {

		/* 개설 과목 정보 view: os_detail
		CREATE OR REPLACE VIEW os_detail_view
		AS
		SELECT os.os_id, os_start_date, os_end_date, os.bs_id, bs_name, os.textbook_id, textbook_title, publisher, isbn, os.instructor_id, os.oc_id, oc_start_date, oc_end_date, classroom_id, bc_id
		FROM offered_subjects os, basic_subjects bs, textbooks t, instructors i, offered_courses oc
		WHERE os.bs_id = bs.bs_id
		AND os.textbook_id=t.textbook_id
		AND os.instructor_id=i.instructor_id
		AND os.oc_id=oc.oc_id
		ORDER BY os_id;
		*/
		/*
		개설과목/강사명/배점 view:
		CREATE OR REPLACE VIEW os_de_login_percentages_view
		AS
		SELECT odv.os_id, odv.bs_name AS os_name, odv.os_start_date, odv.os_end_date, textbook_title, publisher, isbn, l.name_, l.profile_img, odv.oc_id, sp.attendance_percentage, sp.writing_percentage, sp.practice_percentage, available_subjects
		FROM os_detail_view odv, login l, score_percentages sp, INSTRUCTOR_AVAILABLE_VIEW avv
		WHERE login_id = odv.instructor_id AND odv.os_id = sp.os_id(+) AND odv.instructor_id=avv.instructor_id
		ORDER BY odv.os_id;
		*/
		/*
		개설과목/강사명/배점/학생별 점수 view:
		CREATE OR REPLACE VIEW os_de_lo_per_sco_view
		AS
		SELECT o.os_id, o.os_name, o.os_start_date, o.os_end_date, o.textbook_title, o.publisher, o.isbn, o.name_, o.profile_img, o.oc_id, o.attendance_percentage, o.writing_percentage, o.practice_percentage
		    , s.score_id, s.student_id, s.attendance_score, s.writing_score, s.practice_score, (s.attendance_score + s.writing_score + s.practice_score) AS total_score, available_subjects
		FROM os_de_login_percentages_view o, scores s WHERE o.os_id = s.os_id(+);
		*/
		/*
		 * 개설과목/강사명/배점/학생별 점수/시험 view:
		CREATE OR REPLACE VIEW os_de_lo_per_sco_ex_view
		AS
		SELECT o.os_id, o.os_name, o.os_start_date, o.os_end_date, o.textbook_title, o.publisher, o.isbn, o.name_, o.profile_img,o.oc_id, o.attendance_percentage, o.writing_percentage, o.practice_percentage
		    , o.score_id, o.student_id, o.attendance_score, o.writing_score, o.practice_score, o.total_score, e.exam_date, e.exam_file, available_subjects
		FROM os_de_lo_per_sco_view o, exams e WHERE o.os_id = e.os_id(+);
		*/
	
		
		return this.sqlSession.selectList("com.test.mapper.StudentMapper.scoreList", s);
	}
	
	
	@Override
	public Student ocInfo(Student s) {

		return this.sqlSession.selectOne("com.test.mapper.StudentMapper.ocInfo", s);
	}
			
}
