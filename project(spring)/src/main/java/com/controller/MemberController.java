package com.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dto.MemberDTO;
import com.dto.SoDTO;
import com.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService memberService;
		
	@RequestMapping("/mLoginForm")
	public String mLogin() {
		return "member/mLoginForm";
	}

	@RequestMapping("/mJoinForm")
	public String mJoin() {
		return "member/mJoinForm";
	}
	
	@RequestMapping("/loginForm")
	public String loginForm() {
		return "member/mLoginForm";
	}
	
	@RequestMapping("/login")
	public ModelAndView login(@RequestParam HashMap<String, String> map,
			HttpSession session, ModelAndView mav) {
		MemberDTO mDTO = memberService.login(map);
		if(mDTO==null) {
			mav.addObject("mesg", "아이디와 비밀번호가 일치하지 않습니다.");
			mav.setViewName("/member/mLoginForm");
		}else {
		session.setAttribute("loginInfo", mDTO);
		mav.setViewName("main");
		}
		return mav;
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "main";
	}
	
	@RequestMapping(value="/memberAdd",  method=RequestMethod.POST)
	public String memberAdd(@RequestParam HashMap<String, String> map, HttpServletRequest request) {
		
		String mPhone1 = map.get("mPhone");
		String mPhone2 = map.get("mPhone2");
		String mPhone3 = map.get("mPhone3");
		String mPhone = mPhone1+"-"+mPhone2+"-"+mPhone3;
		
		map.remove("mPhone1");
		map.remove("mPhone2");
		map.remove("mPhone3");
		map.put("mPhone",mPhone);
		
		
		memberService.memberAdd(map);
		request.setAttribute("success", "회원가입 성공, 로그인 페이지로 이동합니다.");
		
		return "member/mLoginForm";

	}
	
	//member 마이페이지
	@RequestMapping(value= "/mMyPageForm", method=RequestMethod.GET)
	public String mMyPage(HttpSession session,HttpServletRequest request) {
		MemberDTO mDTO = (MemberDTO)session.getAttribute("loginInfo");
		String nextPage=null;
		if(mDTO==null) {
			request.setAttribute("fail", "로그인을 해주세요.");
			nextPage = "main";
		}else {
			String mId = mDTO.getmId();
			mDTO = memberService.mMyPage(mId);
			session.setAttribute("MemberMyPage", mDTO);
			
			nextPage = "member/mMyPageForm"; 
		}
		return nextPage;
	}
	
	//My Favorite Shop 
	@RequestMapping(value="/myShop", method=RequestMethod.GET)
	public String myShop() {
		return "search/myShop";
	}
	
	
	@RequestMapping(value= "/mPwUpdate", method=RequestMethod.POST)
	public String mPwUpdate(@RequestParam HashMap<String, String> map, HttpSession session, HttpServletRequest request) {
		MemberDTO mDTO= (MemberDTO)session.getAttribute("loginInfo");
		String nextPage=null;
		if(mDTO==null) {
			request.setAttribute("fail", "로그인을 해주세요.");
			nextPage = "mLoginForm";
		}else {
			String mId = mDTO.getmId();
			map.put("mId", mId);
			memberService.mPwUpdate(map);
			session.setAttribute("success", "비밀번호가 변경되었습니다.");
			nextPage="redirect:mMyPageForm";
		}
		return nextPage;
	}
	
	//Mypage_pwCheck
	@RequestMapping(value="/mPwCheck", method=RequestMethod.POST)
	@ResponseBody
	public int mPwCheck(@RequestParam String mPasswd,HttpSession session) {
		MemberDTO mDTO= (MemberDTO)session.getAttribute("loginInfo");
		String mId = mDTO.getmId();
		HashMap<String, String> map = new HashMap<>();
		map.put("mId", mId);
		map.put("mPasswd", mPasswd);
		int mPwCheckCnt = memberService.mPwCheck(map);
		return mPwCheckCnt;
	}
	
	
	//전화번호 변경
	@RequestMapping(value= "/mPhoneUpdate", method=RequestMethod.POST)
	public String mPhoneUpdate(@RequestParam HashMap<String, String> map, HttpSession session,HttpServletRequest request) {
		MemberDTO mDTO= (MemberDTO)session.getAttribute("loginInfo");
		String nextPage=null;
		if(mDTO==null) {
			request.setAttribute("fail", "로그인을 해주세요.");
			nextPage = "mLoginForm";
		}else {
			String mId = mDTO.getmId();
			String mPhone1 = map.get("mPhone1");
			String mPhone2 = map.get("mPhone2");
			String mPhone3 = map.get("mPhone3");
			String mPhone = mPhone1+"-"+mPhone2+"-"+mPhone3;
			HashMap<String, String> map2 = new HashMap<>();
			map2.put("mId", mId);
			map2.put("mPhone", mPhone);
			memberService.mPhoneUpdate(map2);
			session.setAttribute("success", "전화번호가 변경되었습니다.");
			nextPage ="redirect:mMyPageForm";
		}
		return nextPage;
	}

	@ResponseBody
    @RequestMapping(value="/mJoinIdCheck", method=RequestMethod.POST)
    public String mJoinIdCheck(HttpServletRequest request, Model model) {
        String mId = request.getParameter("mId");
        int result = memberService.mJoinIdCheck(mId);

        return String.valueOf(result);
    }
	
	@ResponseBody
    @RequestMapping(value="/mJoinNameCheck", method=RequestMethod.POST)
    public String mJoinNameCheck(HttpServletRequest request, Model model) {
        String mName = request.getParameter("mName");
        int result = memberService.mJoinNameCheck(mName);

        return String.valueOf(result);
    }

}
