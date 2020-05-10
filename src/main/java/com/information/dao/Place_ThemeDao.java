package com.information.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.information.manager.Place_InfoManager;
import com.information.manager.Place_ThemeManager;
import com.information.vo.Place_ThemeVo;

@Repository
public class Place_ThemeDao {
	public List<Place_ThemeVo> listPlace_Theme(){
		return Place_ThemeManager.listPlace_Theme();
	}
	public Place_ThemeVo getPlace_Theme(int place_type) {
		return Place_ThemeManager.getPlace_Theme(place_type);
	}
}
