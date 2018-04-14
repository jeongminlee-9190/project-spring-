package com.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
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
	
	public int soLicenseCheck(String soLicense) {
		return dao.soLicenseCheck(soLicense);
	}
	
	public SoDTO soMyPage(String soId) {
		return dao.soMyPage(soId);
	}
	public void soPhoneUpdate(@RequestParam HashMap<String, String> map) {
		dao.soPhoneUpdate(map);
	}
	public void soPwUpdate(@RequestParam HashMap<String, String> map) {
		dao.soPwUpdate(map);
	}
	public int soPwCheck(HashMap<String, String> map) {
		return dao.soPwCheck(map);
	}
	
	
	public int soShopCnt(String soId) {
		return dao.soShopCnt(soId);
	}
	public int soReviewCnt(String sCode) {
		return dao.soReviewCnt(sCode);
	}
	public int soInterestCnt(String sCode) {
		return dao.soInterestCnt(sCode);
	}
	public int soScore(String sCode) {
		return dao.soScore(sCode);
	}
	public String soCouponCnt(String sCode) {
		return dao.soCouponCnt(sCode);
	}
	public String soExpireDate(String soId) {
		return dao.soExpireDate(soId);
	}
	
	
	@Transactional
	public void soLeave(HashMap<String, String> map) {
		dao.soLeave(map);
	}
}
