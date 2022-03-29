package kr.green.tour.controller;
import java.net.URLEncoder;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import kr.green.tour.service.PlaceService;
import kr.green.tour.vo.PlaceVO;

@Controller
public class TestControlloer {
	@Autowired
	PlaceService placeService;
public ModelAndView sampleTest3(ModelAndView mv) {

		return mv;
	}
	@RequestMapping("/place/public")
	public ModelAndView sampleTest4(ModelAndView mv) throws Exception {
		
		for(int i = 1; i<= 1000; i++) {
			if(place(i) == 0)
				break;
		}

		mv.setViewName("/place/public");

		return mv;
	}
	private int place(int page) throws Exception {
		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/6460000/jnLodgeist/getNdLodgeView"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=EODB6lSechoAnAMvpQKYezu%2FdtmCs16raW%2FRkvk7q84z%2BZUybJRwBKlJAS%2Bumw%2FEWBBwsgxuaA%2F%2FsptCm7pw6g%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("lodgeId","UTF-8") + "=" + URLEncoder.encode("3281", "UTF-8")); /*고유코드(숙박 목록의 고유코드)*/
        urlBuilder.append("&" + URLEncoder.encode("pageSize","UTF-8") + "=" + URLEncoder.encode("500", "UTF-8")); /*페이지 크기(기본10)*/
        urlBuilder.append("&" + URLEncoder.encode("startPage","UTF-8") + "=" + URLEncoder.encode(""+page, "UTF-8")); /*시작 페이지(기본0)*/


	    DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
		DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
		Document doc = dBuilder.parse(urlBuilder.toString());
	
		// root tag 
		doc.getDocumentElement().normalize();
		System.out.println("Root element :" + doc.getDocumentElement().getNodeName());
		// 파싱할 tag
		NodeList nList = doc.getElementsByTagName("list");
		//System.out.println("파싱할 리스트 수 : "+ nList.getLength());
		if(nList.getLength() == 0)
			return 0;
		for(int temp = 0; temp < nList.getLength(); temp++){
			Node nNode = nList.item(temp);
			if(nNode.getNodeType() == Node.ELEMENT_NODE){
	
				Element eElement = (Element) nNode;
				System.out.println("######################");
				//System.out.println(eElement.getTextContent());
				System.out.println("업소명 : " + getTagValue("lodgeNm", eElement));
				System.out.println("주소 : " + getTagValue("lodgeAddr", eElement));
				System.out.println("고유코드: " + getTagValue("lodgeId", eElement));
				
				System.out.println("시설소개: " + getTagValue("lodgeSummaryInfo", eElement));
			
	
				//lodgeMainImg 이미지: getTagValue("lodgeMainImg", eElement));
				//lodgeNm 업소명 : getTagValue("lodgeNm", eElement));
				//lodgeTel 전화번호: getTagValue("lodgeTel", eElement));
				
				PlaceVO place = new PlaceVO();
				
				//지역
				place.setArea(getTagValue("lodgeZoneNm", eElement));
				
				//주차
				place.setParking(getTagValue("lodgeParkingYn", eElement));
				//체크인
				place.setCheckIn(getTagValue("lodgeInTime", eElement));
				//체크아웃
				place.setCheckOut(getTagValue("lodgeOutTime", eElement));
				
				//간략소개 lodgeSummaryInfo
				place.setOverview(getTagValue("lodgeSummaryInfo", eElement));
				//고유코드
				place.setLodgeId(getTagValue("lodgeId", eElement));
		
				placeService.updatePlace(place);
				 
				
				
				 
				
			}	// for end
		}	// if end
		return nList.getLength();
	}
	private static String getTagValue(String tag, Element eElement) {
	    NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
	    Node nValue = (Node) nlList.item(0);
	    if(nValue == null) 
	        return null;
	    return nValue.getNodeValue();
	}
	
}