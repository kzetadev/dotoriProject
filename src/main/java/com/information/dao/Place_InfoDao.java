package com.information.dao;

import java.util.List;
import java.util.Map;

import com.information.vo.Place_InfoVo;

public interface Place_InfoDao {
	List<Place_InfoVo> listPlace_InfoPage(Map map);
	Place_InfoVo detailPlace_Info(int place_no);
	int getTotalRecord(Map map);
}
