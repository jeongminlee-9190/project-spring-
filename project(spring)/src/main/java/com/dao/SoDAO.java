package com.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.dto.SoDTO;

@Repository
public class SoDAO {
	@Autowired
	SqlSessionTemplate template;
	
	public SoDTO login(HashMap<String, String> map) {
		SoDTO sDTO = template.selectOne("SoMapper.login",map);
		return sDTO;
	}
	
	public String findSoId(HashMap<String, String> map) {
		String soId = template.selectOne("SoMapper.findSoId",map);
		return soId;
	}
	
	public String findSoPasswd(HashMap<String, String> map) {
		String soPasswd = template.selectOne("SoMapper.findSoPasswd",map);
		return soPasswd;
	}
	
	public void soJoin(HashMap<String, String> map) {
		template.insert("SoMapper.soJoin",map);
	}
	
	public int soIdCheck(String soId) {
		return template.selectOne("SoMapper.soIdCheck",soId);
	}
	
	public int soLicenseCheck(String soLicense) {
		return template.selectOne("SoMapper.soLicenseCheck",soLicense);
	}
	
	public SoDTO soMyPage(String soId) {
		SoDTO sDTO = template.selectOne("SoMapper.soMyPage",soId);
		return sDTO;
	}
	
	public void soPhoneUpdate(HashMap<String, String> map) {
		template.update("SoMapper.soPhoneUpdate",map);
	}
	
	public void soPwUpdate(HashMap<String, String> map) {
		template.update("SoMapper.soPwUpdate",map);
	}	
	public int soPwCheck(HashMap<String, String> map) {
		return template.selectOne("SoMapper.soPwCheck",map);
	}
}
