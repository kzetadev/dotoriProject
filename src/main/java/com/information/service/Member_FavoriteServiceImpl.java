package com.information.service;

import java.util.List;
import java.util.Map;

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

	// 마이페이지 찜 전체 리스트
	@Override
	public List<Member_FavoriteVo> listMember_Favorite(Map map) {
		return member_favoriteDao.listMember_Favorite(map);
	}
	
	// 마이페이지 찜 전체 리스트의 개수
	@Override
	public int listAllCount(int place_type) {
		return member_favoriteDao.listAllCount(place_type);
	}
	
	// 마이페이지 찜 리스트중에서 삭제하고 싶은 것 선택
	@Override
	public int deleteMember_Favorite(int favorite_no) {
		return member_favoriteDao.deleteMember_Favorite(favorite_no);
	}

	// 상세화면에서 찜 제거
	@Override
	public int deleteDetailPlace_Info(Map map) {
		return member_favoriteDao.deleteDetailPlace_Info(map);
	}

	// 찜 개수는 1개만 들어와야함
	@Override
	public int onlyOne(Map map) {
		return member_favoriteDao.onlyOne(map);
	}

}
