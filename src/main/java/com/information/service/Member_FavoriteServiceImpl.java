package com.information.service;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.information.dao.Member_FavoriteDao;
import com.information.vo.Member_FavoriteVo;
@Service("member_favoriteService")
public class Member_FavoriteServiceImpl implements Member_FavoriteService {
	@Inject
	@Resource(name="member_favoriteDao")
	protected Member_FavoriteDao member_favoriteDao;
	@Override
	public int insertMember_Favorite(Member_FavoriteVo f) {
		// TODO Auto-generated method stub
		return member_favoriteDao.insertMember_Favorite(f);
	}

	@Override
	public List<Member_FavoriteVo> listMember_Favorite() {
		// TODO Auto-generated method stub
		return member_favoriteDao.listMember_Favorite();
	}

	@Override
	public Member_FavoriteVo detailMember_Favorite(int favorite_no) {
		// TODO Auto-generated method stub
		return member_favoriteDao.detailMember_Favorite(favorite_no);
	}

	@Override
	public int deleteMember_Favorite(int favorite_no) {
		// TODO Auto-generated method stub
		return member_favoriteDao.deleteMember_Favorite(favorite_no);
	}

}
