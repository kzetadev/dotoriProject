package com.example.demo.db;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.example.demo.vo.Board_PostVo;
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
	public static List<Place_InfoVo> listPlace_Info(){
		SqlSession session = factory.openSession();
		List<Place_InfoVo> list = session.selectList("place_info.selectAll");
		session.close();
		return list;
	}
	
	//게시판 리스트
	public static List<Board_PostVo> listBoard_Post(){
		SqlSession session = factory.openSession();
		List<Board_PostVo> list = session.selectList("board_post.selectAll");
		session.close();		
		return list;
	}
}
