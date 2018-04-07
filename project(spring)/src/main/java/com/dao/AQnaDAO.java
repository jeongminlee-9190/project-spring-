package com.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.AQnaDTO;
import com.dto.QnaReplyDTO;
import com.dto.SoQnaDTO;

@Repository
public class AQnaDAO {
	@Autowired
	SqlSessionTemplate template;
	
	public List<AQnaDTO> qna() {
		return template.selectList("AQnaMapper.qna");
	}
	
	public SoQnaDTO soQnaRetrieve(int qnaNum) {
		return template.selectOne("AQnaMapper.soQnaRetrieve",qnaNum);
	}
	
	public void soQnaRetrieve2(int qnaNum) {
		template.update("AQnaMapper.soQnaRetrieve2",qnaNum);
	}
	
	public void soQnaReply(HashMap<String, Object> map) {
		template.insert("AQnaMapper.soQnaReply",map);
	}
	
	public void soQnaReply2(HashMap<String, Object> map) {
		template.update("AQnaMapper.soQnaReply2",map);
	}
	
	public QnaReplyDTO soQnaReplyRetrieve(int qnaNum) {
		return template.selectOne("AQnaMapper.soQnaReplyRetrieve",qnaNum);
	}
	
	public void soQnaReplyModify(HashMap<String, Object> map) {
		template.update("AQnaMapper.soQnaReplyModify",map);
	}
	
	
/*	public void soQnaWrite(HashMap<String, String> map) {
		template.insert("SoQnaMapper.soQnaWrite",map);
	}
	
	public void soQnaDelete(HashMap<String, Integer> map) {
		template.delete("SoQnaMapper.soQnaDelete",map);
	}
	*/

	
}
