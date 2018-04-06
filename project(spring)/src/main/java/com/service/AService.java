package com.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ADAO;
import com.dto.AdminDTO;
import com.dto.MPageDTO;
import com.dto.SoPageDTO;

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
	
	
	public MPageDTO mDormantList(int curPage) {
		return dao.mDormantList(curPage);
	}
	
	public List<Object> soList() {
		return dao.soList();
	}
	
	public SoPageDTO soDormantList(int curPage) {
		return dao.soDormantList(curPage);
	}
	
	public void changeSoLevel(HashMap<String, String> map) {
		dao.changeSoLevel(map);
	}
}
