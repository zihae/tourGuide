package kr.green.tour.service;

import java.util.List;

import kr.green.tour.pagination.Criteria;
import kr.green.tour.vo.PlaceVO;

public interface PlaceService {

	List<PlaceVO> getPlaceList(Criteria cri);

	int getTotalCount(Criteria cri);

	void insertPlace(PlaceVO place);

	void updatePlace(PlaceVO place);

	

	

}
