package com.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.MemberDTO;
import com.dto.SoDTO;

@Repository
public class MemberDAO {
	
	@Autowired
	SqlSessionTemplate template;
	
	public MemberDTO login(HashMap<String, String> map) {
		template.update("MemberMapper.mLastLogin",map);
		return template.selectOne("MemberMapper.login",map);
	}
	
	public void memberAdd(HashMap<String, String> map) {
		System.out.println(map);
	
		
		template.insert("MemberMapper.memberAdd",map);
		template.insert("MemberMapper.pointAdd",map);
	}
	
	public MemberDTO mMyPage(String mId) {
		MemberDTO mDTO = template.selectOne("MemberMapper.mMyPage",mId);
		return mDTO;
	}
	
	public void mPwUpdate(HashMap<String, String> map) {
		template.update("MemberMapper.mPwUpdate",map);
	}	
	public int mPwCheck(HashMap<String, String> map) {
		return template.selectOne("MemberMapper.mPwCheck",map);
	}
	
	public void mPhoneUpdate(HashMap<String, String> map) {
		template.update("MemberMapper.mPhoneUpdate",map);
	}
	
	public int mJoinIdCheck(String mIdChk) {
		return template.selectOne("MemberMapper.mJoinIdCheck",mIdChk);
	}
	
	public int mJoinNameCheck(String mNameChk) {
		return template.selectOne("MemberMapper.mJoinNameCheck",mNameChk);
	}
	
	public String findmId(HashMap<String, String> map) {
		String mId = template.selectOne("MemberMapper.findmId",map);
		return mId;
	}
	
	public String findmPasswd(HashMap<String, String> map) {
		String mPasswd = template.selectOne("MemberMapper.findmPasswd",map);
		return mPasswd;
	}

}
