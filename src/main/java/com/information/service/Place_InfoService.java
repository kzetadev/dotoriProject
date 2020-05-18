package com.information.service;

import java.util.List;
import java.util.Map;

import com.information.vo.Place_InfoVo;

public interface Place_InfoService {
	// place_type별 정보 리스트 보기 + 페이징 처리 + 검색 + 정렬
	List<Place_InfoVo> listPlace_InfoPage(Map map);
	
	// 전체 몇페이지까지 있는지 확인 (페이징 처리 관련)
	int getTotalRecord(Map map);
	
	// 클릭시 조회수 증가
	void updateHit(int place_no);
	
	// 여행장소번호가 x번인걸 눌렀을때 상세화면으로 이동
	Place_InfoVo detailPlace_Info(int place_no);
	
	// 메인 페이지 인기 서울 명소 TOP 6
	List<Place_InfoVo> mainTop();
}
