package com.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
}
