package com.mypage.controller;

import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.PagingUtil;
import com.member.service.LoginService;
import com.member.service.MyPage_MainService;
import com.member.service.MyPage_commentService;
import com.member.vo.Member_InfoVo;
import com.member.vo.Member_MessageListVo;
import com.member.vo.Member_MessageVo;
import com.member.vo.MyPage_CommentVo;
import com.member.vo.MyPage_PostVo;
import com.security.config.LoginUser;
import com.security.config.UserDetailsServiceImpl;

@Controller
public class MyPageController {
	
	Logger logger = Logger.getLogger(this.getClass());
	@Autowired
	UserDetailsServiceImpl userDetailsServiceImpl;		//비밀번호 변경 후 인증에 사용하는 빈
	@Autowired
	PasswordEncoder passwordEncoder;					//비밀번호 변경 시 비밀번호 암호화에 사용하는 빈
	
	@Resource(name="loginService")
	private LoginService loginService;
	@Inject
	LoginService memberservice; //서비스를 호출하기 위해 의존성 투입

	@Resource(name="myPage_commentService")
	private MyPage_commentService myPage_commentService;
	@Resource(name="mypage_mainService")
	private MyPage_MainService mypage_mainService;
	//게시판 목록에서 닉네임을 클릭했을때 출력되는 레이어의 쪽지보내기 버튼을 클릭했을 때 요청되는 url
	//게시판 목록에서 모달창으로 출력됨.
	@RequestMapping(value="/member/sendMessage.do", method=RequestMethod.GET)
	public String sendMessage(int mem_no, String mem_nickname,  Model model) {
						//mem_no : 쪽지를 보낼 대상의 mem_no	mem_nickname : 쪽지를 보낼 대상의 mem_nickname
		if (LoginUser.isLogin()) {
			model.addAttribute("mem_no", mem_no);
			model.addAttribute("sendNick", mem_nickname);
			return "/member/sendMessage";
		}
		return "redirect:/member/login";
	}
	//쪽지보내기 모달창에서 입력한 쪽지내용으로 쪽지 발송(저장)
	@RequestMapping(value="/member/sendMessage.do", method=RequestMethod.POST)
	@ResponseBody
	public int sendMessage(Member_MessageVo vo) {
		int re = -1;
		vo.setMem_no(LoginUser.getMember_no());				//발신 회원번호
		vo.setPost_from(LoginUser.getMember_no());			//발신 회원번호
		System.out.println(vo);
		re = myPage_commentService.sendMessage(vo);
		return re;
	}
	//쪽지보내기 모달창에서 입력한 쪽지내용으로 쪽지 발송(저장)
	@RequestMapping(value="/member/sendReplyMessage.do", method=RequestMethod.POST)
	@Transactional
	@ResponseBody
	public int sendReplyMessage(Member_MessageVo vo) {
		int re = -1;
		vo.setMem_no(LoginUser.getMember_no());				//발신 회원번호
		vo.setPost_from(LoginUser.getMember_no());			//발신 회원번호
		System.out.println(vo);
		re = myPage_commentService.messageReply(vo.getPost_ref_no());	//수신 쪽지에 답장 여부 저장
		re = myPage_commentService.sendMessage(vo);
		return re;
	}
	//마이페이지에서 수신 쪽지를 클릭했을 때 요청되는 url
	//마이페이지에서 모달창으로 출력됨.
	@RequestMapping(value="/member/myPage_MessageDetail.do", method=RequestMethod.GET)
	@Transactional
	public String messageDetail(int post_no, int mem_no, String msg_type, Model model) {
					//post_no : 클릭한 쪽지번호			mem_no : 보낸사람의 mem_no			msg_type : 쪽지 구분. send - 발신	receive - 수신 
		Map map = new HashMap();
		System.out.println("/member/myPage_MessageDetail.do post_no : " + post_no + "\tmem_no : " + mem_no + "\tmsg_type : " + msg_type);
		map.put("post_no", post_no);
		map.put("mem_no", LoginUser.getMember_no());
		map.put("msg_type", msg_type);
		if(msg_type.equals("receive")) {
			myPage_commentService.messageRead(post_no);				//수신 쪽지인 경우 읽음 처리
		}
		model.addAttribute("message", myPage_commentService.messageDetail(map));		//수신 쪽지 조회
		System.out.println(myPage_commentService.messageDetail(map));
		model.addAttribute("mem_no", mem_no);
		model.addAttribute("msg_type", msg_type);
		return "/member/myPage_MessageDetail";
	}
	
	//내가 쓴 글 & 댓글
	//mem_no가 0이면 로그인한 회원. 0이 아니면 다른 회원의 마이페이지
	//content_type : board - 게시판	comment : 댓글
	@RequestMapping(value = "/member/myPage_Contents.do", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request
			, @RequestParam(name="mem_no", defaultValue="0")int mem_no
			, @RequestParam(name="content_type", defaultValue="board")String content_type
			, @RequestParam(name="pageNum", defaultValue="1")int pageNum) throws Exception{
		ModelAndView mav = new ModelAndView();
		logger.info("list");
		//다른 회원의 마이페이지인 경우 other_mem_no라는 키와 값 전달
		if(mem_no != 0 && mem_no != LoginUser.getMember_no()) {
			mav.addObject("other_mem_no", mem_no);
			mav.addObject("other_mem_no_str", "&mem_no=" + mem_no);
		}else if(LoginUser.isLogin()) {			//로그인한 회원
			mem_no = LoginUser.getMember_no();
		}
		int totalRecord = 0;
		int pageSize = 10;
		int pageGroup = 10;
		//작성한 글 총 레코드 카운트
		if(content_type.equals("board")) {
			totalRecord = myPage_commentService.list_post_count(mem_no);
		}else {//작성한 댓글 총 레코드 카운트
			totalRecord = myPage_commentService.list_comment_count(mem_no);
		}
		Map map = null;
		map = PagingUtil.pager(pageNum, totalRecord, pageSize, pageGroup);
		map.put("mem_no", mem_no);
		//작성글 목록 전달
		if(content_type.equals("board")) {
			List<MyPage_PostVo> list_post = myPage_commentService.list_post(map);
			mav.addObject("list", list_post);
		}else {	//작성 댓글 목록 전달
			List<MyPage_CommentVo> list = myPage_commentService.list(map);
			mav.addObject("list", list);
		}
		mav.addObject("content_type", content_type);
		mav.addObject("content_type_str", "content_type=" + content_type);	//페이지 이동 시 이어 붙일 파라미터 문자열 전달
		mav.addObject("start_page", map.get("start_page"));					//시작 페이지
		mav.addObject("end_page", map.get("end_page"));						//마지막 페이지
		mav.addObject("page_num", pageNum);									//현재 페이지 번호
		mav.addObject("total_page", map.get("total_page"));					//총 페이지 카운트
		
		return mav;
	}
	
	//내가 쓴 댓글 목록
	@RequestMapping(value = "/member/myPage_Comment.do", method = RequestMethod.GET)
	public String list(Model model) throws Exception{
		logger.info("list");
		int mem_no = 0;
		//로그인한 회원 번호 가져오기
		if(LoginUser.isLogin()) {
			mem_no = LoginUser.getMember_no();
		}
		Map map = null;
		model.addAttribute("list", myPage_commentService.list(map));
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
		Map map = null;
		model.addAttribute("list_post", myPage_commentService.list_post(map));
		return "member/myPage_Contents";
	}
  //회원정보 수정을 클릭하면 비밀번호 입력창으로 넘어감
	@RequestMapping("/member/myPage_updateMem.do")
	public String updateMemGet() {
		return "/member/pwdCheck";
	}
	
	//회원 정보 수정화면에서 비밀번호 일치 여부 확인하는 메소드
	@RequestMapping(value = "/member/pwdCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public int pwdCheck(String mem_pwd) {
		int re = 0;
		if (passwordEncoder.matches(mem_pwd, LoginUser.getMember_InfoVo().getMem_pwd())) {// 로그인 된 회원의 정보를 갖고 와야
																							// 됨//mem_pwd와 LoginUser의
																							// getMem_pwd가 같은지 매치
			re = 1;
		}
		return re;
	}
	//회원정보 수정 폼으로 이동
	@RequestMapping("/member/updateMemForm.do")
	public String updateMemForm(Model model) {
		model.addAttribute("update", loginService.loginById(LoginUser.getMember_InfoVo().getMem_id()));
		return "/member/updateMem";
	}
	//회원정보 수정 화면에서 수정 버튼 클릭 후 동작하는 메소드
	@RequestMapping(value = "/member/updateMem.do", method = RequestMethod.POST)
	@ResponseBody
	public int updateMem(Model model,  Member_InfoVo vo, HttpServletRequest request) {
		int re = -1;
		re = myPage_commentService.updateMem(vo);
		String oldFname = vo.getMem_img();
		String fname = null;
		//프로필 이미지 변경
		String path = request.getRealPath("member_img");
		MultipartFile uploadFile = vo.getUploadFile();
		//이미지가 변경되었으면
		if(uploadFile != null) {
			fname = uploadFile.getOriginalFilename();			//이미지 파일명
			if(fname != null && !fname.equals("")) {
				vo.setMem_img("/member_img/" + fname);			//파일 경로 저장
				try {
					byte[]data = uploadFile.getBytes();
					FileOutputStream fos = new FileOutputStream(path + "/"+ fname);
							fos.write(data);					//member/img 폴더에 이미지 저장
				} catch (Exception e) {
					System.out.println("예외 발생" + e.getMessage());
				}
			}
		}
		
		return re;
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
	///mem_no가 0이면 로그인한 회원. 0이 아니면 다른 회원
	@RequestMapping("/member/myPage_Message.do")
	public ModelAndView myPage_Message(@RequestParam(name="msg_type", defaultValue="send")String msg_type
			, @RequestParam(name="mem_no", defaultValue="0")int mem_no
			, @RequestParam(name="pageNum", defaultValue="1")int pageNum) {
		ModelAndView m = new ModelAndView();
		System.out.println("/member/myPage_Message.do " + msg_type);
		int pageSize = 10;
		int pageGroup = 10;
		int totalRecord = 0;
		if(mem_no != 0) {
			m.addObject("other_mem_no", mem_no);
			m.addObject("other_mem_no_str", "&mem_no=" + mem_no);
		}else if(LoginUser.isLogin()) {
			mem_no = LoginUser.getMember_no();
		}
		List<Member_MessageListVo> msgList = null;
		Map map = null;
		//발신 쪽지의 레코드 카운트 가져오기
		if(msg_type.equals("send")) {
			totalRecord = myPage_commentService.sendMsgRecordcount(mem_no);
			map = PagingUtil.pager(pageNum, totalRecord, pageSize, pageGroup);
			map.put("mem_no", mem_no);
			msgList = myPage_commentService.sendMsgList(map);
		}else {	//수신 쪽지의 레코드 카운트 가져오기
			totalRecord = myPage_commentService.receiveMsgRecordcount(mem_no);
			map = PagingUtil.pager(pageNum, totalRecord, pageSize, pageGroup);
			map.put("mem_no", mem_no);
			msgList = myPage_commentService.receiveMsgList(map);
		}
		m.addObject("msg_type_str", "&msg_type=" + msg_type);
		m.addObject("msg_type", msg_type);
		m.addObject("msgList", msgList);
		m.addObject("start_page", map.get("start_page"));
		m.addObject("end_page", map.get("end_page"));
		m.addObject("page_num", pageNum);
		m.addObject("total_page", map.get("total_page"));
		
//		m.addObject("sendMsg", myPage_commentService.sendMsgList(mem_no));
//		m.addObject("receiveMsg", myPage_commentService.receiveMsgList(mem_no));
		return m;
	}
	//비밀번호 변경 폼으로 이동
	@RequestMapping(value="/member/pwd_update.do", method=RequestMethod.GET)
	public void pwd_update() {
		
	}
	//기존 비밀번호 일치 여부 확인 메소드
	@RequestMapping(value="/member/oldPassCheck.do", method=RequestMethod.POST)
	@ResponseBody
	public int oldPassCheck(String mem_pwd) {
		int re = -1;
		System.out.println("mem_pwd : " + mem_pwd);
		Member_InfoVo vo = LoginUser.getMember_InfoVo();
		//기존 비밀번호가 일치하면
		if(passwordEncoder.matches(mem_pwd, vo.getMem_pwd())) {
			re = 1;
		}
		
		System.out.println("/member/oldPassCheck.do " + re);
		return re;
	}
	//변경할 비밀번호로 비밀번호 변경하는 메소드
	@RequestMapping(value="/member/pass_update.do", method=RequestMethod.POST)
	@ResponseBody
	public int pass_update(String mem_pwd) throws Exception {
		int re = -1;
		
		System.out.println("update mem_pwd : " + mem_pwd);
		Member_InfoVo vo = LoginUser.getMember_InfoVo();
		String encode_passwod = passwordEncoder.encode(mem_pwd);
		vo.setMem_pwd(encode_passwod);

		//값을 여러개 담아야 하므로 해쉬맵을 사용해서 값을 저장함
		
		Map<String, Object> map = new HashMap<>();

		// map.put("mem_email", vo.getMem_email());
		map.put("mem_pwd", vo.getMem_pwd());
		map.put("mem_email", vo.getMem_email());
		//비밀번호 변경
		re = memberservice.pass_change(map);
		//memebr_info테이블에서 다시 조회
		vo = loginService.loginById(vo.getMem_id());
		//사용자 인증 다시 시도
		userDetailsServiceImpl.loadUserByUsername(vo.getMem_id());
		
		return re;
	}
	
	// 마이페이지 메인
	@RequestMapping("/member/myPage.do")
	public ModelAndView myPage_Main(@RequestParam(name="mem_no", defaultValue="0")int mem_no) {
		System.out.println("마이페이지 메인 컨트롤러");
		
		ModelAndView m = new ModelAndView();
		logger.info("list");
		if(mem_no != 0 && mem_no != LoginUser.getMember_no()) {
			m.addObject("other_mem_no", mem_no);
		}else if(LoginUser.isLogin()) {
			mem_no = LoginUser.getMember_no();
		}
		m.addObject("main", mypage_mainService.myPage_Main(mem_no));
		System.out.println("마이페이지 메인 컨트롤러");
		return m;
	}
}
