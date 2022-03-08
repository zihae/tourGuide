package kr.green.tour.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.tour.dao.PlaceDAO;

@Service
public class PlaceServiceImp implements PlaceService {
		@Autowired
		PlaceDAO placeDao;
}
