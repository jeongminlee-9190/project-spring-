package com.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dto.AdminDTO;
import com.dto.MemberDTO;
import com.service.AService;

@Controller
public class AController {
	@Autowired
	AService service;
	
	@RequestMapping(value= "/adminLogin", method=RequestMethod.POST)
	public String adminLogin(@RequestParam HashMap<String, String> map, HttpSession session) {
		AdminDTO dto = service.login(map);
		
		String nextPage = null;
		if(dto==null) {
			nextPage= "index_admin";
		}else {
			session.setAttribute("adminLogin", dto);
			nextPage="main_admin";
		}
		return nextPage;
	}
	
	@RequestMapping("/adminLogout")
	public String adminLogout(HttpSession session,HttpServletRequest request) {
		session.invalidate();
		request.setAttribute("adminLogout", "로그아웃 되었습니다.");
		return "index_admin";
	}
	
	@RequestMapping("/memberList")
	public ModelAndView memberList(ArrayList<Object> list) {
		ModelAndView mav = new ModelAndView();
		list = (ArrayList<Object>)service.memberList();
		mav.addObject("memberList",list);
		mav.setViewName("admin/memberList");
		return mav;
	}
	
	@RequestMapping("/soList")
	public ModelAndView soList(ArrayList<Object> list) {
		ModelAndView mav = new ModelAndView();
		list = (ArrayList<Object>)service.soList();
		mav.addObject("soList",list);
		mav.setViewName("admin/soList");
		return mav;
	}
	
	@RequestMapping("/soList2")
	public ModelAndView soList2(ArrayList<Object> list) {
		ModelAndView mav = new ModelAndView();
		list = (ArrayList<Object>)service.soList();
		mav.addObject("soList",list);
		mav.setViewName("admin/soList2");
		return mav;
	}
	
	@RequestMapping(value="/changeSoLevel", method=RequestMethod.GET)
	public String changeSoLevel(@RequestParam HashMap<String, String> map, HttpSession session) {
		System.out.println(map);
		service.changeSoLevel(map);
		ArrayList<Object> list = (ArrayList<Object>)service.soList();
		session.setAttribute("soList",list);
		return "redirect:soList";
	}
	
	
}
