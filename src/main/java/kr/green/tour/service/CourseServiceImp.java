package kr.green.tour.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.tour.dao.CourseDAO;

@Service
public class CourseServiceImp implements CourseService {

	@Autowired
	CourseDAO mapDao;
}
