package com.information.manager;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.information.vo.Member_FavoriteVo;
import com.member.vo.Member_InfoVo;

public class Member_FavoriteManager {
	private static SqlSessionFactory factory;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("com/db/config/sqlMapConfig.xml");
			factory = new SqlSessionFactoryBuilder().build(reader);
			reader.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 마이페이지에 찜 추가
	public static int insertMember_Favorite(Member_FavoriteVo f) {
		int re = -1;
		SqlSession session = factory.openSession();
		re = session.insert("member_favorite.insertFavorite", f);
		session.commit();
		session.close();
		return re;
	}
		
	// 마이페이지 찜한 리스트
	public static List<Member_FavoriteVo> listMember_Favorite(){
		SqlSession session = factory.openSession();
		List<Member_FavoriteVo> list = session.selectList("member_favorite.selectAll");
		session.close();
		return list;
	}
		
	// 마이페이지 찜한 상세정보 (해당 상세정보 페이지로 이동함) 필요 없을듯
	public static Member_FavoriteVo detailMember_Favorite(int favorite_no) {
		SqlSession session = factory.openSession();
		Member_FavoriteVo m = null;
		m = session.selectOne("member_favorite.detail", favorite_no);
		session.close();
		return m;
	}
		
	// 마이페이지 찜 목록에서 찜한 것 삭제
	public static int deleteMember_Favorite(int favorite_no) {
		SqlSession session = factory.openSession();
		int re = -1;
		re = session.delete("member_favorite.delete", favorite_no);
		session.commit();
		session.close();
		return re;
	}
}
