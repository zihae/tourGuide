package kr.green.tour.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.green.tour.pagination.Criteria;
import kr.green.tour.vo.PlaceVO;

public interface PlaceDAO {

	List<PlaceVO> selectPlaceList(@Param("cri")Criteria cri);

	int selectTotalCount(@Param("cri")Criteria cri);

	void insertPlace(@Param("place")PlaceVO place);

	void updatePlace(@Param("place")PlaceVO place);

	PlaceVO selectPlaceVO( @Param("lodgeId") String lodgeId);

	PlaceVO getPlaceDetail(@Param("place_id")Integer place_id);

	

	


}
