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
	private String duration;
	private int course_writer_number;
	private String option;
	private String course_mate;
	
	public String getCourse_wite_date_str() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String str = format.format(course_write_date);
		return str;
	}
}
