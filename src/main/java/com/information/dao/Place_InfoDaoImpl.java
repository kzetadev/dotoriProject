package com.information.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.information.vo.Place_InfoVo;

@Repository("place_infoDao")
public class Place_InfoDaoImpl implements Place_InfoDao {
	@Inject
	protected SqlSessionTemplate sqlSessionTemplate;
	
	// place_type별 정보 리스트 보기
	@Override
	public List<Place_InfoVo> listPlace_InfoPage(Map map) {
		return sqlSessionTemplate.selectList("place_info.selectPage", map);
	}
	
	// 정보 상세 보기
	@Override
	public Place_InfoVo detailPlace_Info(int place_no) {
		return sqlSessionTemplate.selectOne("place_info.detail", place_no);
	}
	
	// 총 페이지를 구함
	@Override
	public int getTotalRecord(Map map) {
		return sqlSessionTemplate.selectOne("place_info.totalRecord", map);
	}

	// 조회수 증가
	@Override
	public void updateHit(int place_no) {
		sqlSessionTemplate.update("place_info.updateHit", place_no);
	}
}
