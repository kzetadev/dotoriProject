package com.information.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.information.manager.Member_FavoriteManager;
import com.information.manager.Place_InfoManager;
import com.information.vo.Member_FavoriteVo;

@Repository
public class Member_FavoriteDao {
	public int insertMember_Favorite(Member_FavoriteVo f) {
		return Member_FavoriteManager.insertMember_Favorite(f);
	}
	
	public List<Member_FavoriteVo> listMember_Favorite(){
		return Member_FavoriteManager.listMember_Favorite();
	}
	
	public Member_FavoriteVo detailMember_Favorite(int favorite_no) {
		return Member_FavoriteManager.detailMember_Favorite(favorite_no);
	}
	
	public int deleteMember_Favorite(int favorite_no) {
		return Member_FavoriteManager.deleteMember_Favorite(favorite_no);
	}
}
