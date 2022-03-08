package kr.green.tour.dao;


import org.apache.ibatis.annotations.Param;

import kr.green.tour.vo.ReviewVO;

public interface ReviewDAO {

	void registerReview(@Param("review")ReviewVO review);



}
