package kr.green.tour.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.green.tour.pagination.Criteria;
import kr.green.tour.pagination.PageMaker;
import kr.green.tour.service.PlaceService;
import kr.green.tour.vo.LikesVO;
import kr.green.tour.vo.MemberVO;
import kr.green.tour.vo.PlaceVO;

@Controller
public class PlaceContorller {
	
	@Autowired
	PlaceService placeService;
	
	//리스트 출력
	@RequestMapping(value="/place/list", method=RequestMethod.GET)
	public ModelAndView placeList(ModelAndView mv, Criteria cri) {
		List<PlaceVO> list = placeService.getPlaceList(cri); 
		int totalCount = placeService.getTotalCount(cri);
		//테스트 후 2->10으로 수정하기
		PageMaker pm = new PageMaker(totalCount,10,cri);
		//페이지 메이커를 화면에 전달
		mv.addObject("pm", pm);
		//컨트롤러가 가져온 게시글을 화면에 전달
		mv.addObject("list", list);
		mv.setViewName("/place/list");
		return mv;
		
	}
	
	//map 출력
	@RequestMapping(value="/place/map", method=RequestMethod.GET)
	public ModelAndView placeMap(ModelAndView mv, Criteria cri) {
		cri.setPerPageNum(1000);
		List<PlaceVO> list = placeService.getPlaceList(cri); 
		int totalCount = placeService.getTotalCount(cri);
		//테스트 후 2->10으로 수정하기
		PageMaker pm = new PageMaker(totalCount,10,cri);
		//페이지 메이커를 화면에 전달
		mv.addObject("pm", pm);
		//컨트롤러가 가져온 게시글을 화면에 전달
		mv.addObject("list", list);
		
		mv.setViewName("/place/map");
		return mv;
		
	}
	//장소 detail
	@RequestMapping(value="/place/detail")
	  public ModelAndView placeDetail(ModelAndView mv, Integer place_id) {
	      mv.setViewName("/place/detail");
	      PlaceVO place = placeService.getPlaceNum(place_id);
	      mv.addObject("place", place);
	      return mv;
	  }
	  
	//장소 좋아요
	@ResponseBody
	@RequestMapping(value ="/place/likes")
	public String placeLikes(@RequestBody LikesVO likes,
			HttpServletRequest request){
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		//System.out.println(likes);
		//return null;
		return placeService.likes(likes,user);
	}
	
	@ResponseBody
	@RequestMapping(value ="/place/view/likes")
	public String placeViewLikes(@RequestBody LikesVO likes,
			HttpServletRequest request){
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");

	  return placeService.viewLikes(likes, user);
	}
	
}
	
	
	 
