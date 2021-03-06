package com.information.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.information.service.Member_FavoriteService;
import com.information.service.Place_InfoService;
import com.information.service.Place_ThemeService;
import com.information.vo.Place_ThemeVo;
import com.security.config.LoginUser;
@Controller
public class Place_InfoController {
	// 여행 장소 리스트
	@Resource(name="place_infoService")
	private Place_InfoService place_infoService;
	// 여행 장소 카테고리 (테마)
	@Resource(name="place_themeService")
	private Place_ThemeService place_themeService;
	// 찜목록
	@Resource(name="member_favoriteService")
	private Member_FavoriteService member_favoriteService;
	
	public static int totalRecord = 0; // 전체 레코드 수를 저장하기 위한 변수
	public static int pageSIZE = 8; // 한 화면에 보여줄 레코드 수를 제한하기 위한 변수
	public static int totalPage = 1; // 전체 페이지 수를 저장하기 위한 변수
	public static int pageGroup = 5; // 한 화면에 보여줄 페이지의 수를 제한하기 위한 변수

	// 여행 장소 테마 - 정렬 
	@RequestMapping(value="/place/listPlace_Theme", method={RequestMethod.GET}, produces="application/json")
	@ResponseBody
	public String listPlace_Theme() {
		String str = "";
		List<Place_ThemeVo> list = place_themeService.listPlace_Theme();
		Gson gson = new Gson();
		str = gson.toJson(list);
		return str;
	}
	
	// place_type별 정보 리스트 보기 + 페이징 처리 + 검색 + 정렬
	@RequestMapping("/place/listPlace_Info.do")	// null이면 1을 바로 설정, 올 때 int pageNUM으로 받는다는 뜻
	public ModelAndView listPlace_InfoPage(@RequestParam(value="pageNUM", defaultValue="1") int pageNUM, 
			@RequestParam(value="place_type", defaultValue="0") int place_type, String keyword, 
			String searchColumn, String sortColumn, HttpSession session) {
		Place_ThemeVo pt = place_themeService.getPlace_Theme(place_type);
		
		ModelAndView m = new ModelAndView();
		Map map = new HashMap();
		
		//매퍼에서 사용할 맵 객체 - 검색 키워드, 검색 분류, 정렬, 여행장소 테마 번호
		map.put("keyword", keyword);
		map.put("searchColumn", searchColumn);
		map.put("sortColumn", sortColumn);
		map.put("place_type", place_type);
		
		totalRecord = place_infoService.getTotalRecord(map);
		totalPage = (int)Math.ceil(totalRecord / (double)pageSIZE);
		//페이지번호가 총 페이지 수보다 크면 페이지번호를 총 페이지 수로 변경
		if (pageNUM > totalPage) {
			pageNUM = totalPage;
		}
		//시작 레코드번호 계산
		int start = (pageNUM - 1) * pageSIZE + 1;
		//마지막 레코드번호 계산
		int end = start + pageSIZE - 1;
		//마지막 레코드번호가 총 레코드 수보다 크면 총 레코드 수로 변경
		if(end > totalRecord) {
			end = totalRecord;
		}
		map.put("start", start); // 시작 레코드번호 map에 담음
		map.put("end", end); // 마지막 레코드번호 map에 담음
		m.addObject("list", place_infoService.listPlace_InfoPage(map));
		
		m.addObject("totalPage", totalPage);
		//페이지 그룹에서 사용되는 시작 페이지 번호 계산
		int startPage = (pageNUM - 1) / pageGroup * pageGroup + 1;
		//페이지 그룹에서 사용되는 마지막 페이지 번호 계산
		int endPage = startPage + pageGroup - 1;
		//마지막 페이지 번호가 총 페이지 수보다 크면 총 페이지 수로 변경
		if(endPage > totalPage) {
			endPage = totalPage;
		}
		// 검색창에 아무것도 없을 때
		m.addObject("startPage", startPage);
		m.addObject("endPage", endPage);
		m.addObject("place_type", place_type);
		m.addObject("sortColumn", sortColumn);

		// 검색창에 키워드가 있을때
		if(keyword != null && !keyword.equals("")) {
			m.addObject("searchColumn", "&searchColumn=" + searchColumn);//view에서 url에 이어 붙일 변수 넘겨주기
			m.addObject("keyword", "&keyword=" + keyword);
			// m.addObject("sortColumn", "&sortColumn=" + sortColumn);
		}
		// 정렬값이 있으면
		if(sortColumn != null && !sortColumn.equals("")) {
			m.addObject("sortColumn", "&sortColumn=" + sortColumn);		//view에서 url에 이어 붙일 변수 넘겨주기
		}
		// theme 여행장소 카테고리 리스트를 m에 담음
		m.addObject("pt", pt);
		return m;
	}
	
	// 여행장소번호가 x번인걸 눌렀을때 상세화면으로 이동
	@RequestMapping("/place/detailPlace_Info.do")
	public ModelAndView detailPlace_Info(int place_no, int place_type) {
		// 조회수 증가
		place_infoService.updateHit(place_no);
		
		Place_ThemeVo pt = place_themeService.getPlace_Theme(place_type);
		
		ModelAndView m = new ModelAndView();
		m.addObject("p", place_infoService.detailPlace_Info(place_no));
		m.addObject("place_type", pt); // 여행 장소 테마 리스트를 place_type란 이름으로 m에 담음
	
		m.addObject("place_no", place_no);
		m.addObject("mem_no", LoginUser.getMember_no()); // 로그인 한 번호를 mem_no로 지정하고, m에 담음
		
		Map map = new HashMap();
		map.put("place_no", place_no);
		map.put("mem_no", LoginUser.getMember_no()); // 로그인 한 번호를 mem_no로 지정하고, map에 담음
		// 찜 개수는 1개만 들어와야함
		int re = member_favoriteService.onlyOne(map);
		// 찜 개수가 성공적으로 들어왔으면 re는 1, 그렇지 않다면  re는 0
		m.addObject("re", re);
		return m;
	}
	
	// 상세화면에서 찜 제거
	@RequestMapping("/member/deleteDetailMember_Favorite.do")
	@ResponseBody
	public int deleteDetailMember_Favorite(int mem_no, int place_no) {
		Map map = new HashMap();
		// 회원 번호와 여행 장소 번호가 고려됨
		map.put("mem_no", mem_no);
		map.put("place_no", place_no);
		
		// 성공적으로 지워졌으면 re는 1, 그렇지 않다면 re는 0
		int re = member_favoriteService.deleteDetailPlace_Info(map);
		// model.addAttribute("re", re);
		return re;
	}
	
}