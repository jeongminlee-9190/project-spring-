package com.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.SvDAO;
import com.dto.SvPageDTO;
@Service
public class SvService {
	@Autowired
	SvDAO dao;
	
	@Transactional
	public void payment(HashMap<String, Object> map) {
		dao.payment(map);
	}
	
	
	public SvPageDTO soPaymentList(HashMap<String, String> map, int curPage){
		return dao.soPaymentList(map,curPage);
	}
}
