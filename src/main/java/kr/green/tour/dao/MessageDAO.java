package kr.green.tour.dao;

import org.apache.ibatis.annotations.Param;

import kr.green.tour.vo.MessageVO;

public interface MessageDAO {

	void writeMessage(@Param("message")MessageVO message);

}
