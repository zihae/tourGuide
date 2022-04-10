package kr.green.tour.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.green.tour.vo.MemberVO;
import kr.green.tour.vo.MessageVO;

public interface MessageDAO {

	void writeMessage(@Param("message")MessageVO message);

	List<MessageVO> getMessage(@Param("message") MessageVO message, @Param("member")MemberVO user);

}
