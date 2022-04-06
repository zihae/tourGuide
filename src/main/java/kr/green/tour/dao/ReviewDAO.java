package kr.green.tour.dao;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.green.tour.pagination.Criteria;
import kr.green.tour.vo.ReviewVO;

public interface ReviewDAO {

	void registerReview(@Param("review")ReviewVO review);

	List<ReviewVO> selectReviewList(@Param("cri")Criteria cri);

	int selectTotal(@Param("cri")Criteria cri);

	ReviewVO getBoardNum(@Param("review_id")Integer review_id);

	void deleteReview(@Param("review_id") Integer review_id);

	void updateReview(@Param("review")ReviewVO dbReview);



}
