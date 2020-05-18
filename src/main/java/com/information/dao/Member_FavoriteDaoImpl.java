package com.information.dao;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.information.vo.Member_FavoriteVo;
@Repository("member_favoriteDao")
public class Member_FavoriteDaoImpl implements Member_FavoriteDao {
	@Inject
	protected SqlSessionTemplate sqlSessionTemplate;
	
	// 마이페이지에 담기
	@Override
	public int insertMember_Favorite(Member_FavoriteVo f) {
		return sqlSessionTemplate.insert("member_favorite.insertFavorite", f);
	}

	// 마이페이지 찜 리스트를 보여줌
	@Override
	public List<Member_FavoriteVo> listMember_Favorite() {
		return sqlSessionTemplate.selectList("member_favorite.selectAll");
	}

	// 마이페이지 찜 리스트중에서 삭제하고 싶은 것 선택
	@Override
	public int deleteMember_Favorite(int favorite_no) {
		return sqlSessionTemplate.delete("member_favorite.delete", favorite_no);
	}

}
