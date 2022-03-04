package kr.green.tour.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.green.tour.service.ReviewService;

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
	

}
