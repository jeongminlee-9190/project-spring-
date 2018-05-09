package com.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dto.ReviewDTO;
import com.dto.ScoreDTO;
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
	public String reviewWrite(ReviewParameterDTO rpDTO, RedirectAttributes attr) {
		
		HashMap<String, Object> keywordMap = new HashMap<>();
		String[] keywords = rpDTO.getFavorKeywords();
		List<String> goodKeywordList = new ArrayList<>();
		List<String> badKeywordList = new ArrayList<>();
		
		if(keywords != null) {
			for (String keyword : keywords) {
				String[] devideKeyword = keyword.split("/");
				if(devideKeyword[0].equals("good")) {
					goodKeywordList.add(devideKeyword[1]);
				}else {
					badKeywordList.add(devideKeyword[1]);
				}
			}
		}
		
		keywordMap.put("sCode", rpDTO.getsCode());
		keywordMap.put("reviewContent", rpDTO.getReviewContent());
		keywordMap.put("mName", rpDTO.getmName());
		keywordMap.put("goodKeyword", goodKeywordList);
		keywordMap.put("badKeyword", badKeywordList);
		
<<<<<<< HEAD
		System.out.println(rpDTO.getsCode());
		System.out.println(rpDTO.getmName());
		System.out.println(goodKeywordList);
		System.out.println(badKeywordList);
		
=======
>>>>>>> branch 'master' of https://github.com/jeongminlee-9190/project-spring-.git
		shopService.reviewWrite(keywordMap);
		
		ShopDTO sdto = searchService.shopRetrieve(rpDTO.getsCode());
		String [] images = sdto.getsImage().split("/");
		List<String> shopImages = new ArrayList<>();
		for (String string : images) {
			shopImages.add(string);
		}
		
		List<ReviewDTO> rList = shopService.selectReview(rpDTO.getsCode());
		List<ScoreDTO> sList = shopService.selectScore(keywordMap);
		
		attr.addFlashAttribute("shopInfo", sdto);
		attr.addFlashAttribute("shopImages", shopImages);
		attr.addFlashAttribute("reviewList", rList);
		attr.addFlashAttribute("scoreList", sList);
		
		String encodingMname = null;
		try {
			encodingMname = URLEncoder.encode(rpDTO.getmName(), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		return "redirect: http://localhost:8090/controller/shopRetrieve?sCode="+rpDTO.getsCode()+"&mName="+encodingMname;
		
	}
	
	@RequestMapping(value="/deleteReview")
	@ResponseBody
	public void deleteReview(@RequestBody HashMap<String, Object> map) {
		shopService.deleteReview(map);
	}
	
	@RequestMapping(value="/countInterest")
	@ResponseBody
	public String countInterest(@RequestBody HashMap<String, Object> map) {
		String sCode = (String)map.get("sCode");
		return shopService.countInterest(sCode);
	}
	
//	@RequestMapping(value="/myFavorite")
//	@ResponseBody
//	List<ShopDTO> selectMyFavorite(){
//	}
	
	@RequestMapping(value="/myInterest", method=RequestMethod.GET)
	@ResponseBody List<ShopDTO> myInterest(String mId) {
		List<ShopDTO> shopList = shopService.myInterest(mId);
		return shopList;
	}
	
	@RequestMapping(value="/myReview", method=RequestMethod.GET)
	@ResponseBody List<ShopDTO> myReview(String mName){
		List<ShopDTO> shopList = shopService.myReview(mName);
		return shopList;
	}
	
	@RequestMapping(value="/countMyFavorit", method=RequestMethod.GET)
	@ResponseBody HashMap<String, String> countMyFavorite(String mId, String mName) {
		return shopService.countMyFavorite(mId, mName);
	}

}
