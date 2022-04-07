package kr.green.tour.vo;

import lombok.Data;

@Data
public class PlaceVO {
		private int place_id;
		private int main_id;
		private String area;
		private String name;
		private String address1;
		private String address2;
		private String parking;
		private String homepage;
		private String tel;
		private String img;
		private String menu;
		private String holiday;
		private String latitude;
		private String longitude;
		private String landmark;

		public String getTypeTitle() {
			if(main_id == 1) {
				return "관광지";
			}else if(main_id == 2) {
				return "음식점";
			}
			return "숙소";
		}

}
