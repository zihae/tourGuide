package kr.green.tour.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.tour.pagination.Criteria;
import kr.green.tour.dao.CommentDAO;
import kr.green.tour.vo.CommentVO;
import kr.green.tour.vo.MemberVO;

@Service
public class CommentServiceImp implements CommentService {
	
	@Autowired
	CommentDAO commentDao;

	@Override
	public boolean insertComment(CommentVO comment, MemberVO user) {
		if(comment == null || user == null)
			return false;
		if(!comment.getCo_me_id().equals(user.getUser_id()))
			return false;
		
		commentDao.insertComment(comment);
		return true;
	}

	@Override
	public List<CommentVO> selectCommentList(Integer review_id, Criteria cri) {
		if(review_id == null || review_id <= 0)
			return null;
		return commentDao.selectCommentList(review_id, cri);
	}

	@Override
	public int selectCommentCount(Integer review_id) {
		if(review_id == null || review_id <= 0)
			return 0;
		return commentDao.selectCommentCount(review_id);
	}

	@Override
	public boolean deleteComment(Integer co_num, MemberVO user) {
		if(co_num == null || co_num <=0 || user == null)
		return false;
	CommentVO comment = commentDao.selectComment(co_num);
	
	if(comment == null || !comment.getCo_me_id().equals(comment.getCo_me_id()))
		return false;
	
	commentDao.deleteComment(co_num);
	return true;
	}

	@Override
	public boolean modifyComment(CommentVO comment, MemberVO user) {
		if(comment == null || user == null)
			return false;
		if(comment.getCo_num() <= 0)
			return false;
		//dbComment 만드는 이유: 사용자의 정보를 확인, 올바른 접근인지 확인하기 위해 
		CommentVO dbComment = commentDao.selectComment(comment.getCo_num());
		if(dbComment == null)
			return false;
		if(!dbComment.getCo_me_id().equals(user.getUser_id()))
			return false;
		commentDao.updateComment(comment);
		return true;
	}


}
