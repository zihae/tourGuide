package kr.green.tour.service;

import java.util.List;

import kr.green.tour.pagination.Criteria;
import kr.green.tour.vo.CommentVO;
import kr.green.tour.vo.MemberVO;

public interface CommentService {

	boolean insertComment(CommentVO comment, MemberVO user);

	List<CommentVO> selectCommentList(Integer review_id, Criteria cri);

	int selectCommentCount(Integer review_id);

	boolean deleteComment(Integer co_num, MemberVO user);

	boolean modifyComment(CommentVO comment, MemberVO user);


}
