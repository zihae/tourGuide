package kr.green.tour.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.green.tour.pagination.Criteria;
import kr.green.tour.service.MessageService;
import kr.green.tour.vo.MemberVO;
import kr.green.tour.vo.MessageVO;

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
	
	//쪽지 쓰기
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public ModelAndView reviewWriteGet(ModelAndView mv) {
		mv.setViewName("/message/write");
		return mv;		
	}
	
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public ModelAndView reviewWritePost(ModelAndView mv, MessageVO message, HttpServletRequest request) {
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		message.setSender_id(user.getUser_id());
		messageService.writeMessage(message);
		mv.setViewName("/message/write");
		return mv;		
	}
	
	
	
	
	
}
