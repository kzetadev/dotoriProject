package com.information.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.information.mapper.Place_InfoManager;
import com.information.vo.Member_FavoriteVo;

@Repository
public class Member_FavoriteDao {
	public int insertMember_Favorite(Member_FavoriteVo m) {
		return Place_InfoManager.insertMember_Favorite(m);
	}
	
	public List<Member_FavoriteVo> listMember_Favorite(){
		return Place_InfoManager.listMember_Favorite();
	}
	
	public Member_FavoriteVo detailMember_Favorite(int favorite_no) {
		return Place_InfoManager.detailMember_Favorite(favorite_no);
	}
	
	public int deleteMember_Favorite(int favorite_no) {
		return Place_InfoManager.deleteMember_Favorite(favorite_no);
	}
}
