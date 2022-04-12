package kr.green.tour.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.green.tour.service.MessageService;
import kr.green.tour.vo.MemberVO;
import kr.green.tour.vo.MessageVO;

@Controller
@RequestMapping(value="/message")
public class MessageController {
	@Autowired
	MessageService messageService;
	
	//받은 메세지 리스트
	@RequestMapping(value="/list")
	public ModelAndView messageList(ModelAndView mv, MessageVO message, HttpServletRequest request) {
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		message.setReceiver_id(user.getUser_id());
		List<MessageVO> list = messageService.getMessage(message, user);
		mv.addObject("list", list);
		mv.setViewName("/message/list");
		return mv;
		
	}
	
	//보낸 메세지 리스트
		@RequestMapping(value="/sendList")
		public ModelAndView sendList(ModelAndView mv, MessageVO message, HttpServletRequest request) {
			MemberVO user = (MemberVO)request.getSession().getAttribute("user");
			message.setSender_id(user.getUser_id());
			List<MessageVO> list = messageService.getSendMessage(message, user);
			mv.addObject("list", list);
			mv.setViewName("/message/sendList");
			return mv;
			
		}
	
	//쪽지 쓰기
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public ModelAndView messageWriteGet(ModelAndView mv) {
		mv.setViewName("/message/write");
		return mv;		
	}
	
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public ModelAndView messageWritePost(ModelAndView mv, MessageVO message, HttpServletRequest request) {
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		message.setSender_id(user.getUser_id());
		messageService.writeMessage(message);
		mv.setViewName("/message/write");
		return mv;		
	}
	
	//메세지 상세
	@RequestMapping(value="/detail")
	public ModelAndView messageDetail(ModelAndView mv, Integer message_id, MessageVO dbmessage, HttpServletRequest request ) {
		MessageVO message = messageService.getMessageNum(message_id);
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		if(message.getReceiver_id().equals(user.getUser_id())) {
			messageService.updateRead(dbmessage);
		}
		mv.addObject("message",message);
		mv.setViewName("/message/detail");
		return mv;
	}
	
	//받은 메세지 삭제
	@RequestMapping(value="/delete")
	public ModelAndView recieveDelete(ModelAndView mv, Integer message_id, HttpServletRequest request) {
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		messageService.deleteMessage(message_id, user);
		mv.setViewName("redirect:/message/list");
		return mv;
	}
	
	//보낸 메세지 삭제
	@RequestMapping(value="/sendDelete")
	public ModelAndView sendDelete(ModelAndView mv, Integer message_id, HttpServletRequest request) {
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		messageService.deleteSend(message_id, user);
		mv.setViewName("redirect:/message/sendList");
		return mv;
	}
	
	//삭제한 메세지 리스트
	@RequestMapping(value="/trash")
	public ModelAndView trashList(ModelAndView mv, MessageVO message, HttpServletRequest request) {
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		message.setReceiver_id(user.getUser_id());
		message.setSender_id(user.getUser_id());
		List<MessageVO> list = messageService.getTrash(message, user);
		mv.addObject("list", list);
		mv.setViewName("/message/trash");
		return mv;
		
	}
	

	
	
	
	
	
	
}
