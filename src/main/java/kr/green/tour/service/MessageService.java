package kr.green.tour.service;

import java.util.List;

import kr.green.tour.vo.MemberVO;
import kr.green.tour.vo.MessageVO;

public interface MessageService {

	void writeMessage(MessageVO message);

	List<MessageVO> getMessage(MessageVO message, MemberVO user);

	List<MessageVO> getSendMessage(MessageVO message, MemberVO user);

	MessageVO getMessageNum(Integer message_id);

	void updateRead(MessageVO dbmessage);

	

	

}
