package kr.green.tour.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.green.tour.vo.MemberVO;
import kr.green.tour.vo.MessageVO;

public interface MessageDAO {

	void writeMessage(@Param("message")MessageVO message);

	List<MessageVO> getMessage(@Param("message") MessageVO message, @Param("member")MemberVO user);

	List<MessageVO> getSendMessage(@Param("message") MessageVO message, @Param("member")MemberVO user);

	MessageVO getMessageNum(@Param("message_id") Integer message_id);

	void updateRead(@Param("message") MessageVO dbmessage );

	void deleteReceive(@Param("message_id") Integer message_id);



}
