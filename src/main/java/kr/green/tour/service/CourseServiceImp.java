package kr.green.tour.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.tour.dao.CourseDAO;
import kr.green.tour.pagination.Criteria;
import kr.green.tour.vo.CityVO;
import kr.green.tour.vo.PlaceVO;

@Service
public class CourseServiceImp implements CourseService {

	@Autowired
	CourseDAO courseDao;

	@Override
	public List<CityVO> selectCity() {
		
		return courseDao.selectCity();
	}

	

	@Override
	public List<PlaceVO> getMapList(Criteria cri) {
		return courseDao.selectMapList(cri);
		
	}
}
