package com.information.service;

import java.util.List;
import java.util.Map;

import com.information.vo.Place_InfoVo;

public interface Place_InfoService {
	List<Place_InfoVo> listPlace_InfoPage(Map map);
	Place_InfoVo detailPlace_Info(int place_no);
	int getTotalRecord(Map map);
}
