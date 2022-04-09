package kr.green.tour.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.green.tour.pagination.Criteria;
import kr.green.tour.service.MessageService;

@Controller
@RequestMapping(value="/message")
public class MessageController {
	@Autowired
	MessageService messageService;
	
	@RequestMapping(value="/list")
	public ModelAndView reviewList(ModelAndView mv, Criteria cri) {
	
	
		mv.setViewName("/message/list");
		return mv;
		
	}
	
	
	
	
	
}
