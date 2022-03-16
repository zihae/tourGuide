package kr.green.tour.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.green.tour.pagination.Criteria;
import kr.green.tour.vo.PlaceVO;

public interface PlaceDAO {

	List<PlaceVO> selectPlaceList(@Param("cri")Criteria cri);

	int selectTotalCount(@Param("cri")Criteria cri);

}