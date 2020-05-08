package com.member.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Id_QuestionVo {

	private int mem_question_no;  //본인확인질문 고유번호
	private int mem_no;  //회원번호
	private String mem_question;  //비밀번호찾기 질문
	private String mem_answer;  //비밀번호찾기 답
}
