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
		private String bus;
		private String localPub;
		private String train;
		private int checkIn;
		private int checkOut;
		private String menu;
		private String holiday;
		private double latitude;
		private double longitude;
		private String landmark;
}
