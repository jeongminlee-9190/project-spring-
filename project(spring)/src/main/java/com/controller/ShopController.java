package com.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dto.ShopDTO;
import com.dto.parameter.ReviewParameterDTO;
import com.service.SearchService;
import com.service.ShopService;

@Controller
public class ShopController {
	
	@Autowired
	ShopService shopService;
	
	@Autowired
	SearchService searchService;
	
	@RequestMapping("/reviewWrite")
	String reviewWrite(ReviewParameterDTO rpDTO, HttpServletRequest request) {
		
		HashMap<String, Object> keywordMap = new HashMap<>();
		String[] keywords = rpDTO.getFavorKeywords();
		List<String> goodKeywordList = new ArrayList<>();
		List<String> badKeywordList = new ArrayList<>();
		for (String keyword : keywords) {
			String[] devideKeyword = keyword.split(",");
			if(devideKeyword[0].equals("good")) {
				goodKeywordList.add(devideKeyword[1]);
			}else {
				badKeywordList.add(devideKeyword[1]);
			}
		}
		keywordMap.put("sCode", rpDTO.getsCode());
		keywordMap.put("reviewContent", rpDTO.getReviewContent());
		keywordMap.put("mId", rpDTO.getmId());
		keywordMap.put("goodKeyword", goodKeywordList);
		keywordMap.put("badKeyword", badKeywordList);
		shopService.reviewWrite(keywordMap);
		
		ShopDTO sdto = searchService.shopRetrieve(rpDTO.getsCode());
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
