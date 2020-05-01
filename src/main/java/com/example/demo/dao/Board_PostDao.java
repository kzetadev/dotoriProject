package com.example.demo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.Board_PostManager;
import com.example.demo.vo.Board_PostVo;

@Repository
public class Board_PostDao {
	public List<Board_PostVo> listBoard_Post(){
		return Board_PostManager.listBoard_Post();
	}
	
}
