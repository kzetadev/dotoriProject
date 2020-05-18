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
	
	// 마이페이지에 담기
	@Override
	public int insertMember_Favorite(Member_FavoriteVo f) {
		return member_favoriteDao.insertMember_Favorite(f);
	}

	// 마이페이지 찜 리스트를 보여줌
	@Override
	public List<Member_FavoriteVo> listMember_Favorite() {
		return member_favoriteDao.listMember_Favorite();
	}

	// 마이페이지 찜 리스트중에서 삭제하고 싶은 것 선택
	@Override
	public int deleteMember_Favorite(int favorite_no) {
		return member_favoriteDao.deleteMember_Favorite(favorite_no);
	}

}
