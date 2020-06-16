package com.member.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.member.vo.Member_InfoVo;
@Repository("member_infoDao")
public class Member_InfoDaoImpl implements Member_InfoDao {
	@Inject
	protected SqlSessionTemplate sqlSessionTemplate;

	//유저 로그인 메소드
	@Override
	public Member_InfoVo login(Member_InfoVo vo) {
		return sqlSessionTemplate.selectOne("mem_info.login", vo);
	}
	//시큐리티용 로그인
	@Override
	public Member_InfoVo loginById(String mem_id) {
		return sqlSessionTemplate.selectOne("mem_info.loginById", mem_id);
	}
	// 회원정보 수정
	@Override
	public int update(Member_InfoVo vo) {
		return sqlSessionTemplate.update("mem_info.update", vo);
	}
	// 회원 탈퇴
	@Override
	public int delete(int mem_no) {
		return sqlSessionTemplate.delete("mem_info.delete", mem_no);
	}
	//유저 회원가입 매소드
	@Override
	public int joinMember(Member_InfoVo vo) {
		return sqlSessionTemplate.insert("mem_info.insert", vo);
	}
	//회원임시 비밀번호 변경 메소드
	@Override
	public int changeTempPwd(Member_InfoVo vo) {
		return 0;
	}
	//아이디 중복체크
	@Override
	public int checkOverId(String mem_id) {
		return sqlSessionTemplate.selectOne("mem_info.checkOverId", mem_id);
	}
	//닉네임 중복체크
	@Override
	public int checkOverNickName(String mem_nickname) {
		return sqlSessionTemplate.selectOne("mem_info.checkOverNickname", mem_nickname);
	}
	//이메일 중복 체크
	@Override
	public int checkOverEmail(String mem_email) {
		return sqlSessionTemplate.selectOne("mem_info.checkOverEmail", mem_email);
	}
	//이메일 인증코드 중복 체크
	@Override
	public int checkCode(int mem_check_code) {
		return sqlSessionTemplate.selectOne("mem_info.checkCode", mem_check_code);
	}
	//이메일 인증
	@Override
	public int emailAuth(Member_InfoVo vo) {
		return sqlSessionTemplate.update("mem_info.emailAuth", vo);
	}
	//인증코드 해당 id 인증코드에 업데이트
	@Override
	public int updateCode(Member_InfoVo vo) throws Exception {
		return sqlSessionTemplate.update("mem_info.upCode", vo);
	}
	
	//비밀번호 변경
	@Override
	public int pass_change(Map<String, Object> map) throws Exception {
		return sqlSessionTemplate.update("mem_info.pass_change", map);
	}
	//아이디 찾기
	@Override
	public String find_idCheck(Member_InfoVo vo) {
		String mem_id = sqlSessionTemplate.selectOne("mem_info.find_id_check", vo);
		return mem_id;
	}
	//비밀번호 찾기
	@Override
	public String find_pwdCheck(Member_InfoVo vo) {
		String mem_pwd = sqlSessionTemplate.selectOne("mem_info.find_pwd_check", vo);
		return mem_pwd;
	}
}
