package kr.green.tour.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.tour.dao.MessageDAO;
import kr.green.tour.vo.MemberVO;
import kr.green.tour.vo.MessageVO;

@Service
public class MessageServiceImp implements MessageService{
		@Autowired 
		MessageDAO messageDao;

		@Override
		public void writeMessage(MessageVO message) {
			if(message == null
					|| message.getTitle() == null
					|| message.getContent() == null
					|| message.getReceiver_id() == null)
					return;
			
			messageDao.writeMessage(message);
			
		}

		
		@Override
		public List<MessageVO> getMessage(MessageVO message, MemberVO user) {
			if(!message.getReceiver_id().equals(user.getUser_id()))
				return null;
			return messageDao.getMessage(message, user);
		}


		@Override
		public List<MessageVO> getSendMessage(MessageVO message, MemberVO user) {
			if(!message.getSender_id().equals(user.getUser_id()))
				return null;
			return messageDao.getSendMessage(message, user);
		}

		
		@Override
		public MessageVO getMessageNum(Integer message_id) {
			if(message_id == null || message_id <= 0)
				return null;
			return messageDao.getMessageNum(message_id);
			
		}
		
		@Override
		public void updateRead( MessageVO dbmessage) {
			messageDao.updateRead(dbmessage);
			
		}
			
	} 

