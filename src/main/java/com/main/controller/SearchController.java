package com.main.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.board.service.Board_PostService;
import com.board.vo.Board_PostSearchVo;
import com.google.gson.Gson;
import com.information.service.Place_InfoService;
import com.information.service.Place_ThemeService;
import com.information.vo.Place_InfoVo;
import com.information.vo.SearchConditionVo;

@Controller
public class SearchController {
	@Resource(name="place_infoService")
	private Place_InfoService place_infoService;
	@Resource(name="place_themeService")
	private Place_ThemeService place_themeService;
	@Resource(name="board_postService")
	private Board_PostService board_postService;
	public static int totalRecord = 0; // 전체 레코드 수를 저장하기 위한 변수
	public static int pageSIZE = 8; // 한 화면에 보여줄 레코드 수를 제한하기 위한 변수
	public static int totalPage = 1; // 전체 페이지 수를 저장하기 위한 변수
	public static int pageGroup = 5; // 한 화면에 보여줄 페이지의 수를 제한하기 위한 변수
	@RequestMapping(value="/unifiedSearch.do/{keyword}", method=RequestMethod.GET)
	public ModelAndView unifiedSearch(@PathVariable("keyword")String keyword) {
		ModelAndView mav = new ModelAndView("unifiedSearch");
		System.out.println("unifiedSearch " + keyword);
		Map map = new HashMap();
		map.put("keyword", keyword);
		mav.addObject("keyword", keyword);
		mav.addObject("tList", place_themeService.unifiedSearchTheme(map));
		mav.addObject("bList", board_postService.unifiedBoardSearch(map));
		return mav;
	}
	
	@RequestMapping(value="/getCondition.do/{keyword}/{place_type}", method=RequestMethod.GET)
	@ResponseBody
	public String unifiedSearch(@PathVariable("keyword")String keyword, @PathVariable("place_type")int place_type) {
		System.out.println("unifiedSearch " + keyword + "\t" + place_type);
		String result = "";
//		int convert_place_type = -1;
//		System.out.println((place_type instanceof Integer));
//		if(!(place_type instanceof Integer)) {
//			result = "invalid";
//			return result;
//		}else {
//			convert_place_type = (int)place_type;
//			if(convert_place_type < 0) {
//				result = "invalid";
//				return result;
//			}
//		}
//		convert_place_type = (Integer)place_type;
		Map map = new HashMap();
		map.put("keyword", keyword);
		map.put("place_type", place_type);
		List<SearchConditionVo> scList = place_infoService.unifiedSearchCondition(map);
		result = (new Gson()).toJson(scList);
		System.out.println(result);
		return result;
	}
	//"/searchPlace.do/" + keyword + "/" + type + "/" + column + "/" + parseInt($(this).attr('page')) + "/" + tot_cnt
	@RequestMapping(value="/searchPlace.do/{keyword}/{place_type}/{column}/{pageNUM}/{total_record}/{total_page}", method=RequestMethod.GET)
	@ResponseBody
	public String searchPlace(@PathVariable("keyword")String keyword, @PathVariable("place_type")int place_type
			, @PathVariable("column")int column, @PathVariable("pageNUM")int pageNUM, @PathVariable("total_record")int total_record
			, @PathVariable("total_page")int total_page) {
		String result = "";
//		int start = 1;
//		int end = 10;
//		totalRecord = place_infoService.getTotalRecord(map);
//		totalPage = (int)Math.ceil(totalRecord / (double)pageSIZE);
		System.out.println("전체 페이지 수 : " + totalPage);
		if (pageNUM > total_page) {
			pageNUM = total_page;
		}
		int start = (pageNUM - 1) * pageSIZE + 1;
		int end = start + pageSIZE - 1;
		if(end > total_record) {
			end = total_record;
		}
		Map map = new HashMap();
		map.put("keyword", keyword);
		map.put("place_type", place_type);
		map.put("column", column);
		map.put("start", start);
		map.put("end", end);
		System.out.println("keyword " + keyword + "\tplace_type " + place_type + "\tcolumn " + column + "\tpageNUM " + pageNUM + "\ttotal_record " + total_record + "\ttotal_page " + total_page + "\tstart " + start + "\tend " + end);
		List<Place_InfoVo> pList = place_infoService.searchPlace(map);
		result = (new Gson()).toJson(pList);
		System.out.println(pList);
		return result;
		
	}
	
	@RequestMapping("/getBoardCondition.do/{keyword}/{board_kinds}")
	@ResponseBody
	public String getBoardCondition(@PathVariable("keyword")String keyword, @PathVariable("board_kinds")int board_kinds) {
		String result = "";
		Map map = new HashMap();
		map.put("keyword", keyword);
		map.put("board_kinds", board_kinds);
		List<SearchConditionVo> scList = board_postService.unifiedBoardCondition(map);
		result = (new Gson()).toJson(scList);
		return result;
	}
	@RequestMapping(value="/searchBoard.do/{keyword}/{board_kinds}/{column}/{pageNUM}/{total_record}/{total_page}", method=RequestMethod.GET)
	@ResponseBody
	public String searchBoard(@PathVariable("keyword")String keyword, @PathVariable("board_kinds")int board_kinds
			, @PathVariable("column")int column, @PathVariable("pageNUM")int pageNUM, @PathVariable("total_record")int total_record
			, @PathVariable("total_page")int total_page) {
		String result = "";
//		int start = 1;
//		int end = 10;
//		totalRecord = place_infoService.getTotalRecord(map);
//		totalPage = (int)Math.ceil(totalRecord / (double)pageSIZE);
		System.out.println("전체 페이지 수 : " + totalPage);
		if (pageNUM > total_page) {
			pageNUM = total_page;
		}
		int start = (pageNUM - 1) * pageSIZE + 1;
		int end = start + pageSIZE - 1;
		if(end > total_record) {
			end = total_record;
		}
		Map map = new HashMap();
		map.put("keyword", keyword);
		map.put("board_kinds", board_kinds);
		map.put("column", column);
		map.put("start", start);
		map.put("end", end);
		System.out.println("keyword " + keyword + "\tboard_kinds " + board_kinds + "\tcolumn " + column + "\tpageNUM " + pageNUM + "\ttotal_record " + total_record + "\ttotal_page " + total_page + "\tstart " + start + "\tend " + end);
		List<Board_PostSearchVo> bList = board_postService.searchBoard(map);
		result = (new Gson()).toJson(bList);
		System.out.println(bList);
		return result;
		
	}
}
