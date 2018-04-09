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
import com.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService memberService;
	
	@RequestMapping("/main")
	public String main() {
		return "main";
	}
	
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
		return "search/login";
	}
	
	@RequestMapping("/login")
	public ModelAndView login(@RequestParam HashMap<String, String> map,
			HttpSession session, ModelAndView mav) {
		MemberDTO mDTO = memberService.login(map);
		if(mDTO==null) {
			mav.addObject("mesg", "로그인에 실패했네요");
			mav.setViewName("/search/login");
		}else {
		session.setAttribute("loginInfo", mDTO);
		mav.setViewName("main0");
		}
		return mav;
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "main0";
	}
	
	@RequestMapping(value="/mJoin",  method=RequestMethod.POST)
	public String memberAdd(@RequestParam HashMap<String, String> map, HttpServletRequest request) {
		String mPhone1 = map.get("mPhone1");
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

	@ResponseBody
    @RequestMapping(value="/mJoinForm", method=RequestMethod.POST)
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
