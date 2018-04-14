package com.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dto.SDTO;
import com.dto.SoDTO;
import com.dto.SoLeaveDTO;
import com.service.SService;
import com.service.SoService;


@Controller
public class SoController {
	@Autowired
	SoService service;
	
	@Autowired
	SService service2;
	
	@RequestMapping(value= "/index_shopowner", method=RequestMethod.GET)
	public String index_shopowner() {
		return "index_shopowner";
	}
	
	@RequestMapping(value= "/main_shopowner", method=RequestMethod.GET)
	public String main_shopowner() {
		return "main_shopowner";
	}

	@RequestMapping(value = "/sologin", method = RequestMethod.GET)
	public String login(@RequestParam(required=false, defaultValue="1") HashMap<String, String> map,HttpSession session) {
		SoDTO soDTO = service.login(map);
		String nextPage=null;
		if(soDTO==null) {
			session.setAttribute("fail", "아이디 또는 비밀번호가 일치하지 않습니다.");
			nextPage = "index_shopowner";
		}else {
			nextPage = "main_shopowner";
			session.setAttribute("SoLogin",soDTO);
		}
		return nextPage;
	}
	
	@RequestMapping("/sologout")
	public String logout(HttpSession session,HttpServletRequest request) {
		session.invalidate();
		request.setAttribute("SoLogout","로그아웃 되었습니다.");
		return "index_shopowner";
	}
	
	@RequestMapping("/soJoinForm")
	public String soJoinForm() {
		return "so/soJoinForm";
	}
	
	@RequestMapping("/soFindIdForm")
	public String soFindIdForm() {
		return "so/soFindIdForm";
	}
	
	@RequestMapping("/soFindPwForm")
	public String soFindPwForm() {
		return "so/soFindPwForm";
	}
	
	@RequestMapping("/SoFind")
	public String SoFind(@RequestParam HashMap<String, String> map, HttpServletRequest request) {
		String soPhone1 = map.get("soPhone1");
		String soPhone2 = map.get("soPhone2");
		String soPhone3 = map.get("soPhone3");
		String soPhone = soPhone1+"-"+soPhone2+"-"+soPhone3;
		String find = map.get("find");
		String nextPage=null;
		map.remove("soPhone1");
		map.remove("soPhone2");
		map.remove("soPhone3");
		map.put("soPhone",soPhone);
	
		if(find.equals("soId")) {
			String soId = service.findSoId(map);
			if(soId!=null) {
				request.setAttribute("findSoIdResult", soId);
				nextPage="so/soResult";
			}else {
				request.setAttribute("findfail", "일치하는 정보가 없습니다.");
				nextPage="so/soFindIdForm";
			}
		}else {
			String soPasswd = service.findSoPasswd(map);
			if(soPasswd!=null) {
				request.setAttribute("findSoPasswdResult", soPasswd);
				nextPage="so/soResult";
			}else {
				request.setAttribute("findfail", "일치하는 정보가 없습니다.");
				nextPage="so/soFindPwForm";
			}
		}
		return nextPage;
	}
	
	@RequestMapping(value="/SoJoin",  method=RequestMethod.POST)
	public String SoJoin(@RequestParam HashMap<String, String> map, HttpServletRequest request) {
		String soPhone1 = map.get("soPhone1");
		String soPhone2 = map.get("soPhone2");
		String soPhone3 = map.get("soPhone3");
		String soPhone = soPhone1+"-"+soPhone2+"-"+soPhone3;
		String soAddr1 = map.get("soAddr1");
		String soAddr2 = map.get("soAddr2");
		String soAddr=soAddr1+"/"+soAddr2;
		map.remove("soPhone1");
		map.remove("soPhone2");
		map.remove("soPhone3");
		map.remove("soAddr1");
		map.remove("soAddr2");
		map.put("soPhone",soPhone);
		map.put("soAddr",soAddr);
		service.soJoin(map);
		request.setAttribute("success", "회원가입 성공, 로그인 페이지로 이동합니다.");
		return "index_shopowner";
	}
	
	
	@RequestMapping(value="/soIdCheck", method=RequestMethod.GET)
	@ResponseBody
	public int soIdCheck(@RequestParam String soId) {
		int soIdCheckCnt = service.soIdCheck(soId);
		return soIdCheckCnt;
	}
	
	@RequestMapping(value="/soLicenseCheck", method=RequestMethod.GET)
	@ResponseBody
	public int soLicenseCheck(@RequestParam String soLicense) {
		System.out.println("soLicenseCheck" + soLicense);
		int soLicenseCheckCnt = service.soLicenseCheck(soLicense);
		System.out.println("soLicenseCheckCnt" + soLicenseCheckCnt);
		return soLicenseCheckCnt;
	}
	
	
	@RequestMapping(value= "/soMyPage", method=RequestMethod.GET)
	public String soMyPage(HttpSession session,HttpServletRequest request) {
		SoDTO soDTO = (SoDTO)session.getAttribute("SoLogin");
		String nextPage=null;
		if(soDTO==null) {
			request.setAttribute("fail", "로그인을 해주세요.");
			nextPage = "index_shopowner";
		}else {
			String soId = soDTO.getSoId();
			soDTO = service.soMyPage(soId);
			session.setAttribute("SoMyPage", soDTO);
			nextPage = "so/soMyPage"; 
		}
		return nextPage;
	}
	
	@RequestMapping(value= "/soPhoneUpdate", method=RequestMethod.POST)
	public String soPhoneUpdate(@RequestParam HashMap<String, String> map, HttpSession session,HttpServletRequest request) {
		SoDTO soDTO= (SoDTO)session.getAttribute("SoLogin");
		String nextPage=null;
		if(soDTO==null) {
			request.setAttribute("fail", "로그인을 해주세요.");
			nextPage = "index_shopowner";
		}else {
			String soId = soDTO.getSoId();
			String soPhone1 = map.get("soPhone1");
			String soPhone2 = map.get("soPhone2");
			String soPhone3 = map.get("soPhone3");
			String soPhone = soPhone1+"-"+soPhone2+"-"+soPhone3;
			HashMap<String, String> map2 = new HashMap<>();
			map2.put("soId", soId);
			map2.put("soPhone", soPhone);
			service.soPhoneUpdate(map2);
			nextPage ="redirect:soMyPage";
		}
		return nextPage;
	}
	
	
	@RequestMapping(value= "/soPwUpdateForm", method=RequestMethod.GET)
	public String soPwUpdateForm(HttpSession session,HttpServletRequest request) {
		SoDTO soDTO= (SoDTO)session.getAttribute("SoLogin");
		String nextPage=null;
		if(soDTO==null) {
			request.setAttribute("fail", "로그인을 해주세요.");
			nextPage = "index_shopowner";
		}else {
			nextPage ="so/soPwUpdateForm";
		}
		return nextPage;
	}
	
	@RequestMapping(value="/soPwCheck", method=RequestMethod.POST)
	@ResponseBody
	public int soPwCheck(@RequestParam String soPasswd,HttpSession session) {
		SoDTO soDTO= (SoDTO)session.getAttribute("SoLogin");
		String soId = soDTO.getSoId();
		HashMap<String, String> map = new HashMap<>();
		map.put("soId", soId);
		map.put("soPasswd", soPasswd);
		int soPwCheckCnt = service.soPwCheck(map);
		return soPwCheckCnt;
	}
	
	@RequestMapping(value= "/soPwUpdate", method=RequestMethod.POST)
	public String soPwUpdate(@RequestParam HashMap<String, String> map, HttpSession session, HttpServletRequest request) {
		SoDTO soDTO= (SoDTO)session.getAttribute("SoLogin");
		String nextPage=null;
		if(soDTO==null) {
			request.setAttribute("fail", "로그인을 해주세요.");
			nextPage = "index_shopowner";
		}else {
			String soId = soDTO.getSoId();
			map.put("soId", soId);
			service.soPwUpdate(map);
			session.setAttribute("success", "비밀번호가 변경되었습니다.");
			nextPage="redirect:main_shopowner";
		}
		return nextPage;
	}
	
	@RequestMapping("/soLeaveForm")
	public String soLeaveForm(HttpSession session, HttpServletRequest request){
		SoDTO soDTO= (SoDTO)session.getAttribute("SoLogin");
		String nextPage=null;
		if(soDTO==null) {
			request.setAttribute("fail", "로그인을 해주세요.");
			nextPage = "index_shopowner";
		}else {
			String soId = soDTO.getSoId();
			SDTO sDTO = service2.sInfo(soId);
			String sCode = sDTO.getsCode();
			int soShopCnt = service.soShopCnt(soId);
			int soReviewCnt =service.soReviewCnt(sCode);
			int soInterestCnt = service.soInterestCnt(sCode);
			int soScore = service.soScore(sCode);
			String soCouponCnt = service.soCouponCnt(sCode);
			String soExpireDate = service.soExpireDate(soId);
			SoLeaveDTO soleaveDTO = new SoLeaveDTO(soShopCnt, soReviewCnt, soInterestCnt, soScore, soCouponCnt, soExpireDate);
			session.setAttribute("soleaveDTO", soleaveDTO);
			nextPage="so/soLeaveForm";
		}
		return nextPage;
	}
	
	
	@RequestMapping("/soLeave")
	public String soLeave(HttpSession session, HttpServletRequest request) {
		SoDTO soDTO= (SoDTO)session.getAttribute("SoLogin");
		String nextPage=null;
		if(soDTO==null) {
			request.setAttribute("fail", "로그인을 해주세요.");
			nextPage = "index_shopowner";
		}else {
			String soId = soDTO.getSoId();
			SDTO sDTO = service2.sInfo(soId);
			String sCode = sDTO.getsCode();
			HashMap<String, String> map = new HashMap<>();
			map.put("soId", soId);
			map.put("sCode", sCode);
			service.soLeave(map);
			session.invalidate();
			request.setAttribute("success", "회원탈퇴가 완료되었습니다.");
			nextPage = "redirect:index_shopowner";
		}
		return nextPage;
	}
}
