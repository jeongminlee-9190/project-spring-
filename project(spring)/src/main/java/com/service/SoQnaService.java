package com.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.SoQnaDAO;
import com.dto.SoQnaDTO;

@Service
public class SoQnaService {
	@Autowired
	SoQnaDAO dao;
	
	public List<SoQnaDTO> soQna(String soId){
		return dao.soQna(soId);
	}
	
	public void soQnaWrite(HashMap<String, String> map) {
		dao.soQnaWrite(map);
	}
	
	public void soQnaDelete(HashMap<String, Integer> map) {
		dao.soQnaDelete(map);
	}
}
