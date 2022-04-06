package kr.green.tour.service;



import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.tour.dao.ReviewDAO;
import kr.green.tour.pagination.Criteria;
import kr.green.tour.vo.MemberVO;
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



	@Override
	public void deleteReview(Integer review_id, MemberVO user) {
		//유효하지 않은 게시글 번호이면 삭제할 필요 없음
		//번호가 null이거나 음수, 0인 경우
		if(review_id == null || review_id <= 0)
			return;
		
		//게시글 번호와 일치하는 게시글 가져옴
		ReviewVO review = reviewDao.getBoardNum(review_id);
		
		//가져온 게시글이 null이면 삭제할 필요 없음
		if(review == null)
			return;
		
		//게시글 작성자와 로그인한 회원 아이디가 같은지 확인하여 다르면 삭제할 필요 없음
		if(!review.getReview_member_id().equals(user.getUser_id()))
			return;
		
		//게시글의 del을 'Y'로 업데이트하고 list select문에서 'N'만 나오게
		reviewDao.deleteReview(review_id);
	}



	@Override
	public ReviewVO selectReview(Integer review_id, MemberVO user) {
		//게시글 번호가 유효한지 체크 => 번호가 없거나 0이하이면 작업할 필요 없음
		if(review_id == null || review_id <= 0)
			return null;
		//다오에게 게시글 가져오라고 시킴
		ReviewVO review = reviewDao.getBoardNum(review_id);
		if(review == null || !review.getReview_member_id().equals(user.getUser_id()))
			return null;
		return review;
	}



	@Override
	public void updateReview(ReviewVO review) {
		//다오에게 게시글 번호와 일치하는 게시글을 가져오라고 시킴
		ReviewVO dbReview = reviewDao.getBoardNum(review.getReview_id());	
		
		//가져온 게시글의 제목과 내용을 review의 제목과 내용으로 덮어쓰기 함
		dbReview.setTitle(review.getTitle());
		dbReview.setContents(review.getContents());
		
		//가져온 게시글의 수정일을 현재 시간으로 업데이트
		dbReview.setModify_date(new Date());	
		
		//다오에게 수정된 게시글 정보를 주면서 업데이트 하라고 시킴
		reviewDao.updateReview(dbReview);
		}



	@Override
	public void updateViews(Integer review_id) {
		reviewDao.updateViews(review_id);
	
	}
}
