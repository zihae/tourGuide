package kr.green.tour.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.tour.dao.MessageDAO;

@Service
public class MessageServiceImp implements MessageService{
		@Autowired 
		MessageDAO messageDao; 
}
