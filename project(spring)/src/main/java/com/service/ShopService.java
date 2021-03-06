package com.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.ShopDAO;
import com.dto.ReviewDTO;
import com.dto.ScoreDTO;
import com.dto.ShopDTO;

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
	
	public List<ShopDTO> selectMyFavorite(String mId){
		return shopDAO.selectMyFavorite(mId);
	}

	public String countInterest(String sCode) {
		return shopDAO.countInterest(sCode);
	}
	
	@Transactional
	public List<ShopDTO> myInterest(String mId) {
		List<String> sCodeList = shopDAO.myInterest(mId);
		return shopDAO.myShop(sCodeList);
	}
	
	@Transactional
	public List<ShopDTO> myReview(String mName){
		List<String> sCodeList = shopDAO.myReview(mName);
		return shopDAO.myShop(sCodeList);
	}
	
	public HashMap<String, String> countMyFavorite(String mId, String mName) {
		String myInterestCnt = String.valueOf(shopDAO.myInterest(mId).size());
		String myReviewCnt = String.valueOf(shopDAO.myReview(mName).size());
		HashMap<String, String> CntMap = new HashMap<>();
		CntMap.put("myInterestCnt", myInterestCnt);
		CntMap.put("myReviewCnt", myReviewCnt);
		return CntMap;
	}
}
