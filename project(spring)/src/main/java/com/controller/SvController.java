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
	@Autowired
	SoService soService;

	
	@RequestMapping("/soPayMentForm")
	public String soPayMentForm(HttpSession session) {
		SoDTO sDTO = (SoDTO)session.getAttribute("SoLogin");
		String nextPage=null;
		if(sDTO == null) {
			nextPage="index_shopowner";
		}else {
			String soId = sDTO.getSoId();
			session.setAttribute("SoId", soId);
			nextPage="so/soPayMentForm";
		}
		return nextPage;
	}
	
	
	@RequestMapping(value="/soPayMent", method=RequestMethod.POST)
	public String soPayMent(@RequestParam HashMap<String, Object> map,HttpSession session,HttpServletRequest request) {
		SoDTO soDTO= (SoDTO)session.getAttribute("SoLogin");
		//period cardNum validThru secCode
		String nextPage=null;
		if(soDTO==null) {
			request.setAttribute("fail", "로그인을 해주세요.");
			nextPage = "index_shopowner";
		}else {
			String soId = (String)session.getAttribute("SoId");
			int price = 0;
			String period2 =  (String)map.get("period");
			int period = Integer.parseInt(period2);
			if(period2.equals("30")) {
				price=16800;
			}else if(period2.equals("60")) {
				price=26800;
			}else {
				price=36800;
			}
			map.put("soId", soId);
			map.put("period", period);
			map.put("price", price);
			service.payment(map);
			String soExpireDate = soService.soExpireDate(soId);
			String soLevel = soService.soLevel(soId);
			session.setAttribute("SoLevel",soLevel);
			session.setAttribute("SoExpireDate",soExpireDate);
			session.setAttribute("success", "결제가 완료되었습니다.");
			nextPage="redirect:main_shopowner";
		}
		return nextPage;
	}
}
