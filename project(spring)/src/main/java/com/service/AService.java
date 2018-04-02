package com.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ADAO;
import com.dto.AdminDTO;

@Service
public class AService {
	@Autowired
	ADAO dao;
	
	public AdminDTO login(HashMap<String, String> map) {
		return dao.login(map);
	}
	
	public List<Object> memberList() {
		return dao.memberList();
	}
	
	public List<Object> soList() {
		return dao.soList();
	}
	
	public List<Object> soList2() {
		return dao.soList2();
	}
	
	public void changeSoLevel(HashMap<String, String> map) {
		dao.changeSoLevel(map);
	}
}
