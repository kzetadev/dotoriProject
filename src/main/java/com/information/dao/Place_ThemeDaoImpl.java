package com.information.dao;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.information.vo.Place_ThemeVo;
@Repository("place_themeDao")
public class Place_ThemeDaoImpl implements Place_ThemeDao {
	@Inject
	SqlSessionTemplate sessionTemplate;
	@Override
	public List<Place_ThemeVo> listPlace_Theme() {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("place_theme.selectAll");
	}

	@Override
	public Place_ThemeVo getPlace_Theme(int place_type) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("place_theme.getPlaceTheme", place_type);
	}

}
