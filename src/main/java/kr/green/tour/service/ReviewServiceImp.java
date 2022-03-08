package kr.green.tour.service;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.tour.dao.ReviewDAO;
import kr.green.tour.vo.MemberVO;
import kr.green.tour.vo.ReviewVO;

@Service
public class ReviewServiceImp implements ReviewService{

	@Autowired
	ReviewDAO reviewDao;
	


	@Override
	public void registerReview(ReviewVO review, MemberVO user) {
		if(review == null || user == null)
			return;
		if(review.getTitle() == null || review.getTitle().trim().length() == 0)
			return;
		if(review.getReview_member_id() == null || review.getReview_member_id().trim().length() == 0)
			return;
		review.setReview_member_id(user.getUser_id());
		reviewDao.registerReview(review);
		
	}


}
