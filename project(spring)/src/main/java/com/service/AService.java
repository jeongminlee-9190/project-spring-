package com.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ADAO;
import com.dto.AdminDTO;
import com.dto.MPageDTO;
import com.dto.SPageDTO;
import com.dto.SoPageDTO;

@Service
public class AService {
	@Autowired
	ADAO dao;
	
	public AdminDTO login(HashMap<String, String> map) {
		return dao.login(map);
	}
	
	public MPageDTO mList(HashMap<String, String> map,int curPage) {
		return dao.mList(map, curPage);
	}
	
	public int mListTotalCount(){
		return dao.mListTotalCount();
	}
	
	public MPageDTO mDormantList(int curPage) {
		return dao.mDormantList(curPage);
	}
	
	public int mDormantListTotalCount(){
		return dao.mDormantListTotalCount();
	}
	
	public void mDormantDel(String mId) {
		dao.mDormantDel(mId);
	}
	
	
	/////////////////////////////////////////////////////////////////////////////////
	public SoPageDTO soList(HashMap<String, String> map,int curPage) {
		return dao.soList(map, curPage);
	}
	
	public int soListTotalCount(){
		return dao.sListTotalCount();
	}
	
	public List<Object> soList2() {
		return dao.soList2();
	}
	
	public int soList2TotalCount(){
		return dao.soList2TotalCount();
	}

	public void soApprove(String soId) {
		dao.soApprove(soId);
	}
	
	public SoPageDTO soDormantList(int curPage) {
		return dao.soDormantList(curPage);
	}
	
	public int soDormantListTotalCount(){
		return dao.soDormantListTotalCount();
	}
	
	public void soDormantDel(String soId) {
		dao.soDormantDel(soId);
	}
	
	public void soApprove(HashMap<String, String> map) {
		
	}
	
	public void changeSoLevel(HashMap<String, String> map) {
		dao.changeSoLevel(map);
	}
	
	public SPageDTO sList(HashMap<String, String> map,int curPage) {
		return dao.sList(map, curPage);
	}
	
	public int sListTotalCount(){
		return dao.sListTotalCount();
	}
}
