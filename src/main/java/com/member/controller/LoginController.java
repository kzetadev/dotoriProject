package com.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.member.service.JoinService;
import com.member.service.LoginService;
import com.member.vo.Member_InfoVo;

@Controller
public class LoginController {
	
	@Inject
	JavaMailSender mailSender; //메일 서비스를 사용하기 위해 의존성 주입
	
	@Inject
	LoginService memberservice; //서비스를 호출하기 위해 의존성 투입
	@Autowired
	PasswordEncoder passwordEncoder;
	@Resource(name="loginService")
	private LoginService loginService;
	@RequestMapping("/member/loginCheck.do")
	public Member_InfoVo loginCheck(HttpServletRequest request, Member_InfoVo vo) {
		System.out.println(vo);
		Member_InfoVo infovo = loginService.login(vo);
		System.out.println(infovo);
		return infovo;
	}
	
	@RequestMapping("/member/login.do")
	public void login(HttpServletRequest request) {
		
	}
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	public ModelAndView login(@RequestParam(value="error",required = false)String error,
			@RequestParam (value="logout",required =false)String logout) {
		ModelAndView mav = new ModelAndView();
		System.out.println("asd");
		if(error != null) {
			mav.addObject("error", "아이디와 비밀번호를 다시 확인해주세요");
		}
		if(logout != null){
			mav.addObject("msg", "로그아웃 완료");
		}
		// mav.setViewName("login");
		
		return mav;
	}
	//아이디 찾기 페이지로 이동
	@RequestMapping(value="/member/findMem_id.do",method = RequestMethod.GET)
	public String findMem_id(HttpServletRequest request) {
		return "/member/find_mem_id";
	}
	
	//비밀번호 찾기 페이지로 이동
	@RequestMapping(value="/member/findMem_pwd.do", method = RequestMethod.GET)
	public String findMem_pwd(HttpServletRequest request) {
		return "/member/find_mem_pwd";
	}
//	@RequestMapping(value="/member/find_id_result.do", method = RequestMethod.GET)
//	
//	public String id_result(HttpServletRequest request, String mem_id, Model model) {
//		model.addAttribute("mem_id", mem_id);
//		return "/member/find_id_result";
//		
//	}
	//아이디 찾기 처리
	@RequestMapping(value="/member/find_id.do", method = RequestMethod.POST)
	@ResponseBody
	public String find_id(HttpServletRequest request, String mem_email) {
		ModelAndView mav = new ModelAndView();
		Member_InfoVo vo = new Member_InfoVo();
		System.out.println("mem_email : " + mem_email);
		
		//vo에 이메일 값을 저장해서 그 이메일값을 사용해서 아이디를 검색
		vo.setMem_email(mem_email);
		String mem_id = memberservice.find_idCheck(vo);
		System.out.println("mem_id : " + mem_id);
//		if (mem_id != null) {
//			mav.setViewName("/member/find_id_result");
//			mav.addObject("mem_id", mem_id);
//		}else {
			//아이디 찾기 실패
//			mav.setViewName("/member/find_mem_id");
//			System.out.println("getViewName : " + mav.getViewName());
//			mav.addObject("message", "없는 이메일 입니다");
//		}
//		if(mem_id == null) {
//			mem_id = "";
//		}
		return mem_id;
	}
	
	
	//비밀번호 찾기 처리(이메일 발송)
	@RequestMapping(value="/member/find_pass.do", method=RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public int find_pass(HttpServletRequest request, String mem_id, String mem_email, HttpServletResponse response_email) throws IOException{
		//랜덤 난수(인증번호)를 생성해서 이메일로 보내고 그 인증번호를 입력하면 비밀번호을 변경할 수 있는 페이지로 이동시킴
		
		Member_InfoVo vo = loginService.loginById(mem_id);
		if(vo == null || !vo.getMem_email().equals(mem_email) ) {
			
			return 0;
		}
		
		Random r = new Random();
		int dice = r.nextInt(157211)+48271;
		int re = 0;
		String setFrom = "kzeta@naver.com";
		String tomail = request.getParameter("mem_email");//받는 사람의 이메일
		String title = "비밀번호 찾기 인증 이메일입니다"; //제목
		String content =
				System.getProperty("line.separator")+
				System.getProperty("line.separator")+
				"안녕하세요 회원님"
				+System.getProperty("line.separator")+
				System.getProperty("line.separator")+
				"비밀번호 찾기 인증번호는" + dice + "입니다"+
				System.getProperty("line.separator")+
				System.getProperty("line.separator")+
				"받으신 인증번호를 홈페이지에 입력해주십시오"; //내용
				
				try {
					MimeMessage message = mailSender.createMimeMessage();
					MimeMessageHelper messgeHelper = new MimeMessageHelper(message, true, "UTF-8");
					
					messgeHelper.setFrom(setFrom);//보내는 사람을 생략하면 정상작동 불가
					messgeHelper.setTo(tomail);//받는 사람 이메일
					messgeHelper.setSubject(title); //메일제목은 생략 가능
					messgeHelper.setText(content); //메일 내용
					
					mailSender.send(message);
					vo.setMem_check_code(dice);
					
					
					re = loginService.updateCode(vo);//업데이트를 실행 해줘야 함
					
				} catch (Exception e) {
					System.out.println(e);
					// TODO: handle exception
				}
				

//				String re = "";
//				Map map = new HashMap();
//				map.put("dice", dice);
//				map.put("mem_email", mem_email);
//				Gson gson = new Gson();
//				re = gson.toJson(map);
//				System.out.println(re);
				return re;
	}
		
	
		@RequestMapping(value="/member/pass_email.do", method = RequestMethod.GET)
		public ModelAndView getEmail(HttpServletRequest request, String mem_id) {
			ModelAndView mav = new ModelAndView();
			mav.addObject("mem_id", mem_id);
			
			
			return mav;
			
		}
	
		//인증번호를 입력한 후에 확인 버튼을 누르면 자료가 넘어오는 컨트롤러
		@RequestMapping(value="/member/pass_injeung.do {mem_id}", method = RequestMethod.POST)	
		public ModelAndView pass_injeung(HttpServletRequest request, int pass_injeung, @PathVariable String mem_id,HttpServletResponse response_equals) throws IOException{
			System.out.println("마지막 : pass_injeung : " + pass_injeung);
			
			
			ModelAndView mav = new ModelAndView();
			
			Member_InfoVo vo = loginService.loginById(mem_id);
			System.out.println("마지막 : check_code :" + vo.getMem_check_code() );
			
			
			if (pass_injeung == vo.getMem_check_code()) {
				
				//만약 인증번호가 같다면 이메일을 비밀번호 변경 페이지로 넘기고, 활용할 수 있도록
				
				mav.setViewName("/member/pass_change");
				mav.addObject("member" , vo);
				System.out.println(vo);
				response_equals.setContentType("text/html; charset=UTF-8");
				PrintWriter out_equals = response_equals.getWriter();
				out_equals.println("<script>alert('인증번호가 일치하였습니다. 비밀번호 변경창으로 이동합니다.');</script>");
				out_equals.flush();
				
				return mav;
			}else {
				ModelAndView mav2 = new ModelAndView();
				mav2.setViewName("/member/find_mem_id");
				
				response_equals.setContentType("text/html; charset=UTF-8");
				PrintWriter out_equals = response_equals.getWriter();
				out_equals.println("<script>alert('인증번호가 일치하지않습니다. 인증번호를 다시 입력해주세요.'); history.go(-1);</script>");
				out_equals.flush();
				
				return mav2;
			}
			
		}
		//변경할 비밀번호를 입력한 후에 확인 버튼을 누르면 넘어오는 컨트롤러
		@RequestMapping(value = "/member/pass_change.do {mem_email}", method = RequestMethod.POST)
		public String pass_change(HttpServletRequest request,String mem_pwd,  @PathVariable String mem_email, Member_InfoVo vo, HttpServletResponse pass) throws Exception{
	//	String mem_pwd = request.getParameter("mem_pwd");
		System.out.println("컨트롤러 동작");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/member/pass_change");
		mav.addObject("mem_email", loginService.loginById(mem_email));
		
		//String mem_email1 = mem_email;

		vo.setMem_email(mem_email);
		String encode_passwod = passwordEncoder.encode(mem_pwd);
		vo.setMem_pwd(encode_passwod);

		//값을 여러개 담아야 하므로 해쉬맵을 사용해서 값을 저장함
		
		Map<String, Object> map = new HashMap<>();

		// map.put("mem_email", vo.getMem_email());
		map.put("mem_pwd", vo.getMem_pwd());
		map.put("mem_email", mem_email);

		memberservice.pass_change(map, vo);
		
		//ModelAndView mav = new ModelAndView();
		
		//mav.setViewName("/member/find_pwd_result");
		
		return mem_email;
		}
}
