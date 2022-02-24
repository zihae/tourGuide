package kr.green.tour.dao;

import org.apache.ibatis.annotations.Param;

import kr.green.tour.vo.MemberVO;

public interface MemberDAO {

	void insertMember(@Param("user")MemberVO user);

	MemberVO selectMember(@Param("user_id")String user_id);
	
}
