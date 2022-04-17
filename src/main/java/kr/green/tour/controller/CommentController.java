package kr.green.tour.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.green.tour.pagination.Criteria;
import kr.green.tour.pagination.PageMaker;
import kr.green.tour.service.CommentService;
import kr.green.tour.vo.CommentVO;
import kr.green.tour.vo.MemberVO;

@RestController
public class CommentController {
	
	@Autowired
	CommentService commentService;
	
	@RequestMapping("/comment/insert")
	public boolean commentInsert(@RequestBody CommentVO comment, HttpServletRequest request) {
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		return commentService.insertComment(comment,user);
	}
	
	@RequestMapping("/comment/list")
	public Map<String, Object>commentList(Integer page, Integer review_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		//페이지메이커 만들 때 필요한것 : 총 컨텐츠 갯수(DB에서 가져오는 거)
		//                           페이지네이션에서 보여지는 페이지 숫자 최대 갯수(개발자가 설정)
		//													 현재 페이지정보(현재 페이지, 한 페이지에서 보여지는 컨텐츠의 최대 갯수)
		int totalCount = commentService.selectCommentCount(review_id); // DB에서 가져올 예정
		int displayPageNum = 5;
		Criteria cri = new Criteria(page,5);
		
		List<CommentVO> list = commentService.selectCommentList(review_id,cri);
		PageMaker pm = new PageMaker(totalCount, displayPageNum, cri);
		
		map.put("pm", pm); //map에 담아서 화면에 보내줌
		map.put("list", list);
		return map;
	}
	
	@RequestMapping("/comment/delete")
	public boolean commentDelete( Integer co_num, HttpServletRequest request) {
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		return commentService.deleteComment(co_num,user);
	}
	@RequestMapping("/comment/modify")
	public boolean commentModify(@RequestBody CommentVO comment, HttpServletRequest request) {
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		return commentService.modifyComment(comment,user);
	}
}
