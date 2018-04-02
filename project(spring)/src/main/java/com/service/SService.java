package com.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.SDAO;
import com.dto.SDTO;

@Service
public class SService {
	@Autowired
	SDAO dao;
	
	public SDTO sInfo(String soId) {
		return dao.sInfo(soId);
	}
	
	public void SInfoEnroll(SDTO dto) {
		dao.SInfoEnroll(dto);
	}

}
