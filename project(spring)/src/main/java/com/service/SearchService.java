package com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.SearchDAO;

@Service
public class SearchService {
	
	@Autowired
	SearchDAO searchDAO;

}
