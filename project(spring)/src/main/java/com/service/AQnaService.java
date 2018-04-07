package com.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.AQnaDAO;
import com.dto.AQnaDTO;
import com.dto.QnaReplyDTO;
import com.dto.SoQnaDTO;

@Service
public class AQnaService {
	@Autowired
	AQnaDAO dao;
	
	public List<AQnaDTO> qna() {
		return dao.qna();
	}
	
	public SoQnaDTO soQnaRetrieve(int qnaNum) {
		return dao.soQnaRetrieve(qnaNum);
	}
	
	public void soQnaRetrieve2(int qnaNum) {
		dao.soQnaRetrieve2(qnaNum);
	}
	
	
	@Transactional
	public void soQnaReply(HashMap<String, Object> map) {
		dao.soQnaReply(map);
		dao.soQnaReply2(map);
	}
	
	public QnaReplyDTO soQnaReplyRetrieve(int qnaNum) {
		return dao.soQnaReplyRetrieve(qnaNum);
	}
	
	public void soQnaReplyModify(HashMap<String, Object> map) {
		dao.soQnaReplyModify(map);
	}
	
	/*public List<SoQnaDTO> soQna(String soId){
		return dao.soQna(soId);
	}
	
	public void soQnaWrite(HashMap<String, String> map) {
		dao.soQnaWrite(map);
	}
	
	public void soQnaDelete(HashMap<String, Integer> map) {
		dao.soQnaDelete(map);
	}*/
}
