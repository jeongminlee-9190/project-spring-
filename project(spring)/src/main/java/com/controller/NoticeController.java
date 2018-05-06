package com.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dto.NoticeDTO;
import com.dto.PageDTO;
import com.service.NoticeService;

@Controller
public class NoticeController {
	@Autowired
	NoticeService nService;
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value="/mNoticeForm" , method=RequestMethod.GET)
	public ModelAndView mNotice(@RequestParam HashMap<String, String> map, @RequestParam(required=false, defaultValue="1") int curPage,
								HttpServletRequest request) {
		PageDTO pageDTO = nService.mNoticeList(map, curPage);
		ModelAndView mav = new ModelAndView();
		mav.addObject("pageDTO",pageDTO);
		mav.setViewName("admin/mNoticeForm");
		String searchName = map.get("searchName");
		String searchValue = map.get("searchValue");
		request.setAttribute("searchName", searchName);
		request.setAttribute("searchValue", searchValue);
		return mav;
	}
	
	@RequestMapping(value="/mNotice2" , method=RequestMethod.GET)
	public ModelAndView mNotice2(@RequestParam HashMap<String, String> map, @RequestParam(required=false, defaultValue="1") int curPage) {
		PageDTO pageDTO = nService.mNoticeList2(map, curPage);
		ModelAndView mav = new ModelAndView();
		mav.addObject("pageDTO",pageDTO);
		mav.setViewName("member/mNoticeForm");
		return mav;
	}
	
	@RequestMapping(value="/mNoticeWrite", method=RequestMethod.POST)
	public String mNoticeWrite(NoticeDTO dto, HttpSession session) { 
		nService.mNoticeWrite(dto);
		session.setAttribute("success", "게시판 글쓰기 성공");
		return "redirect:mNoticeForm";
	}
	
	@RequestMapping(value="/mNoticeRetrieve", method=RequestMethod.GET)
	public ModelAndView mNoticeRetrieve(@RequestParam int num) {
		ModelAndView mav = new ModelAndView();
		NoticeDTO dto = nService.mNoticeRetrieve(num);
		mav.addObject("mNoticeRetrieve",dto);
		mav.setViewName("admin/mNoticeRetrieve");
		return mav;
	}
	
	@RequestMapping(value="/mNoticeRetrieve2", method=RequestMethod.GET)
	public ModelAndView mNoticeRetrieve2(@RequestParam int num) {
		ModelAndView mav = new ModelAndView();
		NoticeDTO dto = nService.mNoticeRetrieve2(num);
		mav.addObject("mNoticeRetrieve",dto);
		mav.setViewName("admin/mNoticeRetrieve");
		return mav;
	}
	
	@RequestMapping(value="/mNoticeDelete", method=RequestMethod.GET)
		public String mNoticeDelete(@RequestParam int num, HttpSession session) {
		nService.mNoticeDelete(num);
		session.setAttribute("success", "게시판 삭제 성공");
		return "redirect:mNoticeForm";
	}
	
	@RequestMapping(value="/mNoticeUpdate", method=RequestMethod.POST)
		public String mNoticeUpdate(NoticeDTO dto, HttpSession session) {
		nService.mNoticeUpdate(dto);
		session.setAttribute("success","게시판 수정 성공");
		return "redirect:mNoticeForm";
	}

	////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	@RequestMapping(value="/soNotice", method=RequestMethod.GET)
	public ModelAndView soNotice(@RequestParam HashMap<String, String> map, @RequestParam(required=false, defaultValue="1") int curPage,
			HttpServletRequest request) {
		PageDTO pageDTO = nService.soNoticeList(map, curPage);
		ModelAndView mav = new ModelAndView();
		mav.addObject("pageDTO",pageDTO);
		mav.setViewName("admin/soNotice");
		String searchName = map.get("searchName");
		String searchValue = map.get("searchValue");
		request.setAttribute("searchName", searchName);
		request.setAttribute("searchValue", searchValue);
		return mav;
	}
	
	@RequestMapping(value="/soNotice2", method=RequestMethod.GET)
	public ModelAndView soNotice2(@RequestParam HashMap<String, String> map, @RequestParam(required=false, defaultValue="1") int curPage,
			HttpServletRequest request) {
		PageDTO pageDTO = nService.soNoticeList2(map, curPage);
		ModelAndView mav = new ModelAndView();
		mav.addObject("pageDTO",pageDTO);
		mav.setViewName("so/soNotice");
		String searchName = map.get("searchName");
		String searchValue = map.get("searchValue");
		request.setAttribute("searchName", searchName);
		request.setAttribute("searchValue", searchValue);
		return mav;
	}
	
	@RequestMapping(value="/soNoticeWrite", method=RequestMethod.POST)
	public String soNoticeWrite(NoticeDTO dto, HttpSession session) { 
		nService.soNoticeWrite(dto);
		session.setAttribute("success", "게시판 글쓰기 성공");
		return "redirect:soNotice";
	}
	
	@RequestMapping(value="/soNoticeRetrieve", method=RequestMethod.GET)
	public ModelAndView soNoticeRetrieve(@RequestParam int num) {
		ModelAndView mav = new ModelAndView();
		NoticeDTO dto = nService.soNoticeRetrieve(num);
		mav.addObject("soNoticeRetrieve",dto);
		mav.setViewName("admin/soNoticeRetrieve");
		return mav;
	}
	
	@RequestMapping(value="/soNoticeRetrieve2", method=RequestMethod.GET)
	public ModelAndView soNoticeRetrieve2(@RequestParam int num) {
		ModelAndView mav = new ModelAndView();
		NoticeDTO dto = nService.soNoticeRetrieve2(num);
		mav.addObject("soNoticeRetrieve",dto);
		mav.setViewName("so/soNoticeRetrieve2");
		return mav;
	}
	
	@RequestMapping(value="/soNoticeDelete", method=RequestMethod.GET)
		public String delete(@RequestParam int num, HttpSession session) { 
		nService.soNoticeDelete(num);
		session.setAttribute("success", "게시판 삭제 성공");
		return "redirect:soNotice";
	}
	
	@RequestMapping(value="/soNoticeUpdate", method=RequestMethod.POST)
		public String soNoticeUpdate(NoticeDTO dto, HttpSession session) { 
		nService.soNoticeUpdate(dto);
		session.setAttribute("success","게시판 수정 성공");
		return "redirect:soNotice";
	}

}
