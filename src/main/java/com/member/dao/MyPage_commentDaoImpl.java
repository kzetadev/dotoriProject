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
	// 내가 쓴 댓글 목록 레코드 카운트 가져오기
	@Override
	public int list_comment_count(int mem_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("myPage.list_comment_count", mem_no);
	}
	@Override
	public List<MyPage_CommentVo> list(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("myPage.list", map);
	}
	// 내가 쓴 글 목록 레코드 카운트 가져오기
	@Override
	public int list_post_count(int mem_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("myPage.list_post_count", mem_no);
	}
	@Override
	public List<MyPage_PostVo> list_post(Map map) {
		return sqlSession.selectList("myPage.myList", map);
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
	//발신 쪽지 레코드 카운트 가져오기
	@Override
	public int sendMsgRecordcount(int mem_no) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("myPage.sendMsgRecordcount", mem_no);
	}
	//발신 쪽지 목록 가져오기
	@Override
	public List<Member_MessageListVo> sendMsgList(Map map) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("myPage.sendMsgList", map);
	}
	//수신 쪽지 레코드 카운트 가져오기
	@Override
	public int receiveMsgRecordcount(int mem_no) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("myPage.receiveMsgRecordcount", mem_no);
	}
	//수신 쪽지 목록 가져오기
	@Override
	public List<Member_MessageListVo> receiveMsgList(Map map) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("myPage.receiveMsgList", map);
	}
	//쪽지 읽기 여부 저장
	@Override
	public int messageRead(int post_no) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("myPage.messageRead", post_no);
	}
	//쪽지 답변 여부 저장
	@Override
	public int messageReply(int post_no) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("myPage.messageReply", post_no);
	}
	//쪽지 읽기
	@Override
	public Member_MessageListVo messageDetail(Map map) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("myPage.messageDetail", map);
	}
}
