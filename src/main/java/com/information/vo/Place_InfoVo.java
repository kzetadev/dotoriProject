package com.information.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Place_InfoVo {
	private int place_no; // 여행장소 번호
	private String place_name; // 장소 이름
	private String place_img; // 사진
	private String place_tel; // 전화번호
	private String place_open; // 운영 요일 & 휴무일
	private String place_price; // 이용 요금
	private double place_row; // 장소 위도
	private double place_col; // 장소 경도
	private String place_addr; // 주소
	private int place_type; // 구분 (명소 : 0, 음식점 : 1, 숙소 : 2)
	private String place_detail; // 상세 설명
	private String place_hit; // 조회수
}
