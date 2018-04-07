package com.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dto.AQnaDTO;
import com.dto.AQnaPageDTO;
import com.dto.AdminDTO;
import com.dto.MPageDTO;
import com.dto.NoticeDTO;
import com.dto.QnaReplyDTO;
import com.dto.SoQnaDTO;
import com.service.AQnaService;

@Controller
public class AQnaController {
	@Autowired
	AQnaService service;
	/*
	@RequestMapping("/aQna")
	public String aQna(HttpSession session) {
		AdminDTO adto = (AdminDTO)session.getAttribute("adminLogin");
		List<AQnaDTO> list = null;
		String nextPage = null;
		if(adto==null) {
			session.setAttribute("fail", "로그인을 해주세요.");
			nextPage = "index_admin";
		}
		else {
			list = service.aQnaList();
			session.setAttribute("aQna", list);
			nextPage ="admin/aQna";
		}
		
		return nextPage;
	}*/
	
	/*@RequestMapping("/aQnaList")
	public String aQnaList(@RequestParam HashMap<String, String> map, HttpSession session) {
		AdminDTO adto = (AdminDTO)session.getAttribute("adminLogin");
		String nextPage = null;
		if(adto==null) {
			session.setAttribute("fail", "로그인을 해주세요.");
			nextPage = "index_admin";
		}
		else {
			List<SoQnaDTO> list = null;
			String searchName = map.get("searchName");
			session.setAttribute("searchName", searchName);
			System.out.println("searchName: "+searchName);
				list = service.aQnaList();
				session.setAttribute("aQna", list);
				System.out.println("list"+list);
				nextPage ="admin/aQnaList";
		}
		return nextPage;
	}*/
	
	@RequestMapping(value="/aQnaList",method=RequestMethod.GET)
	public String aQnaList(@RequestParam HashMap<String, String> map, @RequestParam(required=false, defaultValue="1") int curPage,
			HttpSession session, HttpServletRequest request) {
		AdminDTO adto = (AdminDTO)session.getAttribute("adminLogin");
		String nextPage = null;
		if(adto==null) {
			session.setAttribute("fail", "로그인을 해주세요.");
			nextPage = "index_admin";
		}
		else {
			AQnaPageDTO aqnapageDTO = service.aQnaList(map, curPage);
			session.setAttribute("AQnaPageDTO",aqnapageDTO);
			request.setAttribute("searchName", map.get("searchName"));
			request.setAttribute("searchName2", map.get("searchName2"));
			nextPage="admin/aQnaList";
		}
		return nextPage;
	}
	
	@RequestMapping(value="/soQnaRetrieve", method=RequestMethod.GET)
	public String soQnaRetrieve(@RequestParam int qnaNum,HttpSession session) { //@RequestParam("num") int num
		AdminDTO adto = (AdminDTO)session.getAttribute("adminLogin");
		String nextPage = null;
		if(adto==null) {
			session.setAttribute("fail", "로그인을 해주세요.");
			nextPage = "index_admin";
		}
		else {
			SoQnaDTO soqnaDTO = service.soQnaRetrieve(qnaNum);
			QnaReplyDTO qnareplyDTO = service.soQnaReplyRetrieve(qnaNum);
			if(soqnaDTO.getQnaComplete().equals("확인중")) {
				service.soQnaRetrieve2(qnaNum);
				System.out.println("처리중으로 변경");
			}
			session.setAttribute("soQnaRetrieve",soqnaDTO);
			session.setAttribute("soQnaReplyRetrieve",qnareplyDTO);
			nextPage="admin/soQnaRetrieve";
		}		
		return nextPage;
	}
	
	
	@RequestMapping(value="/soQnaReply", method=RequestMethod.GET)
	public String soQnaReply(@RequestParam HashMap<String, Object> map,HttpSession session) {
		AdminDTO adto = (AdminDTO)session.getAttribute("adminLogin");
		String nextPage = null;
		if(adto==null) {
			session.setAttribute("fail", "로그인을 해주세요.");
			nextPage = "index_admin";
		}
		else {
			service.soQnaReply(map);
			nextPage="redirect:aQnaList";
		}		
		return nextPage;
	}
	
	@RequestMapping(value="/soQnaReplyModify", method=RequestMethod.GET)
	public String soQnaReplyModify(@RequestParam HashMap<String, Object> map,HttpSession session, HttpServletRequest request) {
		AdminDTO adto = (AdminDTO)session.getAttribute("adminLogin");
		System.out.println(map);
		String nextPage = null;
		if(adto==null) {
			request.setAttribute("fail", "로그인을 해주세요.");
			nextPage = "index_admin";
		}
		else {
			service.soQnaReplyModify(map);
			request.setAttribute("success", "답변이 수정되었습니다.");
			nextPage="redirect:aQnaList";
		}		
		return nextPage;
	}
	
	/*@RequestMapping("/soQnaWriteForm")
	public String soQnaWriteForm() {
		return "so/soQnaWrite";
	}
	
	@RequestMapping("/soQnaWrite")
	public String soQnaWrite(@RequestParam HashMap<String, String> map, HttpSession session) {
		SoDTO sodto = (SoDTO)session.getAttribute("SoLogin");
		String nextPage=null;
		if(sodto==null) {
			session.setAttribute("fail", "로그인을 해주세요");
			nextPage ="index_shopowner";
		}else {
			String soId = sodto.getSoId();
			map.put("soId", soId);
			service.soQnaWrite(map);
			session.setAttribute("success", "1:1문의가 정상적으로 접수되었습니다.");
			nextPage="redirect:soQna";
		}
		return nextPage;
	}
	
	@RequestMapping("/soQnaDelete")
	public String soQnaDelete(@RequestParam HashMap<String, Integer> map) {
		service.soQnaDelete(map);
		return "redirect:soQna";
	}*/
}
