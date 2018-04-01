package com.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.SearchDAO;
import com.dto.SearchResultDTO;
import com.dto.ShopDTO;

@Service
public class SearchService {
	
	@Autowired
	SearchDAO searchDAO;
	
	public List<SearchResultDTO> search(HashMap<String, Object> map){
		return searchDAO.search(map);
	}
	
	public ShopDTO shopRetrieve(String sCode) {
		return searchDAO.shopRetrieve(sCode);
	}

}
