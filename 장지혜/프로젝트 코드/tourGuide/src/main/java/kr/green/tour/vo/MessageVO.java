package kr.green.tour.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class MessageVO {

	private int message_id;
	private String receiver_id;
	private String sender_id;
	private String title;
	private String content;
	private int read_check;
	private Date send_date;
	
	public String getSend_date_str() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String str =format.format(send_date);
		return str;
	}
	
	public String getRead() {
		if(read_check == 0) {
			return "읽지 않음";
		}else  { 
			return "읽음";
		}		
	}
}