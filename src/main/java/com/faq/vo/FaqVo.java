package com.faq.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class FaqVo {
	private int faq_no; // faq 글번호
	private int mem_no; // 회원 번호
	private String faq_question; // faq 질문
	private String faq_answer; // faq 답변
}
