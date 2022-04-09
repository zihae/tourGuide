package kr.green.tour.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.tour.dao.MessageDAO;
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
}
