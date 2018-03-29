package com.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dto.SoDTO;
import com.dto.SvDTO;
import com.service.SoService;
import com.service.SvService;


@Controller
public class SvController {
	@Autowired
	SvService service;

	
	@RequestMapping("/payMentUI")
	public String payMentUI(HttpSession session) {
		SoDTO sDTO = (SoDTO)session.getAttribute("SoLogin");
		String soid = sDTO.getSoId();
		System.out.println(sDTO);
		String nextPage=null;
		
		if(sDTO == null) {
			nextPage="index_shopowner";
		}else {
		session.setAttribute("SoId", soid);
			nextPage="so/includes/payment";
		}
		return nextPage;
	}
	
	@RequestMapping(value="/payMent", method=RequestMethod.POST)
	public String payMent(@RequestParam SvDTO dto,String soId,HttpSession session) {
		dto.setSoId((String)session.getAttribute("SoId"));
		System.out.println(dto.getSoId());	
		/*service.payment(dto);
		*/	
		return "main_shopowner";
	}
}
