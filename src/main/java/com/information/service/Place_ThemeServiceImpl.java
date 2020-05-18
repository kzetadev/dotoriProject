package com.information.service;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.information.dao.Place_ThemeDao;
import com.information.vo.Place_ThemeVo;
@Service("place_themeService")
public class Place_ThemeServiceImpl implements Place_ThemeService {
	@Resource(name="place_themeDao")
	protected Place_ThemeDao place_themeDao;
	
	// 여행 장소 테마 - 정렬 
	@Override
	public List<Place_ThemeVo> listPlace_Theme() {
		return place_themeDao.listPlace_Theme();
	}

	// 여행 장소 테마 - 어느 테마인지 찾기 (명소, 음식점, 숙소)
	@Override
	public Place_ThemeVo getPlace_Theme(int place_type) {
		return place_themeDao.getPlace_Theme(place_type);
	}

}
