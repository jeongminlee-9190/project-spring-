package com.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.ReviewDTO;

@Repository
public class ShopDAO {
	
	@Autowired
	SqlSessionTemplate template;
	
	public void insertReview(HashMap<String, Object> map) {
		template.insert("ShopMapper.insertReview", map);
	}
	
	public ReviewDTO chechReview(HashMap<String, Object> map) {
		return template.selectOne("ShopMapper.checkReview",map);
	}
	
	public void updateReview(HashMap<String, Object> map) {
		template.update("ShopMapper.updateReview", map);
	}
	
	public void insertGoodScore(HashMap<String, Object> map) {
		template.insert("ShopMapper.insertGoodScore", map);
	}
	
	public void insertBadScore(HashMap<String, Object> map) {
		template.insert("ShopMapper.insertBadScore", map);
	}
	
	public void deleteScore(HashMap<String, Object> map) {
		template.delete("ShopMapper.deleteScore", map);
	}
	
	

}