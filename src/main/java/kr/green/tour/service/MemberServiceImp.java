package kr.green.tour.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.green.tour.dao.MemberDAO;
import kr.green.tour.vo.MemberVO;

@Service
public class MemberServiceImp implements MemberService{
		@Autowired
		MemberDAO memberDao;
		@Autowired
		BCryptPasswordEncoder passwordEncoder;
	
		@Override
		public boolean signup(MemberVO user) {
			if(user == null)
				return false;
			if(user.getUser_id() == null || user.getUser_id().trim().length() == 0)
				return false;
			if(user.getPassword()== null || user.getPassword().trim().length() == 0)
				return false;
			if(user.getNickname()== null || user.getNickname().trim().length() == 0)
				return false;
			if(user.getGender()== null || user.getGender().trim().length() == 0)
				return false;
			if(user.getBirth_str()== null || user.getBirth_str().trim().length() == 0)
				return false;
			String encPw = passwordEncoder.encode(user.getPassword());
			user.setPassword(encPw);
			memberDao.insertMember(user);
			return true;
		}


}

