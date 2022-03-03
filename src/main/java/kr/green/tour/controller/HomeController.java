package kr.green.tour.controller;

import javax.servlet.http.HttpSession;

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
		  
		  @ResponseBody
		  @RequestMapping(value="emailCheck")
		  public String emailCheck(String email) {
				return memberService.emailCheck(email);
			}
		  
		  @RequestMapping(value = "/login", method = RequestMethod.GET)
			public ModelAndView loginGet(ModelAndView mv) {
				mv.setViewName("/member/login");
				return mv;
			}
		  
		  @RequestMapping(value = "/login", method = RequestMethod.POST)
			public ModelAndView loginPost(ModelAndView mv, MemberVO user) {
		  	
				MemberVO loginUser = memberService.login(user);
				mv.addObject("user",loginUser);
				if(loginUser == null) 
					mv.setViewName("redirect:/login");
				else {
					loginUser.setAuto_login(user.getAuto_login());
					mv.setViewName("redirect:/");
				} 
				return mv;
			}
  
		  @RequestMapping(value = "/logout")
		  public ModelAndView logout(ModelAndView mv, HttpSession session) {
		  	
				session.removeAttribute("user");
				mv.setViewName("redirect:/");
				return mv;
		  	
		  }
  
}
