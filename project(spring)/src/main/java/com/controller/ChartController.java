package com.controller;

import java.util.List;

import org.apache.ibatis.annotations.AutomapConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.dto.ChartDTO;
import com.service.ChartService;

@Controller
public class ChartController {
	@Autowired
	ChartService service;
	

}
