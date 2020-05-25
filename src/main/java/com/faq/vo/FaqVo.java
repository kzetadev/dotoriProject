package com.faq.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class FaqVo {
	private int faq_no;
	private int mem_no;
	private String faq_question;
	private String faq_answer;
}
