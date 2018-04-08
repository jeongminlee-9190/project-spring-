package com.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.dao.SoDAO;
import com.dto.SoDTO;
@Service
public class SoService {
	@Autowired
	SoDAO dao;
	
	public SoDTO login(HashMap<String, String> map) {
		SoDTO sDTO = dao.login(map);
		return sDTO;
	}
	public String findSoId(HashMap<String, String> map) {
		String soId = dao.findSoId(map);
		return soId;
	}
	public String findSoPasswd(HashMap<String, String> map) {
		return dao.findSoPasswd(map);
	}
	public void soJoin(HashMap<String, String> map) {
		dao.soJoin(map);
	}
	public int soIdCheck(String soId) {
		return dao.soIdCheck(soId);
	}
	public SoDTO soMyPage(String soId) {
		return dao.soMyPage(soId);
	}
	public void soPhoneUpdate(@RequestParam HashMap<String, String> map) {
		dao.soPhoneUpdate(map);
	}
}
