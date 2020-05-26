package com.information.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.information.vo.Place_InfoVo;
import com.information.vo.SearchConditionVo;

@Repository("place_infoDao")
public class Place_InfoDaoImpl implements Place_InfoDao {
	@Inject
	protected SqlSessionTemplate sqlSessionTemplate;
	
	// place_type별 정보 리스트 보기 + 페이징 처리 + 검색 + 정렬
	@Override
	public List<Place_InfoVo> listPlace_InfoPage(Map map) {
		return sqlSessionTemplate.selectList("place_info.selectPage", map);
	}
	
	// 전체 몇페이지까지 있는지 확인 (페이징 처리 관련)
	@Override
	public int getTotalRecord(Map map) {
		return sqlSessionTemplate.selectOne("place_info.totalRecord", map);
	}

	// 클릭시 조회수 증가
	@Override
	public void updateHit(int place_no) {
		sqlSessionTemplate.update("place_info.updateHit", place_no);
	}
	
	// 여행장소번호가 x번인걸 눌렀을때 상세화면으로 이동
	@Override
	public Place_InfoVo detailPlace_Info(int place_no) {
		return sqlSessionTemplate.selectOne("place_info.detail", place_no);
	}

	// 메인 페이지 인기 서울 명소 TOP 6
	@Override
	public List<Place_InfoVo> mainTop() {
		return sqlSessionTemplate.selectList("place_info.mainTop");
	}
	
	// 검색할 키워드가 포함된 테마의 검색조건(장소명, 주소, 설명) 가져오기
	@Override
	public List<SearchConditionVo> unifiedSearchCondition(Map map) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("unified_search.unifiedSearchCondition", map);
	}
	// 테마, 검색조건(장소명, 주소, 설명)에 해당하는 장소정보 리스트 가져오기
	@Override
	public List<Place_InfoVo> searchPlace(Map map) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("unified_search.searchPlace", map);
	}
	
}
