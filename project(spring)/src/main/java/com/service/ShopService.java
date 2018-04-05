package com.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.ShopDAO;
import com.dto.ReviewDTO;

@Service
public class ShopService {
	
	@Autowired
	ShopDAO shopDAO;
	
	@Transactional
	public void reviewWrite(HashMap<String, Object> map) {
		ReviewDTO rdto = shopDAO.chechReview(map);
		if(rdto==null) {
			shopDAO.insertReview(map);
			if(map.get("goodKeyword")!=null)shopDAO.insertGoodScore(map);
			if(map.get("badKeyword")!=null)shopDAO.insertBadScore(map);
		}else {
			shopDAO.updateReview(map);
			shopDAO.deleteScore(map);
			if(map.get("goodKeyword")!=null)shopDAO.insertGoodScore(map);
			if(map.get("badKeyword")!=null)shopDAO.insertBadScore(map);
		}
	}

}
