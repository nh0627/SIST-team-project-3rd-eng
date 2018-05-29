package com.test.service;

import java.util.List;

import com.test.domain.Student;

public interface StudentService {
	// 메인> 수강생 정보
	public List<Student> studentList(Student s);
	
	// 성적 조회> 수강생 수강 과정 목록
	public List<Student> studentCourseList(Student s);
	
	// 성적 조회> 과정별 성적 조회> 성적 목록
	public List<Student> scoreList(Student s);
	
	// 성적 조회> 과정별 성적 조회> 과정 정보 얻어오기
	public Student ocInfo(Student s);
}
