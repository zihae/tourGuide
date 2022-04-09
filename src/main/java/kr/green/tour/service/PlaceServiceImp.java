package kr.green.tour.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.tour.dao.PlaceDAO;
import kr.green.tour.pagination.Criteria;
import kr.green.tour.vo.LikesVO;
import kr.green.tour.vo.MemberVO;
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
				
				placeDao.updatePlace(place);
			
		}

		@Override
		public PlaceVO getPlaceNum(Integer place_id) {
			if(place_id == null || place_id <= 0)
				return null;
			return placeDao.getPlaceDetail(place_id);
		}

		@Override
		public String likes(LikesVO likes, MemberVO user) {
			if(likes == null || user == null)
				return "fail";
			//DB에서 해당 유저가 해당 게시글을 추천/비추천했는지 확인하기 위해 DB에서 가져옴
			LikesVO dbLikes = placeDao.selectLikes(likes);
			//해당 게시글에 추천/비추천을 한적이 없을 때
			if(dbLikes == null) {
				placeDao.insertLikes(likes);
				//해당 게시글에 추천, 비추천 수를 계산
				placeDao.updatePlaceLikes(likes);
				return ""+ likes.getState();
			}
			//취소하는 경우 => state = 0 (조건 부분 질문하기)
			if(dbLikes.getState() == likes.getState()) {
				likes.setState(0);
				placeDao.updateLikes(likes);
				placeDao.updatePlaceLikes(likes);
				return "0";		
			}
			//추천=>비추천 또는 비추천=>추천, 취소=>추천, 취소=>비추천으로 바뀌는 경우 
			placeDao.updateLikes(likes);
			placeDao.updatePlaceLikes(likes);
			return ""+likes.getState();
		}

		@Override
		public String viewLikes(LikesVO likes, MemberVO user) {
			if(likes == null || user == null)
				return "0";
			LikesVO dbLikes =placeDao.selectLikes(likes);
			if(dbLikes == null)
				return "0";
			return "" + dbLikes.getState();
		}

		

		
}
