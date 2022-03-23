package kr.green.tour.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class CourseVO {
	private int course_id;
	private String course_title;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date course_write_date;
	private Date departure_date;
	private Date arrive_date;
	private int course_writer_number;
	private String option;
	
	public String getCourse_wite_date_str() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String str = format.format(course_write_date);
		return str;
	}
}
