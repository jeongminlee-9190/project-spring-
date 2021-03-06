package com.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String SInfoEnroll(HttpSession session,HttpServletRequest request) {
		String soId = request.getParameter("soId");
		String soLicense =request.getParameter("soLicense");
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
		session.setAttribute("sInfo", dto);
		
	    session.setAttribute("success", "상점 기본정보 등록 완료");
	    return "redirect:sManagement";
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
	

	@RequestMapping("/sInfoUpdateForm")
	public String sInfoUpdateForm(HttpSession session) {
		SoDTO soDTO = (SoDTO)session.getAttribute("SoLogin");
		String nextPage=null;
		if(soDTO==null) {
			session.setAttribute("fail", "로그인을 해주세요");
			nextPage ="index_shopowner";
		}else {
			SDTO sDTO = (SDTO)session.getAttribute("sInfo");
			if(sDTO==null) {
				session.setAttribute("fail", "상점 정보 먼저 등록해주세요.");
				nextPage ="shop/sManagement";
			}else
			{
				nextPage ="shop/sInfoUpdateForm";
			}
		}
		return nextPage;
	}
	
	@RequestMapping("/sInfoUpdate")
	public String sInfoUpdate(@RequestParam HashMap<String, String> map, HttpSession session) {
		SoDTO soDTO = (SoDTO)session.getAttribute("SoLogin");
		SDTO sDTO = (SDTO)session.getAttribute("sInfo");
		System.out.println("map"+map);
		String nextPage=null;
		if(soDTO==null) {
			session.setAttribute("fail", "로그인을 해주세요");
			nextPage ="index_shopowner";
		}else {
			if(sDTO==null) {
				session.setAttribute("fail", "상점 정보 먼저 등록해주세요.");
				nextPage ="shop/sManagement";
			}else {
				String sPhone1 = map.get("sPhone1");
				String sPhone2 = map.get("sPhone2");
				String sPhone3 = map.get("sPhone3");
				String sWeekday = map.get("sWeekday");
				String sWeekend= map.get("sWeekend");
				String sDayOff= map.get("sDayOff");
				
				//메뉴판 카테고리1
				String sMenuCategory1= map.get("sMenuCategory1");
				String sC1Menu1= map.get("sC1Menu1");
				String sC1Menu1_info= map.get("sC1Menu1_info");
				String sC1Price1= map.get("sC1Price1");
				String sC1Menu2= map.get("sC1Menu2");
				String sC1Menu2_info= map.get("sC1Menu2_info");
				String sC1Price2= map.get("sC1Price2");
				String sC1Menu3= map.get("sC1Menu3");
				String sC1Menu3_info= map.get("sC1Menu3_info");
				String sC1Price3= map.get("sC1Price3");
				//메뉴판 카테고리2
				String sMenuCategory2= map.get("sMenuCategory2");
				String sC2Menu1= map.get("sC2Menu1");
				String sC2Menu1_info= map.get("sC2Menu1_info");
				String sC2Price1= map.get("sC2Price1");
				String sC2Menu2= map.get("sC2Menu2");
				String sC2Menu2_info= map.get("sC2Menu2_info");
				String sC2Price2= map.get("sC2Price2");
				String sC2Menu3= map.get("sC2Menu3");
				String sC2Menu3_info= map.get("sC2Menu3_info");
				String sC2Price3= map.get("sC2Price3");
						
				String sPhone = sPhone1+"-"+sPhone2+"-"+sPhone3;
				String sBusinesshours = sWeekday+"/"+sWeekend+"/"+sDayOff;
				String sMenu1= sMenuCategory1+"/"+sC1Menu1+":"+sC1Menu1_info+":"+sC1Price1+"/"+sC1Menu2+":"+sC1Menu2_info+":"+sC1Price2+"/"+sC1Menu3+":"+sC1Menu3_info+":"+sC1Price3;
				String sMenu2= sMenuCategory2+"/"+sC2Menu1+":"+sC2Menu1_info+":"+sC2Price1+"/"+sC2Menu2+":"+sC2Menu2_info+":"+sC2Price2+"/"+sC2Menu3+":"+sC2Menu3_info+":"+sC2Price3;	

				map.put("sPhone", sPhone);
				map.put("sBusinesshours", sBusinesshours);
				map.put("sMenu1", sMenu1);
				map.put("sMenu2", sMenu2);
				service.sInfoUpdate(map);
				session.setAttribute("success", "상점 기본 정보 수정이 완료되었습니다.");
				nextPage="redirect:sManagement";
			}	
		}
		return nextPage;
	}
	
	
	@RequestMapping("/sDelete")
	public String sDelete(HttpSession session,String sCode) {
		SoDTO soDTO = (SoDTO)session.getAttribute("SoLogin");
		String nextPage=null;
		if(soDTO==null) {
			session.setAttribute("fail", "로그인을 해주세요");
			nextPage ="index_shopowner";
		}else{
			String soId = soDTO.getSoId();
			SDTO sDTO = (SDTO)session.getAttribute("sInfo");
			sCode = sDTO.getsCode();
			HashMap<String, String> map = new HashMap<>();
			map.put("soId", soId);
			map.put("sCode", sCode);
			service.sDelAll(map);
			session.setAttribute("success", "삭제 성공");
			nextPage ="redirect:sManagement";
		}
		return nextPage;
	}
	
/*	
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
	*/
}
