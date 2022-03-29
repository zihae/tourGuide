package kr.green.tour.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.tour.dao.PlaceDAO;
import kr.green.tour.pagination.Criteria;
import kr.green.tour.vo.PlaceVO;

@Service
public class PlaceServiceImp implements PlaceService {
		@Autowired
		PlaceDAO placeDao;

		@Override
		public List<PlaceVO> getPlaceList(Criteria cri) {
			return placeDao.selectPlaceList(cri);
		}

		@Override
		public int getTotalCount(Criteria cri) {
			return placeDao.selectTotalCount(cri);
		}

		@Override
		public void insertPlace(PlaceVO place) {
			 placeDao.insertPlace(place);
			
		}

		@Override
		public void updatePlace(PlaceVO place) {
			if(place == null || place.getLodgeId() == null)
				return;
			PlaceVO db = placeDao.selectPlaceVO(place.getLodgeId());
			if(db == null)
				placeDao.updatePlace(place);
			
		}

		

		
}
