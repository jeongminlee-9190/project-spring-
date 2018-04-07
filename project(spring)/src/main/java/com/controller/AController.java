package com.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dto.AdminDTO;
import com.dto.MPageDTO;
import com.dto.SPageDTO;
import com.dto.SoPageDTO;
import com.service.AService;
import com.service.NoticeService;

@Controller
public class AController {
	@Autowired
	AService service;
	NoticeService nService;
	
	@RequestMapping(value= "/main_admin", method=RequestMethod.GET)
	public String main_admin(HttpSession session) {
		int soList2TotalCount = service.soList2TotalCount();
		session.setAttribute("soList2TotalCount", soList2TotalCount);
		int mListTotalCount = service.mListTotalCount();
		session.setAttribute("mListTotalCount", mListTotalCount);
		int soListTotalCount = service.soListTotalCount();
		session.setAttribute("soListTotalCount", soListTotalCount);
		int sListTotalCount = service.sListTotalCount();
		session.setAttribute("sListTotalCount", sListTotalCount);
		int mDormantListTotalCount = service.mDormantListTotalCount();
		session.setAttribute("mDormantListTotalCount", mDormantListTotalCount);
		int soDormantListTotalCount = service.soDormantListTotalCount();
		session.setAttribute("soDormantListTotalCount", soDormantListTotalCount);
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
			nextPage="redirect:main_admin";
		}
		return nextPage;
	}
	
	@RequestMapping("/adminLogout")
	public String adminLogout(HttpSession session,HttpServletRequest request) {
		session.invalidate();
		request.setAttribute("adminLogout", "로그아웃 되었습니다.");
		return "index_admin";
	}
	
	@RequestMapping(value="/mList",method=RequestMethod.GET)
	public ModelAndView mList(@RequestParam HashMap<String, String> map, @RequestParam(required=false, defaultValue="1") int curPage,
			HttpServletRequest request) {
		MPageDTO mpageDTO = service.mList(map, curPage);
		ModelAndView mav = new ModelAndView();
		mav.addObject("mListpageDTO",mpageDTO);
		mav.setViewName("admin/mList");
		String searchName = map.get("searchName");
		String searchValue = map.get("searchValue");
		request.setAttribute("searchName", searchName);
		request.setAttribute("searchValue", searchValue);
		return mav;
	}
	
	
	//휴면계정 리스트	
	@RequestMapping(value="/mDormantList", method=RequestMethod.GET)
	public ModelAndView mDormantList(@RequestParam(required=false, defaultValue="1") int curPage) {
		MPageDTO mpageDTO = service.mDormantList(curPage);
		ModelAndView mav = new ModelAndView();
		mav.addObject("mpageDTO",mpageDTO);
		mav.setViewName("admin/mDormantList");
		return mav;
	}
	
	@RequestMapping(value="/mDormantDel" , method=RequestMethod.GET)
	public String mDormantDel(@RequestParam String mId) {
		service.mDormantDel(mId);
		return "redirect:mDormantList";
	}
	
	@RequestMapping("/soList")
	public ModelAndView soList(@RequestParam HashMap<String, String> map, @RequestParam(required=false, defaultValue="1") int curPage,
			HttpServletRequest request) {
		SoPageDTO sopageDTO = service.soList(map, curPage);
		ModelAndView mav = new ModelAndView();
		mav.addObject("soListpageDTO",sopageDTO);
		mav.setViewName("admin/soList");
		String searchName = map.get("searchName");
		String searchValue = map.get("searchValue");
		request.setAttribute("searchName", searchName);
		request.setAttribute("searchValue", searchValue);
		return mav;
	}

	@RequestMapping(value="/SoDormantList", method=RequestMethod.GET)
	public ModelAndView SoDormantList(@RequestParam(required=false, defaultValue="1") int curPage) {
		SoPageDTO sopageDTO=service.soDormantList(curPage);
		ModelAndView mav = new ModelAndView();
		mav.addObject("sopageDTO",sopageDTO);
		mav.setViewName("admin/SoDormantList");
		return mav;
	}
	
	@RequestMapping(value="/soDormantDel" , method=RequestMethod.GET)
	public String soDormantDel(@RequestParam String soId) {
		service.soDormantDel(soId);
		return "redirect:SoDormantList";
	}

	@RequestMapping("/soList2")
	public ModelAndView soList2(ArrayList<Object> list) {
		ModelAndView mav = new ModelAndView();
		list = (ArrayList<Object>)service.soList2();
		mav.addObject("soList2",list);
		mav.setViewName("admin/soList2");
		return mav;
	}
	
	
	@RequestMapping(value="/soApprove", method=RequestMethod.GET)
	public String changeSoLevel(@RequestParam HashMap<String, String> map, HttpSession session) {
		String soId = map.get("soId");
		service.soApprove(soId);
		return "redirect:soList2";
	}
	
	@RequestMapping(value = "/sList", method=RequestMethod.GET)
	public String sList(@RequestParam HashMap<String, String> map, @RequestParam(required=false, defaultValue="1") int curPage,
			HttpSession session) {
		SPageDTO spageDTO = new SPageDTO();
		spageDTO = service.sList(map, curPage);
		session.setAttribute("sListpageDTO", spageDTO);		
		/*System.out.println(sopageDTO);
		System.out.println(sopageDTO.getCurPage());
		System.out.println(sopageDTO.getPerPage());
		System.out.println(sopageDTO.getTotalCnt());*/
		return "admin/sList";
	}
	
	/*	
	/*@RequestMapping(value="/changeSoLevel", method=RequestMethod.GET)
	public String changeSoLevel(@RequestParam HashMap<String, String> map, HttpSession session) {
		service.changeSoLevel(map);
		ArrayList<Object> list = (ArrayList<Object>)service.soList2();
		session.setAttribute("soList2",list);
		return "redirect:soList2";
	}*/
	
}
