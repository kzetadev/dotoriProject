package com.faq.service;

import java.util.List;

import com.faq.vo.FaqVo;

public interface FaqService {
	// faq 목록
	List<FaqVo> listFaq();
	
	// faq 추가
	int insertFaq(FaqVo fv);
	
	// faq 상세
	FaqVo detailFaq(int faq_no);
	
	// faq 수정
	int updateFaq(FaqVo fv);
	
	// faq 삭제
	int deleteFaq(int faq_no);
	
}
