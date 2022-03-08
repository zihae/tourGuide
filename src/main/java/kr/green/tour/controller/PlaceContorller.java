package kr.green.tour.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.green.tour.service.PlaceService;

@Controller
@RequestMapping(value="/place")
public class PlaceContorller {
	
	@Autowired
	PlaceService placeService;
	
	
		
	

}
