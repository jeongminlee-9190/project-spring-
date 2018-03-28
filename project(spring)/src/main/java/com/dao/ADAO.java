package com.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.dto.AdminDTO;
import com.dto.MemberDTO;

@Repository
public class ADAO {
	@Autowired
	SqlSessionTemplate template;
	
	public AdminDTO login(HashMap<String, String> map) {
		return template.selectOne("AdminMapper.adminlogin",map);
	}
	
	public List<Object> memberList() {
		return template.selectList("AdminMapper.memberlist");
	}
	
	public List<Object> soList() {
		return template.selectList("AdminMapper.soList");
	}
	
	public void changeSoLevel(HashMap<String, String> map) {
		template.update("AdminMapper.soLevelChange",map);
	}
}
