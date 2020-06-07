package com.board.service;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.board.dao.Board_CommentDao;
import com.board.vo.Board_CommentVo;
@Service("board_commentService")
public class Board_CommentServiceImpl implements Board_CommentService{
	@Inject
	@Resource(name="board_commentDao")
	protected Board_CommentDao board_commentDao;
	
	//게시글 상세보기 하단 댓글 목록
	@Override
	public List<Board_CommentVo> listComment(int board_no) {
		return board_commentDao.listComment(board_no);
	}
	
	// 마이페이지에서 회원id가 #{mem_id}인 사람이 쓴 댓글들 보기
	@Override
	public List<Board_CommentVo> listBoard_Comment() {
		return board_commentDao.listBoard_Comment();
	}

	// 댓글 번호가 x번인 사람이 올린 게시글에 올린 댓글(들) (부정확)
	@Override
	public Board_CommentVo detailBoard_Comment(int comment_no) {
		return board_commentDao.detailBoard_Comment(comment_no);
	}

	// x번 회원이 x번 게시물에 대한 댓글을 달음 (부정확)
	@Override
	public int insertBoard_Comment(Board_CommentVo vo) {
		return board_commentDao.insertBoard_Comment(vo);
	}

	// x번 회원이 x번 게시글에 쓴 댓글을 수정 (첨부파일 수정은 고려 안함)
	@Override
	public int updateBoard_Comment(Board_CommentVo vo) {
		return board_commentDao.updateBoard_Comment(vo);
	}

	// x번 회원이 x번 게시글에 쓴 댓글을 삭제 (첨부파일 삭제는 고려 안함)
	@Override
	public int deleteBoard_Comment(Board_CommentVo vo) {
		return board_commentDao.deleteBoard_Comment(vo);
	}
	// 글 삭제 시 해당 글에 대한 댓글 전부 삭제 
	@Override
	public int deleteBoard_Comment(int board_no) {
		// TODO Auto-generated method stub
		return board_commentDao.deleteBoard_Comment(board_no);
	}
	// 글에 작성할 다음 댓글 번호 가져오기
	@Override
	public int selectNextCommentNo(int board_no) {
		// TODO Auto-generated method stub
		return board_commentDao.selectNextCommentNo(board_no);
	}
}
