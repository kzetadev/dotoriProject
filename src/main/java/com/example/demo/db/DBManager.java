package com.example.demo.db;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.example.demo.vo.Member_FavoriteVo;
import com.example.demo.vo.Place_InfoVo;

public class DBManager {
	private static SqlSessionFactory factory;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("com/example/demo/db/sqlMapConfig.xml");
			factory = new SqlSessionFactoryBuilder().build(reader);
			reader.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	// 정보게시판 여행 정보 리스트
	public static List<Place_InfoVo> listPlace_Info(){
		SqlSession session = factory.openSession();
		List<Place_InfoVo> list = session.selectList("place_info.selectAll");
		session.close();
		return list;
	}
	
	// 정보게시판 여행 정보 페이징 처리
	public static List<Place_InfoVo> listPlace_InfoPage(HashMap<String, Integer> map){
		SqlSession session = factory.openSession();
		List<Place_InfoVo> list = session.selectList("place_info.selectPage", map);
		session.close();
		return list;
	}
	
	// 정보게시판 여행 상세 보기
	public static Place_InfoVo detailPlace_Info(int place_no) {
		SqlSession session = factory.openSession();
		Place_InfoVo m = null;
		m = session.selectOne("place_info.detail", place_no);
		session.close();
		return m;
	}
	
	// 정보게시판 총 몇페이지까지 있는지 확인 (페이징 처리 관련)
	public static int totalRecord(int place_type) {
		int cnt = 0;
		SqlSession session = factory.openSession();
		cnt = session.selectOne("place_info.totalRecord", place_type);
		session.close();
		return cnt;
	}
	
	
	// 마이페이지 찜한 리스트
	public static List<Member_FavoriteVo> listMember_Favorite(){
		SqlSession session = factory.openSession();
		List<Member_FavoriteVo> list = session.selectList("member_favorite.selectAll");
		session.close();
		return list;
	}
	
	// 마이페이지 찜한 상세정보 (해당 상세정보 페이지로 이동함)
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
