package kr.green.tour.service;

import kr.green.tour.vo.MemberVO;

public interface MemberService {

	boolean signup(MemberVO user);

	String idCheck(String user_id);
		
}
