package kr.green.tour.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.green.tour.pagination.Criteria;
import kr.green.tour.vo.CityVO;
import kr.green.tour.vo.CourseDetailVO;
import kr.green.tour.vo.CourseVO;
import kr.green.tour.vo.PlaceVO;

public interface CourseDAO {

	List<CityVO> selectCity();

	List<PlaceVO> selectMapList(@Param("cri")Criteria cri);

	List<PlaceVO> selectPlaceList(@Param("city_id")Integer city_id, @Param("main_id")Integer main_id);

	void insertCourse(@Param("co")CourseVO course);

	void insertCourseDetail(@Param("cd")CourseDetailVO cd);

	List<CourseVO> selectCourseList(@Param("course")CourseVO course, @Param("cri")Criteria cri);

	int selectTotal(@Param("cri") Criteria cri);

	CourseDetailVO getDetail(@Param("cd")CourseDetailVO cd);

	


	

}
