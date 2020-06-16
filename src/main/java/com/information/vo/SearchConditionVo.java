package com.information.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
//통합 검색화면에서 테마 탭 클릭 시 표시할 검색조건 탭 정보
public class SearchConditionVo {
	private String condition_kor;	//검색조건 한글명. 장소명, 주소, 설명
	private int condition_col;		//검색조건 컬럼명. place_name, place_addr, place_detail
	private int search_cnt;			//검색조건에 대한 총 레코드 카운트
}
