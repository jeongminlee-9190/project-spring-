package com.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.MemberDTO;

@Repository
public class MemberDAO {
	
	@Autowired
	SqlSessionTemplate template;
	
	public MemberDTO login(HashMap<String, String> map) {
		return template.selectOne("MemberMapper.login",map);
	}
	
	public void memberAdd(HashMap<String, String> map) {
		template.insert("MemberMapper.memberAdd",map);
	}

}
