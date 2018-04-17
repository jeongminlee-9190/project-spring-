package com.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dto.PageDTO;
import com.dto.SoDTO;
import com.dto.SvDTO;
import com.dto.SvPageDTO;
import com.service.SoService;
import com.service.SvService;

@Controller
public class SvController {
	@Autowired
	SvService service;
	@Autowired
	SoService soService;

	
	
	@RequestMapping("/soPaymentList")
	public ModelAndView soPaymentList(@RequestParam HashMap<String, String> map, @RequestParam(required=false, defaultValue="1") int curPage,
			HttpServletRequest request, HttpSession session) {
		SoDTO sDTO = (SoDTO)session.getAttribute("SoLogin");
		ModelAndView mav = new ModelAndView();
		if(sDTO == null) {
			mav.setViewName("index_shopowner");
		}else {
			String soId = sDTO.getSoId();
			map.put("soId", soId);
			SvPageDTO svpageDTO = service.soPaymentList(map, curPage);
			mav.addObject("soPaymentList",svpageDTO);
			mav.setViewName("so/soPaymentList");
			String searchName = map.get("searchName");
			request.setAttribute("searchName", searchName);
			return mav;
		}
		return mav;
	}
	
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
			List<String> soExpireDatelist = soService.soExpireDate(soId);
			String soExpireDate = soExpireDatelist.get(0);
			String soLevel = soService.soLevel(soId);
			session.setAttribute("SoLevel",soLevel);
			session.setAttribute("SoExpireDate",soExpireDate);
			session.setAttribute("success", "결제가 완료되었습니다.");
			nextPage="redirect:main_shopowner";
		}
		return nextPage;
	}
}
