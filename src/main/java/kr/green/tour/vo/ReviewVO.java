package kr.green.tour.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class ReviewVO {
	private int review_id;
	private String title;
	private String review_member_id;
	private String contents;
	private Date create_date;
	private Date update;
	private int view;
	private String delete;
	private Date delete_date;
	
	public String getCreate_date_str() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String str =format.format(create_date);
		return str;
		
	}
	
}
