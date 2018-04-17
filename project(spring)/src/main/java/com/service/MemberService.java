package com.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.MemberDAO;
import com.dto.MemberDTO;

@Service
public class MemberService {
	
	@Autowired
	MemberDAO memberDAO;
	
	@Transactional
	public MemberDTO login(HashMap<String, String> map) {
		return memberDAO.login(map);
	}
	
	public void memberAdd(HashMap<String, String> map) {
		memberDAO.memberAdd(map);
	}
	
	public int mJoinIdCheck(String mIdChk) {
		return memberDAO.mJoinIdCheck(mIdChk);
	}
	
	public int mJoinNameCheck(String mNameChk) {
		return memberDAO.mJoinNameCheck(mNameChk);
	}


}
