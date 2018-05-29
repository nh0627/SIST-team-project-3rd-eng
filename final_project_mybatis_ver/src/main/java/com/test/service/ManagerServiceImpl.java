package com.test.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.test.domain.Manager;
import com.test.persistence.ManagerDAO;

@Service
public class ManagerServiceImpl implements ManagerService {
	@Inject
	private ManagerDAO managerDAO;

	@Override
	public List<Manager> loginInfo(String login_id) {
		return this.managerDAO.loginInfo(login_id);
	}

	@Override
	public List<Manager> bcList() {
		return this.managerDAO.bcList();
	}

	@Override
	public List<Manager> bcList_ds() {
		// TODO Auto-generated method stub
		return this.managerDAO.bcList_ds();
	}

	@Override
	public List<Manager> bsList() {
		// TODO Auto-generated method stub
		return this.managerDAO.bsList();
	}

	@Override
	public List<Manager> bsList_ds() {
		// TODO Auto-generated method stub
		return this.managerDAO.bsList_ds();
	}

	@Override
	public List<Manager> classroomList() {
		// TODO Auto-generated method stub
		return this.managerDAO.classroomList();
	}

	@Override
	public List<Manager> classroomList_ds() {
		// TODO Auto-generated method stub
		return this.managerDAO.classroomList_ds();
	}

	@Override
	public List<Manager> textbookList() {
		// TODO Auto-generated method stub
		return this.managerDAO.textbookList();
	}

	@Override
	public List<Manager> textbookList_ds() {
		// TODO Auto-generated method stub
		return this.managerDAO.textbookList_ds();
	}

	@Override
	public List<String> availableSubjectList(String instructor_id) {
		// TODO Auto-generated method stub
		return this.managerDAO.availableSubjectList(instructor_id);
	}

	@Override
	public List<Manager> instructorSearch(Manager m) {
		// TODO Auto-generated method stub
		return this.managerDAO.instructorSearch(m);
	}

	@Override
	public List<Manager> instructorList() {
		// TODO Auto-generated method stub
		return this.managerDAO.instructorList();
	}

	@Override
	public List<Manager> courseInfoList(String instructor_id) {
		// TODO Auto-generated method stub
		return this.managerDAO.courseInfoList(instructor_id);
	}

	@Override
	public List<Manager> instructorList_ds() {
		// TODO Auto-generated method stub
		return this.managerDAO.instructorList_ds();
	}

	@Override
	public List<Manager> ocList() {
		// TODO Auto-generated method stub
		return this.managerDAO.ocList();
	}

	@Override
	public List<Manager> ocDate(Manager m) {
		// TODO Auto-generated method stub
		return this.managerDAO.ocDate(m);
	}

	@Override
	public List<Manager> ocAddibleList() {
		// TODO Auto-generated method stub
		return this.managerDAO.ocAddibleList();
	}

	@Override
	public List<Manager> oc_osSearch41(Manager m) {
		// TODO Auto-generated method stub
		return this.managerDAO.oc_osSearch41(m);
	}

	@Override
	public List<Manager> osList() {
		// TODO Auto-generated method stub
		return this.managerDAO.osList();
	}

	@Override
	public List<Manager> osDeletableList() {
		// TODO Auto-generated method stub
		return this.managerDAO.osDeletableList();
	}

	@Override
	public List<Manager> studentList() {
		// TODO Auto-generated method stub
		return this.managerDAO.studentList();
	}

	@Override
	public List<Manager> studentSearch(Manager m) {
		// TODO Auto-generated method stub
		return this.managerDAO.studentSearch(m);
	}

	@Override
	public List<Manager> studentSearch_ds(Manager m) {
		// TODO Auto-generated method stub
		return this.managerDAO.studentSearch_ds(m);
	}

	@Override
	public List<Manager> studentSearch(String name_2) {
		// TODO Auto-generated method stub
		return this.managerDAO.studentSearch(name_2);
	}

	@Override
	public List<Manager> osInfoSearch61(Manager m) {
		// TODO Auto-generated method stub
		return this.managerDAO.osInfoSearch61(m);
	}

	@Override
	public List<Manager> oc_osSearch(String oc_id) {
		// TODO Auto-generated method stub
		return this.managerDAO.oc_osSearch(oc_id);
	}

	@Override
	public List<Manager> oc_studentSearch(String oc_id) {
		// TODO Auto-generated method stub
		return this.managerDAO.oc_studentSearch(oc_id);
	}

	@Override
	public List<Manager> ocList_ds() {
		// TODO Auto-generated method stub
		return this.managerDAO.ocList_ds();
	}

	@Override
	public List<Manager> instructorList41() {
		// TODO Auto-generated method stub
		return this.managerDAO.instructorList41();
	}

	@Override
	public List<Manager> ocList51() {
		// TODO Auto-generated method stub
		return this.managerDAO.ocList51();
	}

	@Override
	public List<Manager> ocSearchToCancle(String student_id) {
		// TODO Auto-generated method stub
		return this.managerDAO.ocSearchToCancle(student_id);
	}

	@Override
	public List<Manager> ocSearchForDropout(String student_id) {
		// TODO Auto-generated method stub
		return this.managerDAO.ocSearchForDropout(student_id);
	}

	@Override
	public List<Manager> ocSearch(String student_id) {
		// TODO Auto-generated method stub
		return this.managerDAO.ocSearch(student_id);
	}

	@Override
	public List<Manager> osInfoSearch(String oc_id) {
		// TODO Auto-generated method stub
		return this.managerDAO.osInfoSearch(oc_id);
	}

	@Override
	public List<Manager> studentInfoSearch(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return this.managerDAO.studentInfoSearch(map);
	}

	@Override
	public List<Manager> studentInfoSearchPaging(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return this.managerDAO.studentInfoSearchPaging(map);
	}

	@Override
	public Manager studentInfo(String student_id) {
		// TODO Auto-generated method stub
		return this.managerDAO.studentInfo(student_id);
	}

	@Override
	public int studentCount() {
		// TODO Auto-generated method stub
		return this.managerDAO.studentCount();
	}

	@Override
	public List<Manager> studentScoreList(String os_id) {
		// TODO Auto-generated method stub
		return this.managerDAO.studentScoreList(os_id);
	}

	@Override
	public List<Manager> ocList61() {
		// TODO Auto-generated method stub
		return this.managerDAO.ocList61();
	}

	@Override
	public List<Manager> stu_scoreSearch(Manager m) {
		// TODO Auto-generated method stub
		return this.managerDAO.stu_scoreSearch(m);
	}

	@Override
	public int ocAdd(Manager m) {
		// TODO Auto-generated method stub
		return this.managerDAO.ocAdd(m);
	}

	@Override
	public int osAdd(Manager m) {
		// TODO Auto-generated method stub
		return this.managerDAO.osAdd(m);
	}

	@Override
	public List<Manager> getinstructor(String bs_id) {
		// TODO Auto-generated method stub
		return this.managerDAO.getinstructor(bs_id);
	}

	@Override
	public int studentOcAdd(Manager m) {
		// TODO Auto-generated method stub
		return this.managerDAO.studentOcAdd(m);
	}

	@Transactional
	@Override
	public int studentAdd(Manager m) {
		
		int result = this.managerDAO.studentAdd_1(m);
		result = this.managerDAO.studentAdd_2(m);
		
		return result;
	}


	@Override
	public int ocDelete(String oc_id) {
		// TODO Auto-generated method stub
		return this.managerDAO.ocDelete(oc_id);
	}

	@Override
	public int osDelete(String os_id) {
		// TODO Auto-generated method stub
		return this.managerDAO.osDelete(os_id);
	}

	@Override
	public int courseCancel(Manager m) {
		// TODO Auto-generated method stub
		return this.managerDAO.courseCancel(m);
	}

	@Override
	public int studentDropout(Manager m) {
		// TODO Auto-generated method stub
		return this.managerDAO.studentDropout(m);
	}

	@Override
	public int studentDelete(String student_id) {
		// TODO Auto-generated method stub
		return this.managerDAO.studentDelete(student_id);
	}

	@Override
	public Manager getProfileImgName(Manager m) {
		// TODO Auto-generated method stub
		return this.managerDAO.getProfileImgName(m);
	}

	@Override
	public Manager ocInfo(String oc_id) {
		// TODO Auto-generated method stub
		return this.managerDAO.ocInfo(oc_id);
	}

	@Override
	public Manager osInfo(String os_id) {
		// TODO Auto-generated method stub
		return this.managerDAO.osInfo(os_id);
	}

	@Override
	public int bcAdd(Manager m) {
		// TODO Auto-generated method stub
		return this.managerDAO.bcAdd(m);
	}

	@Override
	public int bsAdd(Manager m) {
		// TODO Auto-generated method stub
		return this.managerDAO.bsAdd(m);
	}

	@Override
	public int classroomAdd(Manager m) {
		// TODO Auto-generated method stub
		return this.managerDAO.classroomAdd(m);
	}

	@Override
	public int textbookAdd(Manager m) {
		// TODO Auto-generated method stub
		return this.managerDAO.textbookAdd(m);
	}

	@Transactional
	@Override
	public int instructorAdd(Manager m, List<String> newavailables) {
		int result = this.managerDAO.instructorAdd_1(m);
		result = this.managerDAO.instructorAdd_2(m);
		for(String bs_id : newavailables){
			m.setBs_id(bs_id);
			result = this.managerDAO.instructorAdd_3(m);
		}
		
		return result;
	}

	@Override
	public int inst_availableSubjectAdd(Manager m) {
		// TODO Auto-generated method stub
		return this.managerDAO.inst_availableSubjectAdd(m);
	}

	@Override
	public int bcDelete(String bc_id) {
		// TODO Auto-generated method stub
		return this.managerDAO.bcDelete(bc_id);
	}

	@Override
	public int bsDelete(String bs_id) {
		// TODO Auto-generated method stub
		return this.managerDAO.bsDelete(bs_id);
	}

	@Override
	public int classroomDelete(String classroom_id) {
		// TODO Auto-generated method stub
		return this.managerDAO.classroomDelete(classroom_id);
	}

	@Override
	public int textbookDelete(String textbook_id) {
		// TODO Auto-generated method stub
		return this.managerDAO.textbookDelete(textbook_id);
	}

	@Override
	public int instructorDelete(String instructor_id) {
		// TODO Auto-generated method stub
		return this.managerDAO.instructorDelete(instructor_id);
	}

	@Override
	public int availableSubjectCheck(Manager m) {
		// TODO Auto-generated method stub
		return this.managerDAO.availableSubjectCheck(m);
	}

	@Override
	public Manager instructorInfo(String instructor_id) {
		// TODO Auto-generated method stub
		return this.managerDAO.instructorInfo(instructor_id);
	}

	@Transactional
	@Override
	public int instructorUpdate(List<String> newavailables, String instructor_id) {
		int result = this.managerDAO.instructorUpdate_1(instructor_id);
		
		Manager m = new Manager();
		m.setInstructor_id(instructor_id);
		
		for(String bs_id : newavailables){
			m.setBs_id(bs_id);
			result = this.managerDAO.instructorUpdate_2(m);
		}
		return result;
	}

	
	
}
