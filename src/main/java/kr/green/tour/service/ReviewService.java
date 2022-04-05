package kr.green.tour.service;



import java.util.List;

import kr.green.tour.pagination.Criteria;
import kr.green.tour.vo.ReviewVO;

public interface ReviewService {
	
	void registerReview(ReviewVO review);

	List<ReviewVO> getReviewList(Criteria cri);

	int getTotal(Criteria cri);


}
