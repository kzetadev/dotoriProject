package com.mypage.controller;

import java.io.FileOutputStream;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.member.service.LoginService;
import com.member.service.MyPage_MainService;
import com.member.service.MyPage_commentService;
import com.member.vo.Member_InfoVo;
import com.member.vo.Member_MessageVo;
import com.member.vo.MyPage_CommentVo;
import com.member.vo.MyPage_PostVo;
import com.security.config.LoginUser;

@Controller
public class MyPageController {
	
	Logger logger = Logger.getLogger(this.getClass());

	@Autowired
	PasswordEncoder passwordEncoder;
	
	@Resource(name="loginService")
	private LoginService loginService;

	@Resource(name="myPage_commentService")
	private MyPage_commentService myPage_commentService;
	@Resource(name="mypage_mainService")
	private MyPage_MainService mypage_mainService;
	@RequestMapping(value="/member/sendMessage.do", method=RequestMethod.GET)
	public String sendMessage(int mem_no, String mem_nickname,  Model model) {
		if (LoginUser.isLogin()) {
			model.addAttribute("mem_no", mem_no);
			model.addAttribute("sendNick", mem_nickname);
			return "/member/sendMessage";
		}
		return "redirect:/member/login";
	}
	@RequestMapping(value="/member/sendMessage.do", method=RequestMethod.POST)
	@ResponseBody
	public int sendMessage(Member_MessageVo vo) {
		int re = -1;
		vo.setMem_no(LoginUser.getMember_no());
		vo.setPost_from(LoginUser.getMember_no());
		System.out.println(vo);
		re = myPage_commentService.sendMessage(vo);
		return re;
	}
	//내가 쓴 글 & 댓글
	@RequestMapping(value = "/member/myPage_Contents.do", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		logger.info("list");
		int mem_no  = 0;
		if(LoginUser.isLogin()) {
			mem_no = LoginUser.getMember_no();
		}
		List<MyPage_PostVo> list_post = myPage_commentService.list_post(mem_no);
		mav.addObject("list_post", list_post);
		List<MyPage_CommentVo> list = myPage_commentService.list(mem_no);
		mav.addObject("list", list);
		return mav;
	}
	
	//내가 쓴 댓글 목록
	@RequestMapping(value = "/member/myPage_Comment.do", method = RequestMethod.GET)
	public String list(Model model) throws Exception{
		logger.info("list");
		int mem_no = 0;
		if(LoginUser.isLogin()) {
			mem_no = LoginUser.getMember_no();
		}
		model.addAttribute("list", myPage_commentService.list(mem_no));
		return "member/myPage_Contents";
	}
	
	//내가 쓴 글 목록
	@RequestMapping(value = "/member/myPage_Post.do", method = RequestMethod.GET)
	public String list_post(Model model) throws Exception{
		logger.info("list");
		int mem_no = 0;
		if(LoginUser.isLogin()) {
			mem_no = LoginUser.getMember_no();
		}
		model.addAttribute("list_post", myPage_commentService.list_post(mem_no));
		return "member/myPage_Contents";
	}
  //회원정보 수정을 클릭하면 비밀번호 입력창으로 넘어감
	@RequestMapping("/member/myPage_updateMem.do")
	public String updateMemGet() {
//		myPage_commentService.updateMem();
		return "/member/pwdCheck";
	}

	@RequestMapping(value = "/member/pwdCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public int pwdCheck(String mem_pwd) {
//		String mem_pwd = request.getParameter("mem_pwd");
		int re = 0;
		if (passwordEncoder.matches(mem_pwd, LoginUser.getMember_InfoVo().getMem_pwd())) {// 로그인 된 회원의 정보를 갖고 와야
																							// 됨//mem_pwd와 LoginUser의
																							// getMem_pwd가 같은지 매치
			re = 1;
		}
		return re;
	}
	//회원가입 수정 폼으로 이동
	@RequestMapping("/member/updateMemForm.do")
	public String updateMemForm(Model model) {
		model.addAttribute("update", loginService.loginById(LoginUser.getMember_InfoVo().getMem_id()));
		return "/member/updateMem";
	}
	
	@RequestMapping(value = "/member/updateMem.do", method = RequestMethod.POST)
	@ResponseBody
	public int updateMem(Model model, Member_InfoVo vo, HttpServletRequest request) {
		int re = -1;
		re = myPage_commentService.updateMem(vo);
		String oldFname = vo.getMem_img();
		String fname = null;
		
		String path = request.getRealPath("img");
		MultipartFile uploadFile = vo.getUploadFile();
		if(uploadFile != null) {
			fname = uploadFile.getOriginalFilename();
			if(fname != null && !fname.equals("")) {
				vo.setMem_img(fname);
				try {
					byte[]data = uploadFile.getBytes();
					FileOutputStream fos = new FileOutputStream(path + "/"+ fname);
							fos.write(data);
				} catch (Exception e) {
					System.out.println("예외 발생" + e.getMessage());
					// TODO: handle exception
				}
			}
		}
		
		return re;
//		boolean re = myPage_commentService.checkPwd(vo.getMem_id(), vo.getMem_pwd());
//		if (re) { // 비밀번호가 일치할 경우 수정 처리후, 마이페이지로 리다렉
//			myPage_commentService.updateMem(vo);
//			return "redirect:/myPage/myPage_update.do";
//		} else {// 비밀번호가 일치하지 않는 경우, div에 불일치 문구 출력
//			model.addAttribute("vo", vo);
//			model.addAttribute("message", "비밀번호 불일치");
//			return "member/myPage";
//		}
	}

//회원정보 삭제 처리
	@RequestMapping("/member/delMem.do")
	public String delMem(@RequestParam String mem_id, @RequestParam String mem_pwd, Model model) {
		// 비밀번호 체크
		boolean re = myPage_commentService.checkPwd(mem_id, mem_pwd);
		if (re) { // 비밀번호가 맞다면 삭제처리후, 로그인 화면으로 이동
			myPage_commentService.delMem(mem_id);
			return "redirect:/member/login.do";

		} else { // 비밀번호가 일치하지 않으면, div에 불일치 문구 출력
			model.addAttribute("message", "비밀번호 불일치");
			return "member/myPage";

		}
	}

	// 내가 받은 쪽지 목록
	@RequestMapping("/member/myPage_Message.do")
	public ModelAndView myPage_Message() {
		ModelAndView m = new ModelAndView();
		int mem_no = LoginUser.getMember_no();
		m.addObject("sendMsg", myPage_commentService.sendMsgList(mem_no));
		return m;
	}
	
	// 마이페이지 메인
	@RequestMapping("/member/myPage.do")
	public ModelAndView myPage_Main() {
		System.out.println("마이페이지 메인 컨트롤러");
		int mem_no = 0;
		ModelAndView m = new ModelAndView();
		logger.info("list");
		if(LoginUser.isLogin()) {
			mem_no = LoginUser.getMember_no();
		}
		m.addObject("main", mypage_mainService.myPage_Main(mem_no));
		System.out.println("마이페이지 메인 컨트롤러");
		return m;
	}
	
}
