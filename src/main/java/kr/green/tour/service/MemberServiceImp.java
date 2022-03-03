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
			String encPw = passwordEncoder.encode(user.getPassword());
			user.setPassword(encPw);
			memberDao.insertMember(user);
			return true;
		}

		@Override
		public String idCheck(String user_id) {
			MemberVO user = memberDao.selectMember(user_id);
			if(user == null)
				return "true";
			else
			return "false";
		}

		@Override
		public String emailCheck(String email) {
			MemberVO user = memberDao.selectEmail(email);
			if(user == null)
				return "true";
			else
			return "false";
		}

		@Override
		public MemberVO login(MemberVO user) {
			if(user == null || user.getUser_id() == null || user.getUser_id().trim().length() == 0)
				return null;
			MemberVO dbUser = memberDao.selectMember(user.getUser_id());
			if(dbUser == null)
				return null;
			if(!passwordEncoder.matches(user.getPassword(), dbUser.getPassword()))
				return null;
			return dbUser;
		}

		@Override
		public void insertAutoLogin(MemberVO user) {
			if(user == null)
				return;
			memberDao.updateSession(user);
			
		}

		@Override
		public MemberVO selectMemberBySessionId(String session_id) {
			return memberDao.selectMemberBySessionId(session_id);
		}

		


}

