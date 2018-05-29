package com.test.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.test.domain.Student;
import com.test.persistence.StudentDAO;

@Service
public class StudentServiceImpl implements StudentService {

	@Inject
	private StudentDAO studentDAO;
	
	@Override
	public List<Student> studentList(Student s) {
		
		return this.studentDAO.studentList(s);
	}

	@Override
	public List<Student> studentCourseList(Student s) {
		
		return this.studentDAO.studentCourseList(s);
	}

	@Override
	public List<Student> scoreList(Student s) {
		
		return this.studentDAO.scoreList(s);
	}

	@Override
	public Student ocInfo(Student s) {
		
		return this.studentDAO.ocInfo(s);
	}

}
