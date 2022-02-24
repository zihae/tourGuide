package kr.green.tour.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.green.tour.service.MemberService;
import kr.green.tour.vo.MemberVO;


@Controller
public class HomeController {
		  @Autowired
		  MemberService memberService;
		  
		  @RequestMapping(value="/")
		  public ModelAndView main(ModelAndView mv) throws Exception{
		      mv.setViewName("/main/home");
		      
		      return mv;
		  }
		  
		  @RequestMapping(value="/signup", method= RequestMethod.GET)
		  public ModelAndView signupGet(ModelAndView mv, MemberVO user) {
		  	mv.setViewName("/member/signup");
		  	return mv;
		  }
		  
		  @RequestMapping(value="/signup", method = RequestMethod.POST)
		  public ModelAndView signupPost(ModelAndView mv, MemberVO user) {
		  	boolean isSignup = memberService.signup(user);
		  	if(isSignup) {
		  		mv.setViewName("redirect:/");
		  	}
		  	else {
		  		mv.setViewName("redirect:/signup");
		  	}
		  	return mv;
		  }
		  
		  @ResponseBody
		  @RequestMapping(value="idcheck")
		  public String idcheck(String user_id) {
				return memberService.idCheck(user_id);
			}
		  
		  
  
  
}
