package com.information.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.information.mapper.DBManager;
import com.information.vo.Place_ThemeVo;

@Repository
public class Place_ThemeDao {
	public List<Place_ThemeVo> listPlace_Theme(){
		return DBManager.listPlace_Theme();
	}
	public Place_ThemeVo getPlace_Theme(int place_type) {
		return DBManager.getPlace_Theme(place_type);
	}
}
