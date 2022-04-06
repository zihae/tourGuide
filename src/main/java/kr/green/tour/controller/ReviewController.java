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

}
