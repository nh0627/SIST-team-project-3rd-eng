package com.test.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.test.domain.Instructor;
import com.test.persistence.InstructorDAO;

@Service
public class InstructorServiceImpl implements InstructorService {
	
	@Inject
	private InstructorDAO instructorDAO;

	@Override
	public List<Instructor> instructorList(String instructor_id) {
		return this.instructorDAO.instructorList(instructor_id);
	}

	@Override
	public List<Instructor> courseScheduleList(String instructor_id) {
		return this.instructorDAO.courseScheduleList(instructor_id);
	}

	@Override
	public List<Instructor> studentSearch(Instructor i) {
		return this.instructorDAO.studentSearch(i);
	}

	@Override
	public List<Instructor> percentage_addible_osList(String instructor_id) {
		return this.instructorDAO.percentage_addible_osList(instructor_id);
	}

	@Override
	public List<Instructor> percentage_deletable_osList(String instructor_id) {
		return this.instructorDAO.percentage_deletable_osList(instructor_id);
	}

	@Override
	public List<Instructor> exam_osList(String instructor_id) {
		return this.instructorDAO.exam_osList(instructor_id);
	}

	@Override
	public List<Instructor> score_osList(String instructor_id) {
		return this.instructorDAO.score_osList(instructor_id);
	}

	@Override
	public List<Instructor> scoreSearch(Instructor i) {
		return this.instructorDAO.scoreSearch(i);
	}

	@Override
	public int percentageAdd(Instructor i) {
		return this.instructorDAO.percentageAdd(i);
	}

	@Override
	public int examAdd(Instructor i) {
		return this.instructorDAO.examAdd(i);
	}

	@Override
	public Instructor scorePercentage(String os_id) {
		return this.instructorDAO.scorePercentage(os_id);
	}

	@Override
	public int scoreAdd(Instructor i) {
		return this.instructorDAO.scoreAdd(i);
	}

	@Override
	public int percentageDelete(Instructor i) {
		return this.instructorDAO.percentageDelete(i);
	}

	@Override
	public int scoreDelete(Instructor i) {
		return this.instructorDAO.scoreDelete(i);
	}

	@Override
	public int examInfoDelete(Instructor i) {
		return this.instructorDAO.examInfoDelete(i);
	}

	@Override
	public Instructor ocosInfo(String os_id) {
		return this.instructorDAO.ocosInfo(os_id);
	}

}
