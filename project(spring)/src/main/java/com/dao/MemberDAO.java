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
		template.update("MemberMapper.mLastLogin",map);
		return template.selectOne("MemberMapper.login",map);
	}
	
	public void memberAdd(HashMap<String, String> map) {
		template.insert("MemberMapper.memberAdd",map);
	}
	
	public int mJoinIdCheck(String mIdChk) {
		return template.selectOne("MemberMapper.mJoinIdCheck",mIdChk);
	}
	
	public int mJoinNameCheck(String mNameChk) {
		return template.selectOne("MemberMapper.mJoinNameCheck",mNameChk);
	}

}
