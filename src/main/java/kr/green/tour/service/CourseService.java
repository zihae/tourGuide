package kr.green.tour.service;

import java.util.List;

import kr.green.tour.pagination.Criteria;
import kr.green.tour.vo.CityVO;
import kr.green.tour.vo.PlaceVO;

public interface CourseService {

	List<CityVO> selectCity();

	List<PlaceVO> getMapList(Criteria cri);

}
