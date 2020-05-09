package com.information.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.information.mapper.DBManager;
import com.information.vo.Member_FavoriteVo;

@Repository
public class Member_FavoriteDao {
	public int insertMember_Favorite(Member_FavoriteVo m) {
		return DBManager.insertMember_Favorite(m);
	}
	
	public List<Member_FavoriteVo> listMember_Favorite(){
		return DBManager.listMember_Favorite();
	}
	
	public Member_FavoriteVo detailMember_Favorite(int favorite_no) {
		return DBManager.detailMember_Favorite(favorite_no);
	}
	
	public int deleteMember_Favorite(int favorite_no) {
		return DBManager.deleteMember_Favorite(favorite_no);
	}
}
