package com.board.service;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.board.dao.Head_TagDao;
import com.board.vo.Head_TagVo;
@Service("head_tagService")
public class Head_TagServiceImpl implements Head_TagService {
	@Inject
	@Resource(name="head_tagDao")
	protected Head_TagDao head_tagDao;
	// 말머리 목록
	@Override
	public List<Head_TagVo> listHead_Tag() {
		// TODO Auto-generated method stub
		return head_tagDao.listHead_Tag();
	}
	// 게시판 구분에 따른 말머리 목록 
	@Override
	public List<Head_TagVo> listHead_TagByBoard_Kinds(int board_kinds) {
		// TODO Auto-generated method stub
		return head_tagDao.listHead_TagByBoard_Kinds(board_kinds);
	}
}
