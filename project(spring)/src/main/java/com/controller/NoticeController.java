package com.controller;

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

import com.dto.NoticeDTO;
import com.dto.PageDTO;
import com.service.NoticeService;

@Controller
public class NoticeController {
	@Autowired
	NoticeService nService;
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value="/mNotice" , method=RequestMethod.GET)
	public ModelAndView mNotice(@RequestParam HashMap<String, String> map, @RequestParam(required=false, defaultValue="1") int curPage) {
		PageDTO pageDTO = nService.mNoticeList(map, curPage);
		ModelAndView mav = new ModelAndView();
		mav.addObject("pageDTO",pageDTO);
		mav.setViewName("admin/mNotice");
		return mav;
	}
	@RequestMapping(value="/mNoticeWrite", method=RequestMethod.POST)
	public String mNoticeWrite(NoticeDTO dto, HttpSession session) { //map 또는 +requestParam 사용 가능
		nService.mNoticeWrite(dto);
		session.setAttribute("success", "게시판 글쓰기 성공");
		//redirect:list3   /list3 으로 가라는 것    list3.jsp로 바로 가면 안되고 Controller를 거쳐야 한다.
		return "redirect:mNotice";
		//return "forward:list3";  URL이 변경되지 않는다. 새로고침하면 다시 저장되기 때문에 redirect를 써야 한다.
	}
	
	@RequestMapping(value="/mNoticeRetrieve", method=RequestMethod.GET)
	public ModelAndView mNoticeRetrieve(@RequestParam int num) { //@RequestParam("num") int num
		ModelAndView mav = new ModelAndView();
		NoticeDTO dto = nService.mNoticeRetrieve(num);
		mav.addObject("mNoticeRetrieve",dto);
		mav.setViewName("admin/mNoticeRetrieve");
		return mav;
	}
	
	@RequestMapping(value="/mNoticeDelete", method=RequestMethod.GET)
		public String mNoticeDelete(@RequestParam int num, HttpSession session) { //@RequestParam("num") int num
		nService.mNoticeDelete(num);
		session.setAttribute("success", "게시판 삭제 성공");
		return "redirect:mNotice";
	}
	
	@RequestMapping(value="/mNoticeUpdate", method=RequestMethod.POST)
		public String mNoticeUpdate(NoticeDTO dto, HttpSession session) { //@RequestParam("num") int num
		nService.mNoticeUpdate(dto);
		session.setAttribute("success","게시판 수정 성공");
		return "redirect:mNotice";
	}

	////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	@RequestMapping(value="/soNotice", method=RequestMethod.GET)
	public ModelAndView soNotice(@RequestParam HashMap<String, String> map, @RequestParam(required=false, defaultValue="1") int curPage) {
		PageDTO pageDTO = nService.soNoticeList(map, curPage);
		ModelAndView mav = new ModelAndView();
		mav.addObject("pageDTO",pageDTO);
		mav.setViewName("admin/soNotice");
		return mav;
	}
	
	@RequestMapping(value="/soNoticeWrite", method=RequestMethod.POST)
	public String soNoticeWrite(NoticeDTO dto, HttpSession session) { //map 또는 +requestParam 사용 가능
		System.out.println("soNoticeWrite 접근"+dto);
		nService.soNoticeWrite(dto);
		session.setAttribute("success", "게시판 글쓰기 성공");
		//redirect:list3   /list3 으로 가라는 것    list3.jsp로 바로 가면 안되고 Controller를 거쳐야 한다.
		return "redirect:soNotice";
		//return "forward:list3";  URL이 변경되지 않는다. 새로고침하면 다시 저장되기 때문에 redirect를 써야 한다.
	}
	
	@RequestMapping(value="/soNoticeRetrieve", method=RequestMethod.GET)
	public ModelAndView soNoticeRetrieve(@RequestParam int num) { //@RequestParam("num") int num
		ModelAndView mav = new ModelAndView();
		NoticeDTO dto = nService.soNoticeRetrieve(num);
		mav.addObject("soNoticeRetrieve",dto);
		mav.setViewName("admin/soNoticeRetrieve");
		return mav;
	}
	
	@RequestMapping(value="/soNoticeDelete", method=RequestMethod.GET)
		public String delete(@RequestParam int num, HttpSession session) { //@RequestParam("num") int num
		nService.soNoticeDelete(num);
		session.setAttribute("success", "게시판 삭제 성공");
		return "redirect:soNotice";
	}
	
	@RequestMapping(value="/soNoticeUpdate", method=RequestMethod.POST)
		public String soNoticeUpdate(NoticeDTO dto, HttpSession session) { //@RequestParam("num") int num
		nService.soNoticeUpdate(dto);
		session.setAttribute("success","게시판 수정 성공");
		return "redirect:soNotice";
	}

}
