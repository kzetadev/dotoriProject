package com.board.dao;

import java.util.List;

import com.board.vo.Board_CommentVo;

public interface Board_CommentDao {
	//게시글 상세보기 하단 댓글 목록
	List<Board_CommentVo> listComment(int board_no);
	
	// 마이페이지에서 회원id가 #{mem_id}인 사람이 쓴 댓글들 보기
	List<Board_CommentVo> listBoard_Comment();
	
	// 댓글 번호가 x번인 사람이 올린 게시글에 올린 댓글(들) (부정확)
	Board_CommentVo detailBoard_Comment(int comment_no);
	
	// x번 회원이 x번 게시물에 대한 댓글을 달음 (부정확)
	int insertBoard_Comment(Board_CommentVo vo);
	
	// x번 회원이 x번 게시글에 쓴 댓글을 수정 (첨부파일 수정은 고려 안함)
	int updateBoard_Comment(Board_CommentVo vo);
	
	// 댓글번호가 x인 (x번 회원이 x번 게시글에 쓴) 댓글을 삭제 (첨부파일 삭제는 고려 안함)
	int deleteBoard_Comment(Board_CommentVo vo);
	
	// 글에 작성할 다음 댓글 번호 가져오기
	int selectNextCommentNo(int board_no);
}
