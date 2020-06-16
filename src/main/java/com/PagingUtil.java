package com;

import java.util.HashMap;
import java.util.Map;

public class PagingUtil {
											//페이지번호			총 레코드 수		 페이지당 레코드 수	화면당 페이지 수
	public static Map<String, Integer> pager(int pageNum, int totalRecord, int pageSize, int pageGroup){
		Map<String, Integer> map = new HashMap<String, Integer>();
		int total_page = (int)Math.ceil((double)totalRecord / pageSize);	//총 페이지 수
		//현재 페이지 번호가 총 페이지 수 보다 크면 현재 페이지 번호를 총 페이지 수로 변경
		if(pageNum > total_page) {
			pageNum = total_page;
		}
		//페이지당 시작 레코드 번호 계산. 현재 페이지 번호에서 1를 빼고 페이지당 출력되는 글 수 만큼 곱한 뒤 1을 더함.
		//1페이지인 경우 시작 레코드를 1부터 시작해야 하므로 -1을 하고, 0으로 만든 다음 +1
		int start_idx = ((pageNum - 1) * pageSize) + 1;
		//페이지당 마지막 레코드 번호 계산. 페이지 번호에 페이지당 출력되는 글 수를 곱함.
		int end_idx = pageNum * pageSize;
		//페이지당 마지막 레코드 번호가 총 레코드 카운트보다 크면 마지막 레코드 번호를 총 레코드 카운트로 변경
		if(end_idx > totalRecord) {
			end_idx = totalRecord;
		}
		//페이지 그룹의 시작 페이지 번호 계산.
		int start_page =  (pageNum - 1) / pageGroup * pageGroup + 1;
		//페이지 그룹의 마지막 페이지 번호 계산
		int end_page = start_page + (pageGroup - 1);
		//마지막 페이지 번호가 총 페이지 수 보다 크면 마지막 페이지 번호를 총 페이지 수로 변경
		if (end_page > total_page) {
			end_page = total_page;
		}
		//매퍼와 컨트롤러, 뷰에서 사용할 값들을 맵에 저장.
		map.put("pageNum", pageNum);		//현재 페이지 번호		컨트롤러에서 사용
		map.put("total_page", total_page);	//총 페이지 수			뷰에서 사용
		map.put("start_idx", start_idx);	//시작 레코드 번호		매퍼에서 사용
		map.put("end_idx", end_idx);		//마지막 레코드 번호		매퍼에서 사용
		map.put("start_page", start_page);	//시작 페이지 번호		뷰에서 사용
		map.put("end_page", end_page);		//마지막 페이지 번호		뷰에서 사용
		//페이지 관련 값들을 담은 맵 객체 반환
		return map;
		
	}
}
