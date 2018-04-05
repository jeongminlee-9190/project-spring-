package com.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.InterestDTO;
import com.dto.SearchResultDTO;
import com.dto.ShopDTO;

@Repository
public class SearchDAO {

	@Autowired
	SqlSessionTemplate template;
	
	public InterestDTO isInterest(HashMap<String, String> map) {
		return template.selectOne("SearchMapper.isInterest", map);
	}
	
	public void insertInterest(HashMap<String, String> map) {
		template.insert("SearchMapper.insertInterest",map);
	}
	
	public void deleteInterest(HashMap<String, String> map) {
		template.delete("SearchMapper.deleteInterest",map);
	}
	
	public List<SearchResultDTO> search(HashMap<String, Object> map){
		return template.selectList("SearchMapper.search", map);
	}
	
	public ShopDTO shopRetrieve(String sCode) {
		return template.selectOne("SearchMapper.selectShop",sCode);
	}
	
	
}
