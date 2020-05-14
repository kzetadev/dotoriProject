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
	@Override
	public List<Place_ThemeVo> listPlace_Theme() {
		// TODO Auto-generated method stub
		return place_themeDao.listPlace_Theme();
	}

	@Override
	public Place_ThemeVo getPlace_Theme(int place_type) {
		// TODO Auto-generated method stub
		return place_themeDao.getPlace_Theme(place_type);
	}

}
