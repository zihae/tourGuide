package kr.green.tour.pagination;

import lombok.Data;

@Data
public class PageMaker {
	//총 개시글 갯수 endPage 결정할 때 활용,게시글 번호를 연속되게 출력할 때 활용
	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev; // 이전 버튼 활성화 여부
	private boolean next; // 다음 버튼 활성화 여부
	private int displayPageNum;
	private Criteria criteria; //현재 선택된 페이지 정보
	
	/* endPage, startPage, prev, next 값 계산 */
	public void calcData() {
		/* starPage와 endPage는 현재 페이지 정보인 criteria와 displayPageNum을 이용하여 계산
		 * displayPageNum이 10이고 현재 페이지가 3페이지면 startPage = 1, endPage = 10이 되도록 계산 */
		//endPage:현재 페이지네이션에서 마지막 페이지. 현재 페이지에 따라 달라짐
		//tmpEndPage: 실제 마지막 페이지. 게시글 수가 변하지 않으면 현재 페이지에 상관없이 고정
		endPage = (int) (Math.ceil(criteria.getPage()/(double) displayPageNum)*displayPageNum);
		
		startPage = (endPage - displayPageNum)+1;
		/* 총 콘텐츠 갯수를 이용하여 마지막 페이지 번호를 계산 */
		int tempEndPage = (int)(Math.ceil(totalCount/(double)criteria.getPerPageNum()));
		
		/* 현재 페이지에 계산된 현재 페이지메이커의 마지막 페이지 번호와 실제 마지막 페이지 번호를 비교하여
		 * 작은 값이 마지막 페이지 번호가 됨 */
		if(endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		
		//현재 페이지네이션에 1페이지 있으면 이전 버튼을 비활성화
			prev = startPage ==1 ? false : true;
			next = endPage == tempEndPage ? false : true;
		}
	
		//생성자 추가
		public PageMaker(int totalCount, int displayPageNum, Criteria criteria) {
		this.totalCount = totalCount;
		this.displayPageNum = displayPageNum;
		this.criteria = criteria;
		calcData();
		}
		
	}
	
	

