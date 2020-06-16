package com.member.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.member.dao.MyPage_commentDao;
import com.member.vo.Member_InfoVo;
import com.member.vo.Member_MessageListVo;
import com.member.vo.Member_MessageVo;
import com.member.vo.MyPage_CommentVo;
import com.member.vo.MyPage_PostVo;

@Service("myPage_commentService")
public class MyPage_commentServiceImpl implements MyPage_commentService {
	@Inject
	private MyPage_commentDao myPage_commentDao;
	// 내가 쓴 댓글 목록 레코드 카운트 가져오기
	@Override
	public int list_comment_count(int mem_no) {
		return myPage_commentDao.list_comment_count(mem_no);
	}
	// 내가 쓴 댓글 목록
	@Override
	public List<MyPage_CommentVo> list(Map map) throws Exception {
		return myPage_commentDao.list(map);
	}
	// 내가 쓴 글 목록 레코드 카운트 가져오기
	@Override
	public int list_post_count(int mem_no) {
		return myPage_commentDao.list_post_count(mem_no);
	}
	// 내가 쓴 글 목록
	@Override
	public List<MyPage_PostVo> list_post(Map map) throws Exception {
		return myPage_commentDao.list_post(map);
	}
	// 회원정보수정
	@Override
	public int updateMem(Member_InfoVo vo) {
		return myPage_commentDao.updateMem(vo);
	}
	// 회원 정보 삭제
	@Override
	public void delMem(String mem_id) {
		myPage_commentDao.delMem(mem_id);
	}
	// 비밀번호 체크
	@Override
	public boolean checkPwd(String mem_id, String mem_pwd) {
		return myPage_commentDao.checkPwd(mem_id, mem_pwd);
	}
	//쪽지 보내기
	@Override
	public int sendMessage(Member_MessageVo vo) {
		return myPage_commentDao.sendMessage(vo);
	}
	//발신 쪽지 레코드 카운트 가져오기
	@Override
	public int sendMsgRecordcount(int mem_no) {
		return myPage_commentDao.sendMsgRecordcount(mem_no);
	}
	//발신 쪽지 목록 가져오기
	@Override
	public List<Member_MessageListVo> sendMsgList(Map map) {
		return myPage_commentDao.sendMsgList(map);
	}
	//수신 쪽지 레코드 카운트 가져오기
	@Override
	public int receiveMsgRecordcount(int mem_no) {
		return myPage_commentDao.receiveMsgRecordcount(mem_no);
	}
	//수신 쪽지 목록 가져오기
	@Override
	public List<Member_MessageListVo> receiveMsgList(Map map) {
		return myPage_commentDao.receiveMsgList(map);
	}
	//쪽지 읽기 여부 저장
	@Override
	public int messageRead(int post_no) {
		return myPage_commentDao.messageRead(post_no);
	}
	//쪽지 답변 여부 저장
	@Override
	public int messageReply(int post_no) {
		return myPage_commentDao.messageReply(post_no);
	}
	//쪽지 읽기
	@Override
	public Member_MessageListVo messageDetail(Map map) {
		return myPage_commentDao.messageDetail(map);
	}
}
