package com.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.SDAO;
import com.dto.SDTO;

@Service
public class SService {
	@Autowired
	SDAO dao;
	
	public SDTO sInfo(String soId) {
		return dao.sInfo(soId);
	}
	
	public SDTO sInfo2(String sCode) {
		return dao.sInfo2(sCode);
	}
	
	@Transactional
	public void SInfoEnroll(SDTO dto) {
		dao.SInfoEnroll(dto);
		//dao.sScoreInsert(dto.getsCode());
	}
	
	public void sInfoUpdate(HashMap<String, String> map) {
		dao.sInfoUpdate(map);
	}
	
/*	public void sScoreInsert(String sCode) {
		System.out.println("sScoreInsert SService 접근"+sCode);
		dao.sScoreInsert(sCode);
	}*/
	
	public void sImageAdd(HashMap<String, String> map) {
		dao.sImageAdd(map);
	}
	
	public void sImageAdd2(HashMap<String, String> map) {
		dao.sImageAdd2(map);
	}
	
	@Transactional
	public void sDelAll(HashMap<String, String> map) {
		dao.sDelAll(map);
	}
}
