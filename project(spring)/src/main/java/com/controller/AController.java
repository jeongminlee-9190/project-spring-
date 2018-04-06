package com.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dto.AdminDTO;
import com.dto.MPageDTO;
import com.dto.NoticeDTO;
import com.dto.PageDTO;
import com.dto.SoPageDTO;
import com.service.AService;
import com.service.NoticeService;

@Controller
public class AController {
	@Autowired
	AService service;
	NoticeService nService;
	
	@RequestMapping(value= "/main_admin", method=RequestMethod.GET)
	public String main_admin() {
		return "main_admin";
	}
	
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
	
	/*@RequestMapping(value="/mNotice" , method=RequestMethod.GET)
	public ModelAndView mNotice(@RequestParam HashMap<String, String> map, @RequestParam(required=false, defaultValue="1") int curPage) {
		PageDTO pageDTO = nService.mNoticeList(map, curPage);
		ModelAndView mav = new ModelAndView();
		mav.addObject("pageDTO",pageDTO);
		mav.setViewName("admin/mNotice");
		return mav;
	}*/
	//휴면계정 리스트
	
	@RequestMapping(value="/mDormantList", method=RequestMethod.GET)
	public ModelAndView mDormantList(@RequestParam(required=false, defaultValue="1") int curPage) {
		MPageDTO mpageDTO = service.mDormantList(curPage);
		System.out.println(mpageDTO);
		System.out.println(mpageDTO.getCurPage());
		System.out.println(mpageDTO.getPerPage());
		System.out.println(mpageDTO.getTotalCnt());
		ModelAndView mav = new ModelAndView();
		mav.addObject("mpageDTO",mpageDTO);
		mav.setViewName("admin/mDormantList");
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
/*	
	@RequestMapping("/soList2")
	public ModelAndView soList2(ArrayList<Object> list) {
		ModelAndView mav = new ModelAndView();
		list = (ArrayList<Object>)service.soList2();
		mav.addObject("soList2",list);
		mav.setViewName("admin/soList2");
		return mav;
	}*/
	
	/*@RequestMapping(value="/changeSoLevel", method=RequestMethod.GET)
	public String changeSoLevel(@RequestParam HashMap<String, String> map, HttpSession session) {
		service.changeSoLevel(map);
		ArrayList<Object> list = (ArrayList<Object>)service.soList2();
		session.setAttribute("soList2",list);
		return "redirect:soList2";
	}*/
	
	@RequestMapping(value="/SoDormantList", method=RequestMethod.GET)
	public ModelAndView SoDormantList(@RequestParam(required=false, defaultValue="1") int curPage) {
		SoPageDTO sopageDTO=service.soDormantList(curPage);
		ModelAndView mav = new ModelAndView();
		mav.addObject("sopageDTO",sopageDTO);
		mav.setViewName("admin/SoDormantList");
		return mav;
	}
}
