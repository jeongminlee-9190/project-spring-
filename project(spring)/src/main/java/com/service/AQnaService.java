package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.AQnaDAO;
import com.dto.AQnaDTO;

@Service
public class AQnaService {
	@Autowired
	AQnaDAO dao;
	
	public List<AQnaDTO> qna() {
		return dao.qna();
	}
	/*public List<SoQnaDTO> soQna(String soId){
		return dao.soQna(soId);
	}
	
	public void soQnaWrite(HashMap<String, String> map) {
		dao.soQnaWrite(map);
	}
	
	public void soQnaDelete(HashMap<String, Integer> map) {
		dao.soQnaDelete(map);
	}*/
}
