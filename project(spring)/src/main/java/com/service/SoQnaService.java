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
	
	public List<SoQnaDTO> soQna(HashMap<String, String> map){
		return dao.soQna(map);
	}
	
	public void soQnaWrite(HashMap<String, String> map) {
		dao.soQnaWrite(map);
	}
	
	public void soQnaDelete(HashMap<String, Integer> map) {
		dao.soQnaDelete(map);
	}
	
	public void soQnaModify(HashMap<String, Object> map) {
		dao.soQnaModify(map);
	}
	
	public void soQnaRead(int qnaNum) {
		dao.soQnaRead(qnaNum);
	}
}
