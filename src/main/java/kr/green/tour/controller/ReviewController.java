package kr.green.tour.controller;



import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.green.tour.pagination.Criteria;
import kr.green.tour.pagination.PageMaker;
import kr.green.tour.service.ReviewService;
import kr.green.tour.vo.MemberVO;
import kr.green.tour.vo.ReviewVO;

@Controller
@RequestMapping(value="/review")
public class ReviewController {
	
	@Autowired
	ReviewService reviewService;
	
	//게시글 리스트
	@RequestMapping(value="/list")
	public ModelAndView reviewList(ModelAndView mv, Criteria cri) {
		List<ReviewVO> list = reviewService.getReviewList(cri);
		int totalCount = reviewService.getTotal(cri);
		PageMaker pm = new PageMaker(totalCount,10,cri);
		mv.addObject("pm",pm);
		mv.addObject("list", list);
		mv.setViewName("/review/list");
		return mv;
		
	}
	
	//게시글 등록
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public ModelAndView reviewRegisterGet(ModelAndView mv) {
		mv.setViewName("/review/register");
		return mv;
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public ModelAndView reviewRegisterPost(ModelAndView mv, ReviewVO review, HttpServletRequest request) {
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		review.setReview_member_id(user.getUser_id());
		review.setBoard_type("review");
		reviewService.registerReview(review);
		mv.setViewName("redirect:/review/list");
		return mv;
	}
	
	//게시글 상세
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public ModelAndView reviewDetail(ModelAndView mv, Integer review_id) {
		mv.setViewName("/review/detail");
		ReviewVO review = reviewService.getReviewNum(review_id);
		mv.addObject("review",review);
		return mv;
	}
	
	//게시글 삭제
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public ModelAndView reviewDelete(ModelAndView mv, Integer review_id, HttpServletRequest request) {
		//로그인한 유저 정보 확인
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		reviewService.deleteReview(review_id, user);
		mv.setViewName("redirect:/review/list");
		return mv;
	}
	
	//게시글 수정
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public ModelAndView reviewModifyGet(ModelAndView mv, Integer review_id, HttpServletRequest request) {
		//서비스에게 번호와 로그인 회원 정보를 알려주면서 번호와 작성자가 일치하는 게시글을 가져오라고 시킴
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		ReviewVO review = reviewService.selectReview(review_id, user);
		
		if(review == null) {
			mv.setViewName("redirect:review/list");
		}else {
			mv.addObject("review", review);
			mv.setViewName("/review/modify");		
		}
		return mv;
		}
	
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public ModelAndView reviewModifyPost(ModelAndView mv, ReviewVO review) {
		//서비스에게 게시글 정보를 주면서 업데이트하라고 시킴
		reviewService.updateReview(review);
		//게시글 번호를 넘겨줌
		mv.addObject("review_id", review.getReview_id());	
		mv.setViewName("redirect:/review/detail");
		return mv;
	}
	
	
}
