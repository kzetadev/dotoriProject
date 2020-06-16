//package com.member.dao;
//
//import javax.inject.Inject;
//
//import org.mybatis.spring.SqlSessionTemplate;
//import org.springframework.stereotype.Repository;
//
//import com.member.vo.Member_Login_LogVo;
//
//@Repository("member_login_logDao")
//public class Member_Login_LogDaoImpl implements Member_Login_LogDao {
//	@Inject
//	protected SqlSessionTemplate sqlSessionTemplate;
//	@Override
//	public int insertLog(Member_Login_LogVo mll) {
//		return sqlSessionTemplate.insert("member_login_log.logInsert", mll);
//	}
//}
