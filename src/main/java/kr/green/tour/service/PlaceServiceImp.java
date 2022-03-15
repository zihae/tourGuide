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
			// 다오에게 type에 맞는 게시글 전체수를 가져오라고 시킴
			return placeDao.selectTotalCount(cri);
		}
}
