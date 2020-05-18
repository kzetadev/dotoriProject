package com.information.service;

import java.util.List;

import com.information.vo.Place_ThemeVo;

public interface Place_ThemeService {
	// 여행 장소 테마 - 정렬 
	List<Place_ThemeVo> listPlace_Theme();
	
	// 여행 장소 테마 - 어느 테마인지 찾기 (명소, 음식점, 숙소)
	Place_ThemeVo getPlace_Theme(int place_type);
}
