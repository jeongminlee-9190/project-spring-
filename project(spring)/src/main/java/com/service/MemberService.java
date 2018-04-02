package com.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.MemberDAO;
import com.dto.MemberDTO;

@Service
public class MemberService {
	
	@Autowired
	MemberDAO memberDAO;
	
	public MemberDTO login(HashMap<String, String> map) {
		return memberDAO.login(map);
	}


}
