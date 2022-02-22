package kr.green.tour.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.green.tour.service.MemberService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
  @Autowired
  MemberService memberService;
  
  @RequestMapping(value="/")
  public ModelAndView main(ModelAndView mv) throws Exception{
      mv.setViewName("/main/home");
      mv.addObject("setHeader", "타일즈테스트");
      System.out.println(memberService.getEmail("1"));
      return mv;
  }




	
}
