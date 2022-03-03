package kr.green.tour.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class GuestInterceptor extends HandlerInterceptorAdapter {
		@Override
		public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handelr)
		throws Exception {
			//세션에 있는 회원정보를 가져옴
			Object user = request.getSession().getAttribute("user");
			if(user != null) {
				response.sendRedirect(request.getContextPath()+"/");
				return false;
			}
			return true;
		}
}
