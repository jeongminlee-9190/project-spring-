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
	public String payMent(@RequestParam String period ,String soId,HttpSession session) {
		String sDTO = (String)session.getAttribute("SoId");
		int price = 0;
		if(period.equals("30")) {
			price=16800;
		}else if(period.equals("60")) {
			price=26800;
		}else {
			price=36800;
		}
		SvDTO svDTO= new SvDTO();
		svDTO.setSoId(sDTO);
		svDTO.setPrice(price);
		svDTO.setPeriod(Integer.parseInt(period));
		service.payment(svDTO);
		session.setAttribute("success", "결제가 완료되었습니다.");
		return "main_shopowner";
	}
}
