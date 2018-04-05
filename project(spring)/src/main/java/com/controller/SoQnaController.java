package com.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dto.SoDTO;
import com.dto.SoQnaDTO;
import com.service.SoQnaService;

@Controller
public class SoQnaController {
	@Autowired
	SoQnaService service;
	
	@RequestMapping("/soQna")
	public String soQna(HttpSession session) {
		SoDTO sodto = (SoDTO)session.getAttribute("SoLogin");
		String nextPage=null;
		if(sodto==null) {
			session.setAttribute("fail", "로그인을 해주세요");
			nextPage ="index_shopowner";
		}else {
			String soId = sodto.getSoId();
			List<SoQnaDTO> list= service.soQna(soId);
			session.setAttribute("soQna", list);
			nextPage="so/soQna";
		}
		return nextPage;
	}
	
	@RequestMapping("/soQnaWriteForm")
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
	}
}
