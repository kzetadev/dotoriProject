package com.information.manager;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.information.vo.Place_ThemeVo;

public class Place_ThemeManager {
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
	
	//여행장소 테마 정보 조회. 정보게시판에서 각 테마별 링크에 사용.
	//0 : 명소		1 : 음식		2 : 호텔		3 : 축제와 행사	...
	public static List<Place_ThemeVo> listPlace_Theme(){
		SqlSession session = factory.openSession();
		List<Place_ThemeVo> list = session.selectList("place_theme.selectAll");
		session.close();
		return list;
	}
	public static Place_ThemeVo getPlace_Theme(int place_type){
		SqlSession session = factory.openSession();
		Place_ThemeVo pt = session.selectOne("place_theme.getPlaceTheme", place_type);
		session.close();
		return pt;
	}
}
