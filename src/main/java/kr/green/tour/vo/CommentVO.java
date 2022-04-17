package kr.green.tour.vo;

import java.util.Date;

import lombok.Data;

@Data
public class CommentVO {
	private int co_num;
	private String co_me_id;
	private int co_bd_num;
	private Date co_reg_date;
	private String co_del;
	private String co_contents;
	private int co_ori_num;
}
