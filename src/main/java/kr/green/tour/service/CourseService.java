package kr.green.tour.service;

import java.util.List;

import kr.green.tour.pagination.Criteria;
import kr.green.tour.vo.CityVO;
import kr.green.tour.vo.CourseDetailVO;
import kr.green.tour.vo.CourseVO;
import kr.green.tour.vo.MemberVO;
import kr.green.tour.vo.PlaceVO;

public interface CourseService {

	List<CityVO> selectCity();

	List<PlaceVO> getMapList(Criteria cri);

	List<PlaceVO> selectPlaceList(Integer city_id, Integer main_id);

	int insertCourse(CourseVO course, MemberVO member);

	int insertCourseDetail(CourseDetailVO cd);

	List<CourseVO> getCourseList(CourseVO course, MemberVO member, Criteria cri);

	int getTotal(Criteria cri);


	

	

}
