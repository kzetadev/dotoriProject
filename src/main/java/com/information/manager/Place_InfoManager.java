package com.information.manager;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.information.vo.Member_FavoriteVo;
import com.information.vo.Place_InfoVo;
import com.information.vo.Place_ThemeVo;

public class Place_InfoManager {
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
	
	// 정보게시판 여행 정보 페이징 처리 + 검색
	public static List<Place_InfoVo> listPlace_InfoPage(HashMap map){
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
	public static int totalRecord(HashMap map) {
		int cnt = 0;
		SqlSession session = factory.openSession();
		cnt = session.selectOne("place_info.totalRecord", map);
		session.close();
		return cnt;
	}
}
