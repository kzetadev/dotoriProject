package com.member.service;

import java.util.List;
import java.util.Map;

import com.member.vo.Member_InfoVo;
import com.member.vo.Member_MessageListVo;
import com.member.vo.Member_MessageVo;
import com.member.vo.MyPage_CommentVo;
import com.member.vo.MyPage_PostVo;

public interface MyPage_commentService {
	// 내가 쓴 댓글 목록 레코드 카운트 가져오기
	int list_comment_count(int mem_no);
		
	// 내가 쓴 댓글 목록
	List<MyPage_CommentVo> list(Map map) throws Exception;

	// 내가 쓴 글 목록 레코드 카운트 가져오기
	int list_post_count(int mem_no);
	// 내가 쓴 글 목록
	List<MyPage_PostVo> list_post(Map map) throws Exception;

	// 회원정보수정
	int updateMem(Member_InfoVo vo);

	// 회원 정보 삭제
	void delMem(String mem_id);

	// 비밀번호 체크
	boolean checkPwd(String mem_id, String mem_pwd);
	
	//쪽지 보내기
	int sendMessage(Member_MessageVo vo);
	
	//발신 쪽지 레코드 카운트 가져오기
	int sendMsgRecordcount(int mem_no);
	
	//발신 쪽지 목록 가져오기
	List<Member_MessageListVo> sendMsgList(Map map);
	
	//수신 쪽지 레코드 카운트 가져오기
	int receiveMsgRecordcount(int mem_no);
	
	//수신 쪽지 목록 가져오기
	List<Member_MessageListVo> receiveMsgList(Map map);
	
	//쪽지 읽기 여부 저장
	int messageRead(int post_no);
	
	//쪽지 답변 여부 저장
	int messageReply(int post_no);
	
	//쪽지 읽기
	Member_MessageListVo messageDetail(Map map);
	
}
