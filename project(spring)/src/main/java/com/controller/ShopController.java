package com.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dto.parameter.ReviewParameterDTO;
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
	
	@RequestMapping("/reviewWrite")
	void reviewWrite(ReviewParameterDTO rpDTO) {
		
//		HashMap<String, String> reviewMap = new HashMap<>();
//		reviewMap.put("reviewContent", rpDTO.getReviewContent());
//		reviewMap.put("mName", rpDTO.getmName());
//		reviewMap.put("sCode", rpDTO.getsCode());
		
		HashMap<String, String> keywordMap = new HashMap<>();
		String[] keywords = rpDTO.getFavorKeywords();
		List<String> keywordList = new ArrayList<>();
		for (String keyword : keywords) {
			String[] devideKeyword = keyword.split(",");
			
			keywordMap.put(devideKeyword[1], devideKeyword[0]);
		}
		keywordMap.put("sCode", rpDTO.getsCode());
		keywordMap.put("reviewContent", rpDTO.getReviewContent());
		keywordMap.put("mName", rpDTO.getmName());
	}
	

}
