package kr.green.tour.controller;

import java.util.Date;

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
				if(loginUser == null) 
					mv.setViewName("redirect:/login");
				else {
					//loginUser는 DB에서 아이디, 비번과 일치하는 회원 정보를 가져온것이기 때문에
					//로그인 화면에서 선택한 자동 로그인 체크 유무를 알 수 없다
					//화면에서 전달한 user에 있는 자동 로그인 체크 유무를 loginUser에 설정
					loginUser.setAuto_login(user.getAuto_login());
					mv.addObject("user",loginUser);
					mv.setViewName("redirect:/");
				} 
				return mv;
			}
  
		  @RequestMapping(value = "/logout")
		  public ModelAndView logout(ModelAndView mv, HttpSession session) {
		  	MemberVO user = (MemberVO)session.getAttribute("user");
				//session에 있는 user 정보 삭제
		  	session.removeAttribute("user");
				//session_limit에 로그아웃 시간을 저장
		  	//session_id에 none 저장
				user.setSession_limit(new Date());
				user.setSession_id("none");
				memberService.insertAutoLogin(user);
				mv.setViewName("redirect:/");
				return mv;
		  	
		  }
  
}
