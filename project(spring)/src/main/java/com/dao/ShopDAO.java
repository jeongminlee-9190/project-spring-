package com.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.ReviewDTO;
import com.dto.ScoreDTO;
import com.dto.ShopDTO;

@Repository
public class ShopDAO {
	
	@Autowired
	SqlSessionTemplate template;
	
	public List<ReviewDTO> selectReview(String sCode) {
		return template.selectList("ShopMapper.selectReview", sCode);
	}
	
	public void insertReview(HashMap<String, Object> map) {
		template.insert("ShopMapper.insertReview", map);
	}
	
	public ReviewDTO chechReview(HashMap<String, Object> map) {
		return template.selectOne("ShopMapper.checkReview",map);
	}
	
	public void updateReview(HashMap<String, Object> map) {
		template.update("ShopMapper.updateReview", map);
	}
	
	public void deleteReview(HashMap<String, Object> map) {
		template.delete("ShopMapper.deleteReview", map);
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
	
	public List<ScoreDTO> selectScore(HashMap<String, Object> map) {
		return template.selectList("ShopMapper.selectScore", map);
	}
	
	public List<ShopDTO> selectMyFavorite(String mId){
		return template.selectList("ShopMapper.selectShop", mId);
	}
	
	

}
