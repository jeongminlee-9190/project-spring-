package com.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.dto.SDTO;

@Repository
public class SDAO {
	@Autowired
	SqlSessionTemplate template;
	
	public SDTO sInfo(String soId) {
		return template.selectOne("SMapper.sInfo",soId);
	}
	
	public void SInfoEnroll(SDTO dto) {
		template.insert("SMapper.sAdd",dto);
	}
	
	public void sScoreInsert(String sCode) {
		System.out.println("sScoreInsert SDAO 접근"+sCode);
		template.insert("SMapper.sScoreInsert",sCode);
	}
	
	public void sDelAll(String sCode) {
		System.out.println("DAO_sDelAll시작");
		//template.delete("SMapper.sDelScore",sCode);
		//template.delete("SMapper.sDelInterest",sCode);
		//template.delete("SMapper.sDelReview",sCode);
		template.delete("SMapper.sDel",sCode);
		
	}
	
	public void sImageAdd(HashMap<String, String> map) {
		template.update("SMapper.sImageAdd",map);
	}
	
	public void sImageAdd2(HashMap<String, String> map) {
		template.update("SMapper.sImageAdd2",map);
	}
}
