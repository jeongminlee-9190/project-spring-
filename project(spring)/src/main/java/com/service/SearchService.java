package com.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.SearchDAO;
import com.dto.InterestDTO;
import com.dto.SearchResultDTO;
import com.dto.ShopDTO;

@Service
public class SearchService {
	
	@Autowired
	SearchDAO searchDAO;
	
	public String interest(HashMap<String, String> map) {
		InterestDTO idto = searchDAO.isInterest(map);
		String interestCheck = "0";
		if(idto == null) {
			searchDAO.insertInterest(map);
			interestCheck = "1";
		}else {
			searchDAO.deleteInterest(map);
		}
		return interestCheck;
	}
	
	public String isInterest(HashMap<String, String> map) {
		InterestDTO idto = searchDAO.isInterest(map);
		String interestCheck = "0";
		if(idto != null) {
			interestCheck = "1";
		}
		return interestCheck;
	}
	
	public List<SearchResultDTO> search(HashMap<String, Object> map){
		return searchDAO.search(map);
	}
	
	public ShopDTO shopRetrieve(String sCode) {
		return searchDAO.shopRetrieve(sCode);
	}

}
