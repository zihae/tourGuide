package kr.green.tour.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.tour.dao.ReviewDAO;

@Service
public class ReviewServiceImp implements ReviewService{

	@Autowired
	ReviewDAO reviewDao;
}
