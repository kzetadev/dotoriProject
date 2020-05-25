package com.faq.service;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.faq.dao.FaqDao;
import com.faq.vo.FaqVo;
@Service("faqService")
public class FaqServiceImpl implements FaqService {
	@Inject
	@Resource(name="faqDao")
	protected FaqDao faqDao;
	
	// faq 목록
	@Override
	public List<FaqVo> listFaq() {
		return faqDao.listFaq();
	}

	// faq 추가
	@Override
	public int insertFaq(FaqVo fv) {
		return faqDao.insertFaq(fv);
	}

	// faq 상세
	@Override
	public FaqVo detailFaq(int faq_no) {
		return faqDao.detailFaq(faq_no);
	}
	
	// faq 수정
	@Override
	public int updateFaq(FaqVo fv) {
		return faqDao.updateFaq(fv);
	}

	// faq 삭제
	@Override
	public int deleteFaq(int faq_no) {
		return faqDao.deleteFaq(faq_no);
	}

}