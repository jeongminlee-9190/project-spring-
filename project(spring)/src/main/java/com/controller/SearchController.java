package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.service.SearchService;

@Controller
public class SearchController {

	@Autowired
	SearchService searchService;
	
	
	
}
