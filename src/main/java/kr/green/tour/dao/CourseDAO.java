package kr.green.tour.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.green.tour.pagination.Criteria;
import kr.green.tour.vo.CityVO;
import kr.green.tour.vo.PlaceVO;

public interface CourseDAO {

	List<CityVO> selectCity();

	List<PlaceVO> selectMapList(@Param("cri")Criteria cri);

}
