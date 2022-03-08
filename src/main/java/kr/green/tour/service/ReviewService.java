package kr.green.tour.service;



import kr.green.tour.vo.MemberVO;
import kr.green.tour.vo.ReviewVO;

public interface ReviewService {

	
	
	void registerReview(ReviewVO review, MemberVO user);


}
