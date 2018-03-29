package com.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.SoDAO;
import com.dao.SvDAO;
import com.dto.SoDTO;
import com.dto.SvDTO;
@Service
public class SvService {
	@Autowired
	SvDAO dao;
	
	public void payment(SvDTO dto) {
		dao.payment(dto);
	}
}
