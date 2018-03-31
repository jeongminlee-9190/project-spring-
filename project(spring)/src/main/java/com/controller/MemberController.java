package com.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dto.MemberDTO;
import com.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService memberService;
	
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
	
}
