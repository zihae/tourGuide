package kr.green.tour.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class MemberVO {
	private int id;
	private String user_id;
	private String password;
	private String nickname;
	private String email;
	private String gender;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birth;
	private String member_delete;
	private Date member_delete_date;
	private String introduction;
	private Date update_date;
	private String sns_type;
	private String sns_id;
	private Date sns_connect_date;
	private Boolean auto_login;
	private String session_id;
	private Date session_limit;

	public String getBirth_str() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String str = format.format(birth);
		return str;
	}
}
