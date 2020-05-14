package com.information.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class Member_FavoriteVo {

	private int favorite_no;    //찜번호
	private int mem_no;     //회원번호
	private int place_no;     //여행장소 번호
//	private String place_name; // 여행장소 이름
//	private String place_img; // 여행장소 사진
//	private String place_type; // 여행장소 테마 번호 
}
