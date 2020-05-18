package com.information.service;

import java.util.List;

import com.information.vo.Member_FavoriteVo;

public interface Member_FavoriteService {
	// 마이페이지에 담기
	int insertMember_Favorite(Member_FavoriteVo f);
	
	// 마이페이지 찜 리스트를 보여줌
	List<Member_FavoriteVo> listMember_Favorite();
	
	// 마이페이지 찜 리스트중에서 삭제하고 싶은 것 선택
	int deleteMember_Favorite(int favorite_no);
}
