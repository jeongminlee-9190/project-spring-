package com.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.InterestDTO;
import com.dto.parameter.ReviewParameterDTO;

@Repository
public class ShopDAO {
	
	@Autowired
	SqlSessionTemplate template;
	
	public InterestDTO isInterest(HashMap<String, String> map) {
		return template.selectOne("ShopMapper.isInterest", map);
	}
	
	public void insertInterest(HashMap<String, String> map) {
		template.insert("ShopMapper.insertInterest",map);
	}
	
	public void deleteInterest(HashMap<String, String> map) {
		template.delete("ShopMapper.deleteInterest",map);
	}
	
	public void insertReview(ReviewParameterDTO dto) {
		template.insert("ShopRetireve.insertReview", dto);
	}

}
