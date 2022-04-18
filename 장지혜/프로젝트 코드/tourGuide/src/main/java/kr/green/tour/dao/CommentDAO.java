package kr.green.tour.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.green.tour.pagination.Criteria;
import kr.green.tour.vo.CommentVO;

public interface CommentDAO {


	void insertComment(@Param("comment")CommentVO comment);

	List<CommentVO> selectCommentList(@Param("review_id")Integer review_id, @Param("cri")Criteria cri);

	int selectCommentCount(@Param("review_id") Integer review_id);

	CommentVO selectComment(@Param("co_num")Integer co_num);

	void deleteComment(@Param("co_num")Integer co_num);

	void updateComment(@Param("comment")CommentVO comment);

}
