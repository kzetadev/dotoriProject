package com;

import java.util.HashMap;
import java.util.Map;

public class PagingUtil {
											//페이지번호			총 레코드 수		 페이지당 레코드 수	화면당 페이지 수
	public static Map<String, Integer> pager(int pageNum, int totalRecord, int pageSize, int pageGroup){
		Map<String, Integer> map = new HashMap<String, Integer>();
		int total_page = (int)Math.ceil((double)totalRecord / pageSize);	//총 페이지 수
		if(pageNum > total_page) {
			pageNum = total_page;
		}
		int start_idx = ((pageNum - 1) * pageSize) + 1;
		int end_idx = pageNum * pageSize;
		if(end_idx > totalRecord) {
			end_idx = totalRecord;
		}
		int start_page =  (pageNum - 1) / pageGroup * pageGroup + 1;
		int end_page = start_page + (pageGroup - 1);
		if (end_page > total_page) {
			end_page = total_page;
		}
		map.put("pageNum", pageNum);
		map.put("total_page", total_page);
		map.put("start_idx", start_idx);
		map.put("end_idx", end_idx);
		map.put("start_page", start_page);
		map.put("end_page", end_page);
		return map;
		
	}
}
