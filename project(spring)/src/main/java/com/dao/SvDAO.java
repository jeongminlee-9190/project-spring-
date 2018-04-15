package com.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.dto.SoDTO;
import com.dto.SvDTO;

@Repository
public class SvDAO {
	@Autowired
	SqlSessionTemplate template;
	
	public void payment(HashMap<String, Object> map) {
		String soId = (String)map.get("soId");
		template.insert("SoMapper.payment",map);
		template.update("SoMapper.soLevelChange",soId);
	}
	
}
