package com.information.dao;

import java.util.List;
import java.util.Map;

import com.information.vo.Place_InfoVo;

public interface Place_InfoDao {
	// place_type별 정보 리스트 보기
	List<Place_InfoVo> listPlace_InfoPage(Map map);
	
	// 정보 상세 보기
	Place_InfoVo detailPlace_Info(int place_no);
	
	// 총 페이지를 구함
	int getTotalRecord(Map map);
	
	// 조회수 증가
	void updateHit(int place_no);
}
