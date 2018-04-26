package com.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.ShopDAO;
import com.dto.ReviewDTO;
import com.dto.ScoreDTO;

@Service
public class ShopService {
	
	@Autowired
	ShopDAO shopDAO;
	
	@Transactional
	public void reviewWrite(HashMap<String, Object> map) {
		ReviewDTO rdto = shopDAO.chechReview(map);
		List<String> goodKeywordList = (List<String>)map.get("goodKeyword");
		List<String> badKeywordList = (List<String>)map.get("badKeyword");
		if(rdto==null) {
			shopDAO.insertReview(map);
			if(goodKeywordList.size() != 0)shopDAO.insertGoodScore(map);
			if(badKeywordList.size() != 0)shopDAO.insertBadScore(map);
		}else if(rdto != null){
			shopDAO.updateReview(map);
			shopDAO.deleteScore(map);
			if(goodKeywordList.size() != 0)shopDAO.insertGoodScore(map);
			if(badKeywordList.size() != 0)shopDAO.insertBadScore(map);
		}
	}
	
	public List<ReviewDTO> selectReview(String sCode){
		return shopDAO.selectReview(sCode);
	}
	
	@Transactional
	public void deleteReview(HashMap<String, Object> map) {
		shopDAO.deleteReview(map);
		shopDAO.deleteScore(map);
	}
	
	public List<ScoreDTO> selectScore(HashMap<String, Object> map){
		return shopDAO.selectScore(map);
	}

}
