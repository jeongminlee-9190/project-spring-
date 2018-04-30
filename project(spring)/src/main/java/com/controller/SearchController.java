package com.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dto.ReviewDTO;
import com.dto.SDTO;
import com.dto.ScoreDTO;
import com.dto.SearchResultDTO;
import com.dto.ShopDTO;
import com.service.SService;
import com.service.SearchService;
import com.service.ShopService;

@Controller
public class SearchController {

	@Autowired
	SearchService searchService;
	
	@Autowired
	SService sService;
	
	@Autowired
	ShopService shopService;
	
	@RequestMapping("/line")
	public String lineInfo() {
		return "station/line";
	}
	
	@RequestMapping("/interest")
	@ResponseBody public String interest(@RequestParam String sCode, @RequestParam String mId) {
		String iCode = mId+sCode;
		HashMap<String, String> map = new HashMap<>();
		map.put("iCode", iCode);
		map.put("mId", mId);
		map.put("sCode", sCode);
		return searchService.interest(map);
	}
	
	@RequestMapping("/isInterest")
	@ResponseBody public String isInterest(@RequestParam String sCode, @RequestParam String mId) {
		String iCode = mId+sCode;
		HashMap<String, String> map = new HashMap<>();
		map.put("iCode", iCode);
		map.put("mId", mId);
		map.put("sCode", sCode);
		return searchService.isInterest(map);
	}
	
	@RequestMapping("/search")
	public String search(@RequestParam String station, 
			@RequestParam("search") String keywords,
			HttpServletRequest request) {
		String[] keywordsArray = keywords.split(",");
		List<String> keywordsList = new ArrayList<>();
		if(keywords == "") {
			keywordsList=null;
		}else {
			for(int i=0; i<keywordsArray.length; i++) {
				keywordsList.add(keywordsArray[i]);
			}
		}
		HashMap<String, Object> map = new HashMap<>();
		map.put("station", station);
		map.put("keyword", keywordsList);
		List<SearchResultDTO> srDTO = searchService.search(map);
		request.setAttribute("shopList", srDTO);
		return "search/searchpage0";
	}
	
	@RequestMapping("/shopRetrieve")
	public String shopRetrieve(@RequestParam String sCode, @RequestParam String mName, HttpServletRequest request, HttpSession session) {
		ShopDTO sdto = searchService.shopRetrieve(sCode);
		
		SDTO sdto2 = sService.sInfo2(sCode);
		String [] images = sdto.getsImage().split("/");
		List<String> shopImages = new ArrayList<>();
		
		for (String string : images) {
			shopImages.add(string);
		}
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("sCode", sCode);
		map.put("mName", mName);
		List<ReviewDTO> rList = shopService.selectReview(sCode);
		List<ScoreDTO> sList = shopService.selectScore(map);
		
		session.setAttribute("sInfo", sdto2);
		request.setAttribute("shopImages", shopImages);
		request.setAttribute("reviewList", rList);
		request.setAttribute("scoreList", sList);
		return "member/sView";
	}
	
}
