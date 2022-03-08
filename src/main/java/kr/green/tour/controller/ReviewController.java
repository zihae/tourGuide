package kr.green.tour.controller;



import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.green.tour.service.ReviewService;
import kr.green.tour.vo.MemberVO;
import kr.green.tour.vo.ReviewVO;

@Controller
@RequestMapping(value="/review")
public class ReviewController {
	
	@Autowired
	ReviewService reviewService;
	
	@RequestMapping(value="/list")
	public ModelAndView reviewList(ModelAndView mv) {
		
		mv.setViewName("/review/list");
		return mv;
		
	}
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public ModelAndView reviewRegisterGet(ModelAndView mv) {
		mv.setViewName("/review/register");
		return mv;
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public ModelAndView reviewRegisterPost(ModelAndView mv, ReviewVO review, HttpServletRequest request) {
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		reviewService.registerReview(review,user);
		mv.setViewName("redirect:/review/list");
		return mv;
	}

}
