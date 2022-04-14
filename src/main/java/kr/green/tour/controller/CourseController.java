package kr.green.tour.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.green.tour.pagination.Criteria;
import kr.green.tour.service.CourseService;
import kr.green.tour.service.PlaceService;
import kr.green.tour.vo.CityVO;
import kr.green.tour.vo.CourseDetailVO;
import kr.green.tour.vo.CourseVO;
import kr.green.tour.vo.MemberVO;
import kr.green.tour.vo.PlaceVO;

@Controller
public class CourseController {

		@Autowired
		CourseService courseService;
		PlaceService placeService;
		
		//나만의 여행지도 리스트
		@RequestMapping(value="/course/list", method=RequestMethod.GET)
		public ModelAndView courseList(ModelAndView mv, Criteria cri) {
			
			mv.setViewName("/course/list");
			return mv;
		}
		
		//여행지도 등록
		@RequestMapping(value="/course/register", method=RequestMethod.GET)
		public ModelAndView courseRegisterGet(ModelAndView mv, CourseVO course, Criteria cri) {
			mv.addObject("course", course);
			//지도 불러오기
			cri.setPerPageNum(1000);
			List<PlaceVO> list = courseService.getMapList(cri); 
			//컨트롤러가 가져온 게시글을 화면에 전달
			mv.addObject("list", list);
			mv.setViewName("/course/register");
			return mv;
		}
		
		//여행지역 설정
		@ResponseBody
		@RequestMapping(value = "/city")
		public Map<String,Object> city() {
			HashMap<String, Object> map = new HashMap<String,Object>();
			List<CityVO> list = courseService.selectCity();
			
			map.put("list", list);
			return map;
		}
		
		//여행지역 설정
		@ResponseBody
		@RequestMapping(value = "/course/maker")
		public List<PlaceVO> courseMaker(Integer city_id, Integer main_id) {
			List<PlaceVO> list = courseService.selectPlaceList(city_id, main_id);
			return list;
		}
		
		//여행지역 설정
		@ResponseBody
		@RequestMapping(value = "/course/insert")
		public int courseInsert(@RequestBody CourseVO course, HttpServletRequest r) {
			System.out.println(course);
			MemberVO member = (MemberVO)r.getSession().getAttribute("user");
			
			return courseService.insertCourse(course, member);
		}
		
		@ResponseBody
		@RequestMapping(value = "/course/detail/insert")
		public int courseDetailInsert(@RequestBody CourseDetailVO cd) {
			System.out.println(cd);
			return courseService.insertCourseDetail(cd);
		}
		
}
