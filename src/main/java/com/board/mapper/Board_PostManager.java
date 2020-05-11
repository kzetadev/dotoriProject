package com.board.mapper;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.board.vo.Board_PostViewVo;
import com.board.vo.Board_PostVo;
import com.board.vo.Head_TagVo;

public class Board_PostManager {
	private static SqlSessionFactory factory;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("com/db/config/sqlMapConfig.xml");
			factory = new SqlSessionFactoryBuilder().build(reader);
			reader.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	// 게시글 목록
	public static List<Board_PostViewVo> listBoard_Post() {
		SqlSession session = factory.openSession();
		List<Board_PostViewVo> list = session.selectList("board_post.select");
		session.close();
		return list;
	}

	// 게시글 등록
	public static int insertBoard_Post(Board_PostViewVo vo) {
		int re = -1;
		SqlSession session = factory.openSession();
		re = session.insert("board_post.insert", vo);
		session.commit();
		session.close();
		return re;
	}

	// 게시글 상세
	public static Board_PostVo detailBoard_Post(int board_no) {
		SqlSession session = factory.openSession();
		Board_PostVo b = session.selectOne("board.detail", board_no);
		session.close();
		return b;
	}

	// 게시글 수정
	public static int updateBoard_Post(Board_PostViewVo vo) {
		int re = -1;
		SqlSession session = factory.openSession();
		re = session.update("board_post.update", vo);
		session.commit();
		session.close();
		return re;
	}

//	// 게시글 삭제
//	public static int deleteBoard_Post(Board_PostVo vo) {
//		int re = -1;
//		SqlSession session = factory.openSession();
//		re = session.delete("board_post.delete", vo);
//		session.commit();
//		session.close();
//		return re;
//	}
	
	// 게시글 삭제
	public static int deleteBoard_Post(int board_no) {
		int re = -1;
		SqlSession session = factory.openSession();
		re = session.delete("board_post.delete", board_no);
		session.commit();
		session.close();
		return re;
	}
	
	// 말머리 목록
	public static List<Head_TagVo> listHead_Tag() {
		SqlSession session = factory.openSession();
		List<Head_TagVo> list = session.selectList("board_post.selectHead_Tag");
		session.close();
		return list;
	}
}
