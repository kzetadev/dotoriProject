package com.example.demo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.Member_FavoriteVo;

@Repository
public class Member_FavoriteDao {
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
