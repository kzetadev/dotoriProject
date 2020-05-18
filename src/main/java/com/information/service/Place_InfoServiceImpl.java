package com.information.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.information.dao.Place_InfoDao;
import com.information.vo.Place_InfoVo;

@Service("place_infoService")
public class Place_InfoServiceImpl implements Place_InfoService {
	@Inject
	@Resource(name="place_infoDao")
	protected Place_InfoDao place_infoDao;
	
	// place_type별 정보 리스트 보기 + 페이징 처리 + 검색 + 정렬
	@Override
	public List<Place_InfoVo> listPlace_InfoPage(Map map) {
		List<Place_InfoVo> list = place_infoDao.listPlace_InfoPage(map);
		return list;
	}
	
	// 전체 몇페이지까지 있는지 확인 (페이징 처리 관련)
	@Override
	public int getTotalRecord(Map map) {
		return place_infoDao.getTotalRecord(map);
	}

	// 클릭시 조회수 증가
	@Override
	public void updateHit(int place_no) {
		place_infoDao.updateHit(place_no);
	}
	
	// 여행장소번호가 x번인걸 눌렀을때 상세화면으로 이동
	@Override
	public Place_InfoVo detailPlace_Info(int place_no) {
		return place_infoDao.detailPlace_Info(place_no);
	}

	// 메인 페이지 인기 서울 명소 TOP 6
	@Override
	public List<Place_InfoVo> mainTop() {
		return place_infoDao.mainTop();
	}
	
}
