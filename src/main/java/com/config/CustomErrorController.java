package com.config;

import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
//https://eblo.tistory.com/50
@Controller
public class CustomErrorController implements ErrorController {
	@Override
	public String getErrorPath() {
		return "/error";
	}
	@RequestMapping(value="/error", method=RequestMethod.GET)
	public String handleError(HttpServletRequest request, Model model) {
		Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
		HttpStatus httpStatus = HttpStatus.valueOf(Integer.valueOf(status.toString()));
		model.addAttribute("code",  status.toString());
		model.addAttribute("msg", httpStatus.getReasonPhrase());
		model.addAttribute("timestamp", new Date());
		System.out.println("error : " + httpStatus);
		return "error/" + status.toString();	
		//return /error/error/; 로 하면
		//org.springframework.web.util.NestedServletException: Request processing failed; nested exception is org.springframework.security.web.firewall.RequestRejectedException: The request was rejected because the URL contained a potentially malicious String "//"
		//에러가 발생함.
		// /를 붙이는듯함.
		//return error/error"; 로 변경
		//https://okky.kr/article/520574
		
	}
}
