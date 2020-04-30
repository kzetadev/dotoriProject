package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.Place_InfoDao;
@Controller
public class Place_InfoController {
	@Autowired
	private Place_InfoDao p_dao;

	public void setP_dao(Place_InfoDao p_dao) {
		this.p_dao = p_dao;
	}
	@RequestMapping("/listPlace_Info")
	public ModelAndView listPlace_Info() {
		System.out.println("컨트롤러 동작함");
		ModelAndView m = new ModelAndView();
		m.setViewName("listPlace_Info");
		m.addObject("list", p_dao.listPlace_Info());
		return m;
	}
}
