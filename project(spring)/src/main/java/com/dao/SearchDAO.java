package com.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.SearchResultDTO;
import com.dto.ShopDTO;

@Repository
public class SearchDAO {

	@Autowired
	SqlSessionTemplate template;
	
	public List<SearchResultDTO> search(HashMap<String, Object> map){
		return template.selectList("ShopMapper.search", map);
	}
	
	public ShopDTO shopRetrieve(String sCode) {
		return template.selectOne("ShopMapper.selectShop",sCode);
	}
	
	
}
