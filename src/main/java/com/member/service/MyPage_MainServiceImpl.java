package com.member.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.member.dao.MyPage_MainDao;
import com.member.vo.MyPage_MainVo;

@Service("mypage_mainService")
public class MyPage_MainServiceImpl implements MyPage_MainService {
	@Inject
	protected MyPage_MainDao mypage_mainDao;
	
	// 마이페이지 메인 화면
	@Override
	public MyPage_MainVo myPage_Main(int mem_no) {
		return mypage_mainDao.myPage_Main(mem_no);
	}

}
