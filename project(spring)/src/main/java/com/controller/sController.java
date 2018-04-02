package com.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
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
	
	@RequestMapping("/SInfoEnrollForm")
	public String SInfoEnrollForm() {
		return "shop/sInfoEnrollForm";
	}
	
	@RequestMapping("/SInfoEnroll")
	public String SInfoEnroll(HttpServletRequest request) {
		String soId= request.getParameter("soId");
		String soLicense = request.getParameter("soLicense");
		String sName = request.getParameter("sName");
		String sPhone1 = request.getParameter("sPhone1");
		String sPhone2 = request.getParameter("sPhone2");
		String sPhone3 = request.getParameter("sPhone3");
		String sPost = request.getParameter("post");
		String sAddr1 = request.getParameter("sAddr1");
		String sAddr2 = request.getParameter("sAddr2");
		String sCategory2 = request.getParameter("sCategory");
		String sWeekday = request.getParameter("sWeekday");
		String sWeekend= request.getParameter("sWeekend");
		String sDayOff= request.getParameter("sDayOff");
		String sParkinglot= request.getParameter("sParkinglot");
		String sTerrace= request.getParameter("sTerrace");
		//메뉴판 카테고리1
		String sMenuCategory1= request.getParameter("sMenuCategory1");
		String sC1Menu1= request.getParameter("sC1Menu1");
		String sC1Menu1_info= request.getParameter("sC1Menu1_info");
		String sC1Price1= request.getParameter("sC1Price1");
		String sC1Menu2= request.getParameter("sC1Menu2");
		String sC1Menu2_info= request.getParameter("sC1Menu2_info");
		String sC1Price2= request.getParameter("sC1Price2");
		String sC1Menu3= request.getParameter("sC1Menu3");
		String sC1Menu3_info= request.getParameter("sC1Menu3_info");
		String sC1Price3= request.getParameter("sC1Price3");
		//메뉴판 카테고리2
		String sMenuCategory2= request.getParameter("sMenuCategory2");
		String sC2Menu1= request.getParameter("sC2Menu1");
		String sC2Menu1_info= request.getParameter("sC2Menu1_info");
		String sC2Price1= request.getParameter("sC2Price1");
		String sC2Menu2= request.getParameter("sC2Menu2");
		String sC2Menu2_info= request.getParameter("sC2Menu2_info");
		String sC2Price2= request.getParameter("sC2Price2");
		String sC2Menu3= request.getParameter("sC2Menu3");
		String sC2Menu3_info= request.getParameter("sC2Menu3_info");
		String sC2Price3= request.getParameter("sC2Price3");
		String sSubway=request.getParameter("sSubway2");
		System.out.println(sSubway);
		String sCode = sCategory2+soLicense;
		////////////DTO에 맞게 재정의/////////////
		String sPhone = sPhone1+"-"+sPhone2+"-"+sPhone3;
		String sAddr = sAddr1+"/"+sAddr2;
		String sMenu1= sMenuCategory1+"/"+sC1Menu1+":"+sC1Menu1_info+":"+sC1Price1+"/"+sC1Menu2+":"+sC1Menu2_info+":"+sC1Price2+"/"+sC1Menu3+":"+sC1Menu3_info+":"+sC1Price3;
		String sMenu2= sMenuCategory2+"/"+sC2Menu1+":"+sC2Menu1_info+":"+sC2Price1+"/"+sC2Menu2+":"+sC2Menu2_info+":"+sC2Price2+"/"+sC2Menu3+":"+sC2Menu3_info+":"+sC2Price3;	
		String sCategory=null;
		if(sCategory2.equals("c")){
			sCategory="Cafe";
		}else if(sCategory2.equals("d")) {
			sCategory="Dessert";
		}else if(sCategory2.equals("w")) {
			sCategory="Wine";
		}
		String sBusinesshours = sWeekday+"/"+sWeekend+"/"+sDayOff;		
		SDTO dto = new SDTO(sCode, sName, soId, sPost, sAddr, sPhone, sCategory, sBusinesshours, sParkinglot, sTerrace, sMenu1, sMenu2,sSubway);
		
		service.SInfoEnroll(dto);
		return "sManagement";
	}
	
	
	@RequestMapping("/sManagement")
	public String sManagement(HttpSession session) {
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
		return nextPage;
	}
	
	@RequestMapping("/sView")
	public String sView(HttpSession session) {
		System.out.println("sView start");
		SDTO sDTO = (SDTO)session.getAttribute("sInfo");
		String nextPage=null;

		if(sDTO==null) {
			session.setAttribute("fail", "상점 정보 먼저 등록해주세요.");
			nextPage ="shop/sManagement";
		}else
		{
			nextPage ="shop/sView";
		}
		System.out.println("sView end");
		return nextPage;
	}
	
}
