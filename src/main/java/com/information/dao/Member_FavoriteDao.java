package com.information.dao;

import java.util.List;

import com.information.vo.Member_FavoriteVo;

public interface Member_FavoriteDao {
	int insertMember_Favorite(Member_FavoriteVo f) ;
	List<Member_FavoriteVo> listMember_Favorite();
	Member_FavoriteVo detailMember_Favorite(int favorite_no);
	int deleteMember_Favorite(int favorite_no);
}
