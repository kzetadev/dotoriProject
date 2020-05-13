package com.information.service;

import java.util.List;

import com.information.vo.Place_ThemeVo;

public interface Place_ThemeService {
	List<Place_ThemeVo> listPlace_Theme();
	Place_ThemeVo getPlace_Theme(int place_type);
}
