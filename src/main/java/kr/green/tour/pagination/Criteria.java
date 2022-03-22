package kr.green.tour.pagination;

import lombok.Data;

@Data
public class Criteria {
	//현재 페이지
	private int page;
	//한 페이지 당 컨텐츠 갯수
	private int perPageNum;
	//검색어
	private String search;
	//Place 종류(숙소,관광지,음식점)
	private int main_id;
	
	//Criteria 디폴트 생성자
	public Criteria() {
		this.page = 1;
		this.perPageNum = 12;
		this.search = "";
		this.main_id = 1;
	}
	
	public Criteria(int page,int perPageNum) {
		this.page = page;
		this.perPageNum = perPageNum;
		this.search="";
		this.main_id = 1;
		
	}
	
	//쿼리문에서 limit에 사용되는 인덱스를 계산하는 getter 
	public int getPageStart() {
		return (this.page -1) * perPageNum;
	}
	public String getTypeTitle() {
		if(main_id == 1) {
			return "관광지";
		}else if(main_id == 2) {
			return "음식점";
		}
		return "숙소";
	}
	
}
