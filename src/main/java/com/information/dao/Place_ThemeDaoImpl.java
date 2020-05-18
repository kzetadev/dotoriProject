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
	
	// 여행 장소 테마 - 정렬 
	@Override
	public List<Place_ThemeVo> listPlace_Theme() {
		return sessionTemplate.selectList("place_theme.selectAll");
	}
	
	// 여행 장소 테마 - 어느 테마인지 찾기 (명소, 음식점, 숙소)
	@Override
	public Place_ThemeVo getPlace_Theme(int place_type) {
		return sessionTemplate.selectOne("place_theme.getPlaceTheme", place_type);
	}

}
