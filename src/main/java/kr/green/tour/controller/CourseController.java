package kr.green.tour.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import kr.green.tour.pagination.Criteria;
import kr.green.tour.service.CourseService;
import kr.green.tour.vo.CourseVO;

@Controller
public class CourseController {

		@Autowired
		CourseService courseService;
		
		//나만의 여행지도 리스트
		@RequestMapping(value="/course/list", method=RequestMethod.GET)
		public ModelAndView courseList(ModelAndView mv, Criteria cri) {
			
			mv.setViewName("/course/list");
			return mv;
		}
		
		@RequestMapping(value="/course/register", method=RequestMethod.GET)
		public ModelAndView courseRegisterGet(ModelAndView mv, CourseVO course) {
			mv.addObject("course", course);
			mv.setViewName("/course/register");
			return mv;
		}
		
		
}
