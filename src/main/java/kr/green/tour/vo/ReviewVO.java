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
	private String del;
	private Date del_date;
	private String board_type;
	
	public String getCreate_date_str() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String str =format.format(create_date);
		return str;
		
	}
	
}
