package kr.green.tour.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.tour.dao.CourseDAO;
import kr.green.tour.pagination.Criteria;
import kr.green.tour.vo.CityVO;
import kr.green.tour.vo.CourseDetailVO;
import kr.green.tour.vo.CourseVO;
import kr.green.tour.vo.MemberVO;
import kr.green.tour.vo.PlaceVO;

@Service
public class CourseServiceImp implements CourseService {

	@Autowired
	CourseDAO courseDao;

	@Override
	public List<CityVO> selectCity() {
		
		return courseDao.selectCity();
	}

	

	@Override
	public List<PlaceVO> getMapList(Criteria cri) {
		return courseDao.selectMapList(cri);
		
	}



	@Override
	public List<PlaceVO> selectPlaceList(Integer city_id, Integer main_id) {
		
		return courseDao.selectPlaceList(city_id, main_id);
	}



	@Override
	public int insertCourse(CourseVO course, MemberVO member) {
		if(course == null ||  member == null)
			return -1;
		course.setCourse_writer_id(member.getUser_id());
		courseDao.insertCourse(course);
		return course.getCourse_id();
	}



	@Override
	public int insertCourseDetail(CourseDetailVO cd) {
		if(cd == null)
			return -1;
		courseDao.insertCourseDetail(cd);
		return 0;
	}



	
}
