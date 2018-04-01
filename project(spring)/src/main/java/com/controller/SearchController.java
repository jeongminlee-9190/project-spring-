package com.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dto.ReviewDTO;
import com.dto.SearchResultDTO;
import com.dto.ShopDTO;
import com.service.SearchService;

@Controller
public class SearchController {

	@Autowired
	SearchService searchService;
	
	@RequestMapping("/line")
	public String lineInfo() {
		return "station/line";
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
	public String shopTrieve(@RequestParam String sCode, HttpServletRequest request) {
		ShopDTO sdto = searchService.shopRetrieve(sCode);
		String [] images = sdto.getsImage().split("/");
		List<String> shopImages = new ArrayList<>();
		for (String string : images) {
			shopImages.add(string);
		}
//		List<ReviewDTO> list = stService.selectReview(sCode);
		request.setAttribute("shopInfo", sdto);
		request.setAttribute("shopImages", shopImages);
//		request.setAttribute("reviewList", list);
		return "search/shopretrieve0";
	}
	
	
	
	
	
}
