package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.SoQnaDTO;

@Repository
public class SoQnaDAO {
	@Autowired
	SqlSessionTemplate template;
	
	public List<SoQnaDTO> soQna(String soId) {
		return template.selectList("SoQnaMapper.soQna",soId);
	}
	
	public void soQnaWrite(HashMap<String, String> map) {
		template.insert("SoQnaMapper.soQnaWrite",map);
	}
}
