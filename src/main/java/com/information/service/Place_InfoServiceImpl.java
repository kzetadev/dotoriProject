package com.information.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.information.dao.Place_InfoDao;
import com.information.vo.Place_InfoVo;

@Service("place_infoService")
public class Place_InfoServiceImpl implements Place_InfoService {
	@Inject
	@Resource(name="place_infoDao")
	protected Place_InfoDao place_infoDao;
	
	@Override
	public List<Place_InfoVo> listPlace_InfoPage(Map map) {
		List<Place_InfoVo> list = place_infoDao.listPlace_InfoPage(map);
		return list;
	}
	
	@Override
	public Place_InfoVo detailPlace_Info(int place_no) {
		return place_infoDao.detailPlace_Info(place_no);
	}
	
	@Override
	public int getTotalRecord(Map map) {
		return place_infoDao.getTotalRecord(map);
	}

	@Override
	public void updateHit(int place_no) {
		place_infoDao.updateHit(place_no);
	}
}
