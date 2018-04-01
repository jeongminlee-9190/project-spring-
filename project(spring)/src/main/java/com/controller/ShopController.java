package com.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.service.ShopService;

@Controller
public class ShopController {
	
	@Autowired
	ShopService shopService;
	
	@RequestMapping("/interest")
	@ResponseBody String interest(@RequestParam String sCode, @RequestParam String mId) {
		String iCode = mId+sCode;
		HashMap<String, String> map = new HashMap<>();
		map.put("iCode", iCode);
		map.put("mId", mId);
		map.put("sCode", sCode);
		
		
		return shopService.interest(map);
	}
	
	@RequestMapping("/isInterest")
	@ResponseBody String isInterest(@RequestParam String sCode, @RequestParam String mId) {
		String iCode = mId+sCode;
		HashMap<String, String> map = new HashMap<>();
		map.put("iCode", iCode);
		map.put("mId", mId);
		map.put("sCode", sCode);
		return shopService.isInterest(map);
	}
	

}
