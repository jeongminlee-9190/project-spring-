package com.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dto.AQnaDTO;
import com.dto.AdminDTO;
import com.service.AQnaService;

@Controller
public class AQnaController {
	@Autowired
	AQnaService service;
	
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
			list = service.qna();
			session.setAttribute("aQna", list);
			nextPage ="admin/aQna";
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
