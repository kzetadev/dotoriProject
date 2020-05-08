package com.information.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
//테마정보(place_theme)vo
public class Place_ThemeVo {
	private int place_type;			//여행 장소 테마 번호
	private String place_type_name;	//여행 장소 테마 명
}
