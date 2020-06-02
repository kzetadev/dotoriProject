package com.information.service;

import java.util.List;
import java.util.Map;

import com.information.vo.Member_FavoriteVo;

public interface Member_FavoriteService {
	// 마이페이지에 담기
	int insertMember_Favorite(Member_FavoriteVo f);
	
	// 마이페이지 찜 전체 리스트
	List<Member_FavoriteVo> listMember_Favorite(Map map);
	
	// 마이페이지 찜 전체 리스트의 개수
	int listAllCount(int place_type);
	
	// 마이페이지 찜 리스트중에서 삭제하고 싶은 것 선택
	int deleteMember_Favorite(int favorite_no);
	
	// 상세화면에서 찜 제거
	int deleteDetailPlace_Info(Map map);
	
	// 찜 개수는 1개만 들어와야함
	int onlyOne(Map map);
}
