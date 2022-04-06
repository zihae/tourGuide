package kr.green.tour.service;



import java.util.List;

import kr.green.tour.pagination.Criteria;
import kr.green.tour.vo.MemberVO;
import kr.green.tour.vo.ReviewVO;

public interface ReviewService {
	
	void registerReview(ReviewVO review);

	List<ReviewVO> getReviewList(Criteria cri);

	int getTotal(Criteria cri);

	ReviewVO getReviewNum(Integer review_id);

	void deleteReview(Integer review_id, MemberVO user);

	ReviewVO selectReview(Integer review_id, MemberVO user);

	void updateReview(ReviewVO review);

	void updateViews(Integer review_id);
 

}
