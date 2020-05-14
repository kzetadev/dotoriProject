package com.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.board.vo.Board_CommentVo;

@Repository("board_commentDao")
public class Board_CommentDaoImpl implements Board_CommentDao {
	@Inject
	protected SqlSessionTemplate sqlSessionTemplate;
	
	// 마이페이지에서 회원id가 #{mem_id}인 사람이 쓴 댓글들 보기
	@Override
	public List<Board_CommentVo> listBoard_Comment() {
		return sqlSessionTemplate.selectList("board_comment.selectAll");
	}

	// 댓글 번호가 x번인 사람이 올린 게시글에 올린 댓글(들) (부정확)
	@Override
	public Board_CommentVo detailBoard_Comment(int comment_no) {
		return sqlSessionTemplate.selectOne("board_comment.selectOne", comment_no);
	}

	// x번 회원이 x번 게시물에 대한 댓글을 달음 (부정확)
	@Override
	public int insertBoard_Comment(Board_CommentVo vo) {
		return sqlSessionTemplate.insert("board_comment.insert", vo);
	}

	// x번 회원이 x번 게시글에 쓴 댓글을 수정 (첨부파일 수정은 고려 안함)
	@Override
	public int updateBoard_Comment(Board_CommentVo vo) {
		return sqlSessionTemplate.update("board_comment.update", vo);
	}

	// x번 회원이 x번 게시글에 쓴 댓글을 삭제 (첨부파일 삭제는 고려 안함)
	@Override
	public int deleteBoard_Comment(Board_CommentVo vo) {
		return sqlSessionTemplate.delete("board_comment.delete", vo);
	}
}
