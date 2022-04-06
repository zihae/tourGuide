package kr.green.tour.service;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.tour.dao.ReviewDAO;
import kr.green.tour.pagination.Criteria;
import kr.green.tour.vo.ReviewVO;

@Service
public class ReviewServiceImp implements ReviewService{

	@Autowired
	ReviewDAO reviewDao;
	
	@Override
	public void registerReview(ReviewVO review) {
		if(review == null
				|| review.getTitle() == null
				|| review.getContents() == null
				|| review.getReview_member_id() == null)
				return;
		
		reviewDao.registerReview(review);
		
	}



	@Override
	public List<ReviewVO> getReviewList(Criteria cri) {
		return reviewDao.selectReviewList(cri);
	}



	@Override
	public int getTotal(Criteria cri) {
		return reviewDao.selectTotal(cri);
	}



	@Override
	public ReviewVO getReviewNum(Integer review_id) {
		if(review_id == null || review_id <= 0)
			return null;
		return reviewDao.getBoardNum(review_id);
	}


}
