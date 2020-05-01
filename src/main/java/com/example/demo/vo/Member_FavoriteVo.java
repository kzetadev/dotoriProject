package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Member_FavoriteVo {
	private int favorite_no; // 찜번호
	private int mem_no; // 회원번호
	private int place_no; // 여행장소 번호
}
