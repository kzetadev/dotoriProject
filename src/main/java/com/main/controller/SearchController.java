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
	
	public static int totalRecord = 0; 		// 전체 레코드 수를 저장하기 위한 변수
	public static int placePageSIZE = 9; 	// 한 화면에 보여줄 레코드 수를 제한하기 위한 변수
	public static int boardPageSIZE = 8; 	// 한 화면에 보여줄 레코드 수를 제한하기 위한 변수
	public static int totalPage = 1; 		// 전체 페이지 수를 저장하기 위한 변수
	public static int pageGroup = 5; 		// 한 화면에 보여줄 페이지의 수를 제한하기 위한 변수
	
	//통합검색란에서 검색어 입력 시 동작하는 메소드
	@RequestMapping(value="/unifiedSearch.do/{keyword}", method=RequestMethod.GET)
	public ModelAndView unifiedSearch(@PathVariable("keyword")String keyword) {
		ModelAndView mav = new ModelAndView("unifiedSearch");
		Map map = new HashMap();
		map.put("keyword", keyword);
		
		mav.addObject("keyword", keyword);
		mav.addObject("tList", place_themeService.unifiedSearchTheme(map));		//검색어로 조회된 테마 리스트(명소, 음식, 숙소, ...)
		mav.addObject("bList", board_postService.unifiedBoardSearch(map));		//검색어로 조회된 게시판 종류 리스트(자유, 후기, 동행)
		return mav;
	}
	
	//테마 클릭 후 검색 조건을 조회하기 위한 메소드
	@RequestMapping(value="/getCondition.do/{keyword}/{place_type}", method=RequestMethod.GET)
	@ResponseBody
	public String unifiedSearch(@PathVariable("keyword")String keyword, @PathVariable("place_type")int place_type) {
		String result = "";
		Map map = new HashMap();
		map.put("keyword", keyword);								//검색어
		map.put("place_type", place_type);							//테마번호
		List<SearchConditionVo> scList = place_infoService.unifiedSearchCondition(map);
		
		result = (new Gson()).toJson(scList);
		return result;
	}
	
	//테마, 검색조건으로 여행장소 목록을 조회하는 메소드
	//"/searchPlace.do/" + keyword + "/" + type + "/" + column + "/" + parseInt($(this).attr('page')) + "/" + tot_cnt
	//										검색어	  테마번호		    검색조건	페이지번호	  총 레코드 카운트	총 페이지 카운트
	@RequestMapping(value="/searchPlace.do/{keyword}/{place_type}/{column}/{pageNUM}/{total_record}/{total_page}", method=RequestMethod.GET)
	@ResponseBody
	public String searchPlace(@PathVariable("keyword")String keyword, @PathVariable("place_type")int place_type
			, @PathVariable("column")int column, @PathVariable("pageNUM")int pageNUM, @PathVariable("total_record")int total_record
			, @PathVariable("total_page")int total_page) {
		String result = "";
		// 페이지 번호가 전체 페이지 수보다 크다면
		if (pageNUM > total_page) {
			pageNUM = total_page;
		}
		int start = (pageNUM - 1) * placePageSIZE + 1;
		int end = start + placePageSIZE - 1;
		if(end > total_record) {
			end = total_record;
		}
		Map map = new HashMap();
		//매퍼에서 사용하는 변수들을 담는 맵 객체
		map.put("keyword", keyword);							//검색어
		map.put("place_type", place_type);						//테마번호
		map.put("column", column);								//검색조건(장소명, 주소, 설명)
		map.put("start", start);								//시작 레코드 번호
		map.put("end", end);									//마지막 레코드 번호
		List<Place_InfoVo> pList = place_infoService.searchPlace(map);
		
		result = (new Gson()).toJson(pList);
		return result;
	}
	
	//게시판 종류 클릭 후 검색 조건을 조회하기 위한 메소드
	//										검색어		게시판 종류
	@RequestMapping("/getBoardCondition.do/{keyword}/{board_kinds}")
	@ResponseBody
	public String getBoardCondition(@PathVariable("keyword")String keyword, @PathVariable("board_kinds")int board_kinds) {
		String result = "";
		Map map = new HashMap();
		//매퍼에서 사용하는 변수들을 담는 맵 객체
		map.put("keyword", keyword);				//검색어
		map.put("board_kinds", board_kinds);		//게시판 종류
		List<SearchConditionVo> scList = board_postService.unifiedBoardCondition(map);
		
		result = (new Gson()).toJson(scList);
		return result;
	}
	//게시판 종류, 검색 조건으로 게시글 목록을 조회하기 위한 메소드
	//										검색어	  게시판 종류		검색조건	페이지번호     총 레코드 카운트	  총 페이지 카운트
	@RequestMapping(value="/searchBoard.do/{keyword}/{board_kinds}/{column}/{pageNUM}/{total_record}/{total_page}", method=RequestMethod.GET)
	@ResponseBody
	public String searchBoard(@PathVariable("keyword")String keyword, @PathVariable("board_kinds")int board_kinds
			, @PathVariable("column")int column, @PathVariable("pageNUM")int pageNUM, @PathVariable("total_record")int total_record
			, @PathVariable("total_page")int total_page) {
		String result = "";
		// 페이지 번호가 전체 페이지 수보다 크다면
		if (pageNUM > total_page) {
			pageNUM = total_page;
		}
		int start = (pageNUM - 1) * boardPageSIZE + 1;
		int end = start + boardPageSIZE - 1;
		if(end > total_record) {
			end = total_record;
		}
		//매퍼에서 사용하는 변수들을 담는 맵 객체
		Map map = new HashMap();
		map.put("keyword", keyword);				//검색어
		map.put("board_kinds", board_kinds);		//게시판 종류
		map.put("column", column);					//검색 조건
		map.put("start", start);					//시작 레코드 번호
		map.put("end", end);						//마지막 레코드 번호
		List<Board_PostSearchVo> bList = board_postService.searchBoard(map);
		
		result = (new Gson()).toJson(bList);
		return result;
	}
	
}
