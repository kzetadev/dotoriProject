package com.information.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.information.manager.Place_InfoManager;
import com.information.vo.Place_InfoVo;

@Repository
public class Place_InfoDao {
	public List<Place_InfoVo> listPlace_InfoPage(HashMap map){
		return Place_InfoManager.listPlace_InfoPage(map);
	}
	
	public Place_InfoVo detailPlace_Info(int place_no) {
		return Place_InfoManager.detailPlace_Info(place_no);
	}
	
}
