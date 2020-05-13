package com.board.service;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.board.dao.Board_PostDao;
import com.board.vo.Board_PostVo;
@Service("board_postService")
public class Board_PostServiceImpl implements Board_PostService {
	@Inject
	@Resource(name="board_postDao")
	protected Board_PostDao board_postDao;
	@Override
	public List<Board_PostVo> listBoard_Post() {
		// TODO Auto-generated method stub
		return board_postDao.listBoard_Post();
	}

	@Override
	public int insertBoard_Post(Board_PostVo vo) {
		// TODO Auto-generated method stub
		return board_postDao.insertBoard_Post(vo);
	}

	@Override
	public Board_PostVo detailBoard_Post(int board_no) {
		// TODO Auto-generated method stub
		return board_postDao.detailBoard_Post(board_no);
	}

	@Override
	public int updateBoard_Post(Board_PostVo vo) {
		// TODO Auto-generated method stub
		return board_postDao.updateBoard_Post(vo);
	}

	@Override
	public int deleteBoard_Post(Board_PostVo vo) {
		// TODO Auto-generated method stub
		return board_postDao.deleteBoard_Post(vo);
	}

}
