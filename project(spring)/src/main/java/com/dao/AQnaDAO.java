package com.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.AQnaDTO;

@Repository
public class AQnaDAO {
	@Autowired
	SqlSessionTemplate template;
	
	public List<AQnaDTO> qna() {
		return template.selectList("AQnaMapper.qna");
	}
	
	public void soQnaWrite(HashMap<String, String> map) {
		template.insert("SoQnaMapper.soQnaWrite",map);
	}
	
	public void soQnaDelete(HashMap<String, Integer> map) {
		template.delete("SoQnaMapper.soQnaDelete",map);
	}
}
