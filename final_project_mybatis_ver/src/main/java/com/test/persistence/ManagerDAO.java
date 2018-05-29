package com.test.persistence;

import java.util.List;
import java.util.Map;

import com.test.domain.Manager;

public interface ManagerDAO {


	// 로그인 정보 메소드 
	public List<Manager> loginInfo(String login_id);
	
	// 등록된 과정 목록 출력 메소드 
	public List<Manager> bcList();

	// 등록된 과목 목록 출력 메소드 
	public List<Manager> bsList();

	// 강의실 목록 출력 메소드 
	public List<Manager> classroomList();

	// 교재 목록 출력 메소드 
	public List<Manager> textbookList();

	// 강사 목록 출력 메소드  
	public List<Manager> instructorList();

	// oc_id로 특정 개설 과정의 과목 정보 검색 메소드 
	public List<Manager> oc_osSearch(String oc_id);
	
	// oc_id로 특정 개설 과정의 수강생 검색 메소드 
	public List<Manager> oc_studentSearch(String oc_id);
	
	// 개설 과정 목록(삭제 가능 여부 포함) 출력 메소드 
	public List<Manager> ocList_ds();
	
	// 등록된 강사 목록 출력 메소드 41 
	public List<Manager> instructorList41();
	

	// 개설 과정 목록 출력 메소드 
	public List<Manager> ocList51();
	
	// 수강생 id로 특정 수강생의 수강 취소 가능 과정 검색 메소드  
	public List<Manager> ocSearchToCancle(String student_id);
	
	// 수강생 id로 특정 수강생의 중도 탈락 가능 과정 검색 메소드  
	public List<Manager> ocSearchForDropout(String student_id);
	
	
	// 수강생 id로 특정 수강생의 수강 과정 검색 메소드   
	public List<Manager> ocSearch(String student_id);
	
	// oc_id로 특정 과정의 개설 과목 목록(시험 정보 포함) 검색 메소드  
	public List<Manager> osInfoSearch(String oc_id);

	// 수강생 정보 검색 출력 메소드 
	// 수강생 id, 수강생 이름, 주민번호 뒷자리 기준으로 검색
	public List<Manager> studentInfoSearch(Map<String, Object> map);

	// 수강생 정보 검색 출력 메소드  
	// 수강생 id, 수강생 이름, 주민번호 뒷자리 기준으로 검색 
	public List<Manager> studentInfoSearchPaging(Map<String, Object> map);	
	
	// 
	public Manager studentInfo(String student_id);
	
	// 총 수강생 수 출력 메소드  
	public int studentCount();
	
	// os_id로 수강생 성적 검색 메소드  
	public List<Manager> studentScoreList(String os_id);
	
	// 개설 과정 목록 출력 메소드 61  
	public List<Manager> ocList61();
	
	// oc_id로 특정 과목의 성적 검색 메소드  
	public List<Manager> stu_scoreSearch(Manager m);
	
	
	// -------------------------------------------------------------------------------------------------------

	// 개설 과정 입력 메소드 
	public int ocAdd(Manager m);
	
	// 개설 과목 입력 메소드 
	public int osAdd(Manager m);
	
	// 
	public List<Manager> getinstructor(String bs_id);
	
	// 수강생 개설과정 등록 메소드 
	public int studentOcAdd(Manager m);

	// 수강생 입력 메소드   
	// **************************************************트랜잭션************************************************************************
	public int studentAdd_1(Manager m);

	// 수강생 입력 메소드  
	// **************************************************트랜잭션************************************************************************
	public int studentAdd_2(Manager m);

	// --------------------------------------------------------------------------------------------------------------

	// 개설 과정 삭제 메소드 
	public int ocDelete(String oc_id);
	
	// 개설 과목 삭제 메소드 
	public int osDelete(String os_id);
	
	// 수강 취소 메소드 
	public int courseCancel(Manager m);

	// 수강생 중도탈락 메소드 
	public int studentDropout(Manager m);

	// 수강생 삭제 메소드 
	public int studentDelete(String student_id);

	// 수강생 삭제 메소드 - 프로필 사진명 얻어오기 
	public Manager getProfileImgName(Manager m);


	// ---------------------------------------------------------------------------------------------------------------

	// 목록의 타이틀 정보 반환 메소드 
	public Manager ocInfo(String oc_id);
	
	// 목록의 타이틀 정보 반환 메소드 
	public Manager osInfo(String os_id);
	
	
	
	
	//--------------

	// 등록된 과정 목록(삭제 가능 여부 포함) 출력 메소드
	public List<Manager> bcList_ds();

	// 등록된 과목 목록(삭제 가능 여부 포함) 출력 메소드
	public List<Manager> bsList_ds();

	// 강의실 목록(삭제 가능 여부 포함) 출력 메소드
	public List<Manager> classroomList_ds();

	// 관리자 테이블 검색 메소드
	public List<Manager> managerSearch(Manager m);

	// 교재 목록(삭제 가능 여부 포함) 출력 메소드
	public List<Manager> textbookList_ds();

	// 강사 id를 통한 강의 가능 과목 검색 메소드
	public List<String> availableSubjectList(String instructor_id);
	
	// 이름, 주민번호로 강사 정보 검색 메소드
	public List<Manager> instructorSearch(Manager m);

	// 강사 강의 정보 출력 메소드
	public List<Manager> courseInfoList(String instructor_id);

	// 강사 목록(삭제 가능 여부 포함) 출력 메소드
	public List<Manager> instructorList_ds();

	// 개설 과정 목록 출력 메소드
	public List<Manager> ocList();

	// 개설 과정 id 검색을 통한 개설 과정 기간일 반환 메소드
	public List<Manager> ocDate(Manager m);

	// oc_id로 특정 개설 과정의 과목 정보 검색 메소드
	public List<Manager> oc_osSearch(Manager m);

	// oc_id로 특정 개설 과정의 수강생 검색 메소드
	public List<Manager> oc_studentSearch(Manager m);

	// 입력 가능한 개설 과정 목록 출력 메소드
	public List<Manager> ocAddibleList();

	// oc_id로 특정 개설 과정의 과목 정보 검색 메소드 41
	public List<Manager> oc_osSearch41(Manager m);

	// 개설 과목 목록 출력 메소드
	public List<Manager> osList();

	// 삭제 가능한 개설 과목 목록 출력 메소드
	public List<Manager> osDeletableList();

	// 수강생 목록 출력 메소드
	public List<Manager> studentList();

	// 이름, 주민번호 뒷자리로 수강생 검색 메소드
	public List<Manager> studentSearch(Manager m);

	// 수강생 id로 특정 수강생의 수강 취소 가능 과정 검색 메소드
	public List<Manager> ocSearchToCancle(Manager m);

	// 수강생 id로 특정 수강생의 중도 탈락 가능 과정 검색 메소드
	public List<Manager> ocSearchForDropout(Manager m);

	// 이름으로 수강생(삭제 가능 여부 포함) 검색 메소드
	public List<Manager> studentSearch_ds(Manager m);

	// 이름으로 수강생 검색 메소드 61
	public List<Manager> studentSearch(String name_2);

	// 수강생 id로 특정 수강생의 수강 과정 검색 메소드
	public List<Manager> ocSearch(Manager m);

	// oc_id로 특정 과정의 개설 과목 목록(시험 정보 포함) 검색 메소드
	public List<Manager> osInfoSearch(Manager m);

	// os_id로 수강생 성적 검색 메소드
	public List<Manager> studentScoreList(Manager m);

	// oc_id로 특정 과정의 개설 과목 목록(시험 정보 포함) 검색 메소드 61
	public List<Manager> osInfoSearch61(Manager m);

	// oc_id로 특정 과정의 제목, 기간 검색 메소드
	public Manager ocInfo(Manager m);

	// -------------------------------------------------------------------------------------------------------

	// 기초 과정 입력 메소드
	public int bcAdd(Manager m);

	// 기초 과목 입력 메소드
	public int bsAdd(Manager m);

	// 강의실 입력 메소드
	public int classroomAdd(Manager m);

	// 교재 정보 입력 메소드
	public int textbookAdd(Manager m);

	// 강사 정보 입력 메소드
	// ******************************************************트랜잭션********************************************************************
	public int instructorAdd_1(Manager m);
	
	public int instructorAdd_2(Manager m);
	
	public int instructorAdd_3(Manager m);
	
	// 강의 가능 과목 입력 메소드
	public int inst_availableSubjectAdd(Manager m);

	// 수강생 입력 메소드
	// **************************************************트랜잭션************************************************************************
	public int studentAdd(Manager m);

	// --------------------------------------------------------------------------------------------------------------

	// 기초 과정 삭제 메소드
	public int bcDelete(String bc_id);

	// 기초 과목 삭제 메소드
	public int bsDelete(String bs_id);

	// 강의실 삭제 메소드
	public int classroomDelete(String classroom_id);

	// 교재 삭제 메소드
	public int textbookDelete(String textbook_id);

	// 강사 삭제 메소드
	public int instructorDelete(String instructor_id);

	// ---------------------------------------------------------------------------------------------------------------

	// 개설 과목 입력 시 강의 가능 과목 테이블에서 과목명-강사 매치 확인 메소드
	public int availableSubjectCheck(Manager m);

	Manager instructorInfo(String instructor_id);

	List<Manager> getinstructor(Manager m);

	Manager osInfo(Manager m);

	public Manager studentInfo(Manager m);

	public int studentDropout(String oc_id, String student_id, String dropout_date);

	public int instructorUpdate_1(String instructor_id);
	
	public int instructorUpdate_2(Manager m);


}