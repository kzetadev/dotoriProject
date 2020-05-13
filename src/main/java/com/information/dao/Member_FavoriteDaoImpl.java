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
	@Override
	public int insertMember_Favorite(Member_FavoriteVo f) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("member_favorite.insertFavorite", f);
	}

	@Override
	public List<Member_FavoriteVo> listMember_Favorite() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("member_favorite.selectAll");
	}

	@Override
	public Member_FavoriteVo detailMember_Favorite(int favorite_no) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("member_favorite.delete", favorite_no);
	}

	@Override
	public int deleteMember_Favorite(int favorite_no) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.delete("member_favorite.delete", favorite_no);
	}

}
