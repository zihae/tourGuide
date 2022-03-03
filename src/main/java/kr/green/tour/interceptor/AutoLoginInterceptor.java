package kr.green.tour.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import kr.green.tour.service.MemberService;
import kr.green.tour.vo.MemberVO;

public class AutoLoginInterceptor extends HandlerInterceptorAdapter{
	
		@Autowired 
		MemberService memberService;
		@Override
		public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
			HttpSession session = request.getSession();
			MemberVO user =(MemberVO)session.getAttribute("user");
			//자동 로그인을 해야하는 경우: 로그인이 안됐을 때
			if(user == null) {
			//request에서 쿠키 정보를 가져옴
			Cookie cookie = WebUtils.getCookie(request, "loginCookie");
			if(cookie != null) {
				//쿠키에 있는 값을 가져옴
				String session_id = cookie.getValue();
				//쿠키에 저장된 세션 아이디와 일치하는 회원 정보를 가져옴
				user = memberService.selectMemberBySessionId(session_id);
				if(user != null) {
					session.setAttribute("user", user);
				}
			}
		}
			return false;
		}
		
}
