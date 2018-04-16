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
import com.service.AQnaService;
import com.service.AService;
import com.service.NoticeService;

@Controller
public class AController {
	@Autowired
	AService service;
	@Autowired
	AQnaService service2;
	
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
		int aQnaListTotalCount2 = service2.aQnaListTotalCount2();
		session.setAttribute("aQnaListTotalCount", aQnaListTotalCount2);
		return "main_admin";
	}
	
	@RequestMapping(value= "/adminLogin", method=RequestMethod.POST)
	public String adminLogin(@RequestParam HashMap<String, String> map, HttpSession session) {
		AdminDTO dto = service.login(map);
		String nextPage = null;
		if(dto==null) {
			session.setAttribute("fail","일치하는 정보가 없습니다.");
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
			HttpSession session,HttpServletRequest request) {
		AdminDTO adto = (AdminDTO)session.getAttribute("adminLogin");
		ModelAndView mav = new ModelAndView();
		if(adto==null) {
			session.setAttribute("fail", "로그인을 해주세요.");
			mav.setViewName("index_admin");
		}
		else {
			MPageDTO mpageDTO = service.mList(map, curPage);
			mav.addObject("mListpageDTO",mpageDTO);
			mav.setViewName("admin/mList");
			String searchName = map.get("searchName");
			String searchValue = map.get("searchValue");
			request.setAttribute("searchName", searchName);
			request.setAttribute("searchValue", searchValue);
			
		}
		return mav;
	}
	
	
	//휴면계정 리스트	
	@RequestMapping(value="/mDormantList", method=RequestMethod.GET)
	public ModelAndView mDormantList(@RequestParam(required=false, defaultValue="1") int curPage,HttpSession session) {
		AdminDTO adto = (AdminDTO)session.getAttribute("adminLogin");
		ModelAndView mav = new ModelAndView();
		if(adto==null) {
			session.setAttribute("fail", "로그인을 해주세요.");
			mav.setViewName("index_admin");
		}
		else {
			MPageDTO mpageDTO = service.mDormantList(curPage);
			mav.addObject("mpageDTO",mpageDTO);
			mav.setViewName("admin/mDormantList");
		}
		return mav;
	}
	
	@RequestMapping(value="/mDormantDel" , method=RequestMethod.GET)
	public String mDormantDel(@RequestParam String mId, HttpSession session) {
		AdminDTO adto = (AdminDTO)session.getAttribute("adminLogin");
		String nextPage=null;
		if(adto==null) {
			session.setAttribute("fail", "로그인을 해주세요.");
			nextPage="index_admin";
		}
		else {
			service.mDormantDel(mId);
			nextPage="redirect:mDormantList";
		}
		return nextPage;
	}
	
	@RequestMapping("/soList")
	public ModelAndView soList(@RequestParam HashMap<String, String> map, @RequestParam(required=false, defaultValue="1") int curPage,
			HttpSession session, HttpServletRequest request) {
		
		AdminDTO adto = (AdminDTO)session.getAttribute("adminLogin");
		ModelAndView mav = new ModelAndView();
		if(adto==null) {
			session.setAttribute("fail", "로그인을 해주세요.");
			mav.setViewName("index_admin");
		}
		else {
			SoPageDTO sopageDTO = service.soList(map, curPage);
			mav.addObject("soListpageDTO",sopageDTO);
			mav.setViewName("admin/soList");
			String searchName = map.get("searchName");
			String searchValue = map.get("searchValue");
			request.setAttribute("searchName", searchName);
			request.setAttribute("searchValue", searchValue);
		}
		return mav;
	}

	@RequestMapping(value="/SoDormantList", method=RequestMethod.GET)
	public ModelAndView SoDormantList(@RequestParam(required=false, defaultValue="1") int curPage,HttpSession session) {
		AdminDTO adto = (AdminDTO)session.getAttribute("adminLogin");
		ModelAndView mav = new ModelAndView();
		if(adto==null) {
			session.setAttribute("fail", "로그인을 해주세요.");
			mav.setViewName("index_admin");
		}
		else {
			SoPageDTO sopageDTO=service.soDormantList(curPage);
			mav.addObject("sopageDTO",sopageDTO);
			mav.setViewName("admin/SoDormantList");
		}
		return mav;
	}
	
	@RequestMapping(value="/soDormantDel" , method=RequestMethod.GET)
	public String soDormantDel(@RequestParam String soId,HttpSession session) {
		AdminDTO adto = (AdminDTO)session.getAttribute("adminLogin");
		String nextPage=null;
		if(adto==null) {
			session.setAttribute("fail", "로그인을 해주세요.");
			nextPage="index_admin";
		}
		else {
			service.soDormantDel(soId);
			nextPage="redirect:SoDormantList";
		}
		return nextPage;
	}

	@RequestMapping("/soList2")
	public ModelAndView soList2(ArrayList<Object> list,HttpSession session) {
		AdminDTO adto = (AdminDTO)session.getAttribute("adminLogin");
		ModelAndView mav = new ModelAndView();
		if(adto==null) {
			session.setAttribute("fail", "로그인을 해주세요.");
			mav.setViewName("index_admin");
		}
		else {
			list = (ArrayList<Object>)service.soList2();
			mav.addObject("soList2",list);
			mav.setViewName("admin/soList2");
		}
		return mav;
	}
	
	
	@RequestMapping(value="/soApprove", method=RequestMethod.GET)
	public String soApprove(@RequestParam String soId, HttpSession session) {
		AdminDTO adto = (AdminDTO)session.getAttribute("adminLogin");
		String nextPage=null;
		if(adto==null) {
			session.setAttribute("fail", "로그인을 해주세요.");
			nextPage="index_admin";
		}
		else {
			service.soApprove(soId);
			session.setAttribute("success", soId+" -가입승인 완료");
			nextPage="redirect:soList2";
		}
		return nextPage;
	}
	
	@RequestMapping(value = "/sList", method=RequestMethod.GET)
	public String sList(@RequestParam HashMap<String, String> map, @RequestParam(required=false, defaultValue="1") int curPage,
			HttpSession session,HttpServletRequest request) {
		AdminDTO adto = (AdminDTO)session.getAttribute("adminLogin");
		String nextPage=null;
		if(adto==null) {
			session.setAttribute("fail", "로그인을 해주세요.");
			nextPage="index_admin";
		}
		else {
			SPageDTO spageDTO = new SPageDTO();
			spageDTO = service.sList(map, curPage);
			session.setAttribute("sListpageDTO", spageDTO);	
			String searchName = map.get("searchName");
			String searchValue = map.get("searchValue");
			request.setAttribute("searchName", searchName);
			request.setAttribute("searchValue", searchValue);
			nextPage ="admin/sList";
		}
		return nextPage;
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
