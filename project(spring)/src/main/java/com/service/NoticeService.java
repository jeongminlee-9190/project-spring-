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
	
	public PageDTO soNoticeList(HashMap<String, String> map, int curPage){
		System.out.println("map: "+map+" curPage: "+curPage);
		System.out.println("soNoticeList service접근");
		return dao.soNoticeList(map,curPage);
	}
	
	public void soNoticeWrite(NoticeDTO dto){
		dao.soNoticeWrite(dto);
	}
	
	public NoticeDTO soNoticeRetrieve(int num){
		return dao.soNoticeRetrieve(num);
	}
	
	public void soNoticeDelete(int num){
		dao.soNoticeDelete(num);
	}
	
	public void soNoticeUpdate(NoticeDTO dto){
		dao.soNoticeUpdate(dto);
	}
}
