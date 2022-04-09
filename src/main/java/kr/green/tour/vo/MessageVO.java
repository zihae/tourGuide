package kr.green.tour.vo;

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
}
