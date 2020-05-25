package com.faq.dao;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.faq.vo.FaqVo;

@Repository("faqDao")
public class FaqDaoImpl implements FaqDao {
	@Inject
	protected SqlSessionTemplate sqlSessionTemplate;
	
	// faq 목록
	@Override
	public List<FaqVo> listFaq() {
		return sqlSessionTemplate.selectList("faq.selectAll");
	}

	// faq 추가
	@Override
	public int insertFaq(FaqVo fv) {
		return sqlSessionTemplate.insert("faq.insert", fv);
	}

	// faq 상세
	@Override
	public FaqVo detailFaq(int faq_no) {
		return sqlSessionTemplate.selectOne("faq.detail", faq_no);
	}
	
	// faq 수정
	@Override
	public int updateFaq(FaqVo fv) {
		return sqlSessionTemplate.update("faq.update", fv);
	}

	// faq 삭제
	@Override
	public int deleteFaq(int faq_no) {
		return sqlSessionTemplate.delete("faq.delete", faq_no);
	}

}
