package com.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ShopDAO;
import com.dto.InterestDTO;

@Service
public class ShopService {
	
	@Autowired
	ShopDAO shopDAO;
	
	public String interest(HashMap<String, String> map) {
		InterestDTO idto = shopDAO.isInterest(map);
		String interestCheck = "0";
		if(idto == null) {
			shopDAO.insertInterest(map);
			interestCheck = "1";
		}else {
			shopDAO.deleteInterest(map);
		}
		return interestCheck;
	}
	
	public String isInterest(HashMap<String, String> map) {
		InterestDTO idto = shopDAO.isInterest(map);
		String interestCheck = "0";
		if(idto != null) {
			interestCheck = "1";
		}
		return interestCheck;
	}

}
