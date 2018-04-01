package com.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dto.SDTO;
import com.dto.SoDTO;
import com.service.SService;

@Controller
public class sController {
	@Autowired
	SService service;
	
	@RequestMapping("/sManagement")
	public String sManagement(HttpSession session) {
		System.out.println("sManagement start");
		SoDTO soDTO = (SoDTO)session.getAttribute("SoLogin");
		String nextPage=null;
		SDTO sDTO=null;

		if(soDTO==null) {
			session.setAttribute("fail", "로그인을 해주세요");
			nextPage ="index_shopowner";
		}else
		{
			String soId = soDTO.getSoId();
			sDTO = (SDTO)service.sInfo(soId);
			session.setAttribute("sInfo", sDTO);
			nextPage ="shop/sManagement";
		}
		System.out.println("sManagement end");
		return nextPage;
	}
}
