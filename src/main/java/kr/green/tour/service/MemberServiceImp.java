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

		@Override
		public String findId(MemberVO member) {
			if(member == null) 
				return "";
			return memberDao.findId(member);
		}

		@Override
		public String findPw(MemberVO member) {
			if(member == null)
				return "fail";
			//id??? ?????? ?????? ?????? ????????? 
			MemberVO user = memberDao.selectMember(member.getUser_id());
			//????????? ??????????????? ???????????? ????????? ????????? ????????? ??????
			if( user == null || !user.getEmail().equals(member.getEmail()))
				return "fail";
			
			//??? ?????? ??????
			String newPw = createRandomPw(6);
			//??? ?????? ?????????
			String encPw = passwordEncoder.encode(newPw);
			//??? ?????? DB??? ?????? -> ???????????? ?????? ?????? ?????? ??? ??????
			user.setPassword(encPw);
			
			return "ok";
			
		}

		private String createRandomPw(int maxSize) {
			String newPw = "";
			if(maxSize <= 0)
				return "";
			for(int i = 1; i <= maxSize; i++) {
				//62 = 26(???????????????) + 26(???????????????) + 10(?????? 0~9)
				int r = (int)(Math.random()*62);
				if(r < 10) {
					newPw += (char)('0' + r);
				}else if(r < 36) {
					newPw += (char)('a' + r - 10);
				}else {
					newPw += (char)('A' + r - 36);
				}
			}
			return newPw;
		}

		


}

