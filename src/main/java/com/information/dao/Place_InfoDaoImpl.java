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
	@Override
	public List<Place_InfoVo> listPlace_InfoPage(Map map) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("place_info.selectPage", map);
	}
	@Override
	public Place_InfoVo detailPlace_Info(int place_no) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("place_info.detail", place_no);
	}
	@Override
	public int getTotalRecord(Map map) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("place_info.totalRecord", map);
	}
}
