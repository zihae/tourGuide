package kr.green.tour.interceptor;

import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.green.tour.service.MemberService;
import kr.green.tour.vo.MemberVO;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	
		@Autowired 
		MemberService memberService;
		
		@Override
		public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,ModelAndView modelAndView)
		throws Exception{
			//mv.addObject()로 전달한 정보중에 user라는 정보가 있는지 확인해서
			//user 정보를 가져오는 코드
			ModelMap modelMap = modelAndView.getModelMap();
			MemberVO user = (MemberVO)modelMap.get("user");
			
			if(user != null) {
				//세션에 user 정보를 추가
				HttpSession session = request.getSession();
				//자동 로그인이 체크가 되면
				if(user.getAuto_login() != null) {
					//쿠키를 생성하여 현재 세션 id값을 value로 넣어줌
					Cookie cookie = new Cookie("loginCookie", session.getId());
					//생성된 쿠키의 유지시간을 7일로 설정
					int day = 7;
					//일을 초로 계산
					int session_limit_second = 60 * 60 * 24 * day; 
					cookie.setMaxAge(session_limit_second);
					cookie.setPath("/");
					//response에 쿠키를 넣어 보내줌
					response.addCookie(cookie);
					//DB에 세션 아이디와 세션 만료 시간을 전달함, System.currentTimeMillis(): 현재 시간을 밀리세컨드로 환산
					user.setSession_id(session.getId());
					Date session_limit =
							new Date(System.currentTimeMillis() + session_limit_second * 1000);
					user.setSession_limit(session_limit);
					memberService.insertAutoLogin(user);
				}
				session.setAttribute("user", user);
			}
		}
		

}
