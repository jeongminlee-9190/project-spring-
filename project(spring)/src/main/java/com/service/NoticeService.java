package com.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.NoticeDAO;
import com.dto.NoticeDTO;
import com.dto.PageDTO;

@Service
public class NoticeService {
	@Autowired
	NoticeDAO dao;
	
	//////////////////////////////////////////////////////////////////////////////////////////////////
	public PageDTO soNoticeList(HashMap<String, String> map, int curPage){
		return dao.soNoticeList(map,curPage);
	}
	public PageDTO soNoticeList2(HashMap<String, String> map, int curPage){
		return dao.soNoticeList2(map,curPage);
	}
	
	public void soNoticeWrite(NoticeDTO dto){
		dao.soNoticeWrite(dto);
	}
	
	public NoticeDTO soNoticeRetrieve(int num){
		return dao.soNoticeRetrieve(num);
	}
	
	public NoticeDTO soNoticeRetrieve2(int num){
		return dao.soNoticeRetrieve2(num);
	}
	
	public void soNoticeDelete(int num){
		dao.soNoticeDelete(num);
	}
	
	public void soNoticeUpdate(NoticeDTO dto){
		dao.soNoticeUpdate(dto);
	}
	
	//////////////////////////////////////////////////////////////////////////////////////////////////
	public PageDTO mNoticeList(HashMap<String, String> map, int curPage){
		return dao.mNoticeList(map,curPage);
	}
	
	public PageDTO mNoticeList2(HashMap<String, String> map, int curPage){
		return dao.mNoticeList2(map,curPage);
	}
	
	public void mNoticeWrite(NoticeDTO dto){
		System.out.println("mNoticeWrite service");
		dao.mNoticeWrite(dto);
	}
	
	public NoticeDTO mNoticeRetrieve(int num){
		return dao.mNoticeRetrieve(num);
	}
	
	public NoticeDTO mNoticeRetrieve2(int num){
		return dao.mNoticeRetrieve2(num);
	}
	
	public void mNoticeDelete(int num){
		dao.mNoticeDelete(num);
	}
	
	public void mNoticeUpdate(NoticeDTO dto){
		dao.mNoticeUpdate(dto);
	}
}
