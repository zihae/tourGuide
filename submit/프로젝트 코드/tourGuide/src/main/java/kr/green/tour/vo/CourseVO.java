package kr.green.tour.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class CourseVO {
	private int course_id;
	private String course_title;
	private Date course_write_date;
	private String duration;
	private String course_writer_id;
	private String option;
	private String course_mate;
	private String recruit;
	private int course_detail_count;
	
	public String getCourse_write_date_str() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String str = format.format(course_write_date);
		return str;
	}
}
