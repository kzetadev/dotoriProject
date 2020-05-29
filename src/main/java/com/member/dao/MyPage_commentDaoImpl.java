package com.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.member.vo.Member_InfoVo;
import com.member.vo.Member_MessageListVo;
import com.member.vo.Member_MessageVo;
import com.member.vo.MyPage_CommentVo;
import com.member.vo.MyPage_PostVo;

@Repository("myPage_commentDao")
public class MyPage_commentDaoImpl implements MyPage_commentDao {

	@Inject
	private SqlSession sqlSession;
	
	@Inject
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<MyPage_CommentVo> list(int mem_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("myPage.list", mem_no);
	}

	@Override
	public List<MyPage_PostVo> list_post(int mem_no) {
		return sqlSession.selectList("myPage.myList", mem_no);
	}

	// 회원정보수정
	@Override
	public int updateMem(Member_InfoVo vo){
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("myPage.updateMem", vo);
	}

	// 회원탈퇴
	@Override
	public void delMem(String mem_id) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.delete("myPage.delMem", mem_id);
	}

	// 회원정보 수정,탈퇴를 위한 비밀번호 체크
	@Override
	public boolean checkPwd(String mem_id, String mem_pwd) {
		boolean re = false;

		Map<String, String> map = new HashMap<String, String>();
		map.put("mem_id", mem_id);
		map.put("mem_pwd", mem_pwd);

		int count = sqlSessionTemplate.selectOne("mem_info.checkPwd", map);
		if (count == 1)
			re = true;

		return re;
	}
	//쪽지 보내기
	@Override
	public int sendMessage(Member_MessageVo vo) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("myPage.sendMessage", vo);
	}
	//발신 쪽지 목록 가져오기
	@Override
	public List<Member_MessageListVo> sendMsgList(int mem_no) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("myPage.sendMsgList", mem_no);
	}

}
