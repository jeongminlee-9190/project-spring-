package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.AQnaDTO;
import com.dto.AQnaPageDTO;
import com.dto.MPageDTO;
import com.dto.QnaReplyDTO;
import com.dto.SoQnaDTO;

@Repository
public class AQnaDAO {
	@Autowired
	SqlSessionTemplate template;
	
	public AQnaPageDTO aQnaList(HashMap<String, String> map,int curPage) {
		AQnaPageDTO aqnapageDTO = new AQnaPageDTO();
		//목록은 0부터 시작
		int start = (curPage-1)*aqnapageDTO.getPerPage(); //페이징 시작 글 번호
		List<AQnaPageDTO> list =null;  //게시판 목록
		
		int totalCnt=0;
		String searchName = map.get("searchName");
		String searchName2 = map.get("searchName2");
		
		if((searchName==null || searchName=="") &&(searchName=="" || searchName2==null)) {//searchValue값이 없는 상태로 검색을 누르면 전체목록 보여주기
			System.out.println("aQnaList searchName: "+searchName+"searchName2: "+searchName2);
			list= template.selectList("AQnaMapper.aQnaList",map,new RowBounds(start ,aqnapageDTO.getPerPage()));
			totalCnt=aQnaListTotalCount();
		}else if((searchName!=null || searchName!="") && (searchName2==null || searchName2=="")){
			System.out.println("aQnaSort1 searchName: "+searchName+"searchName2: "+searchName2);
			list= template.selectList("AQnaMapper.aQnaSort1",map,new RowBounds(start ,aqnapageDTO.getPerPage()));
			totalCnt=aQnaListTotalSearchCount(map);
		}
		else if((searchName==null || searchName=="")&& (searchName2!=null||searchName2!="")){
			System.out.println("aQnaSort3 searchName: "+searchName+"searchName2: "+searchName2);
			list= template.selectList("AQnaMapper.aQnaSort3",map,new RowBounds(start ,aqnapageDTO.getPerPage()));
			totalCnt=aQnaListTotalSearchCount3(map);
		}
		else if((searchName!=null || searchName!="") && (searchName2!=null || searchName2!="")){
			System.out.println("aQnaSort2 searchName: "+searchName+"searchName2: "+searchName2);
			list= template.selectList("AQnaMapper.aQnaSort2",map,new RowBounds(start ,aqnapageDTO.getPerPage()));
			totalCnt=aQnaListTotalSearchCount2(map);
		}
		else {
			System.out.println("aQnaSort3 searchName: "+searchName+"searchName2: "+searchName2);
			list= template.selectList("AQnaMapper.aQnaSort3",map,new RowBounds(start ,aqnapageDTO.getPerPage()));
			totalCnt=aQnaListTotalSearchCount3(map);
		}
		aqnapageDTO.setList(list);
		aqnapageDTO.setCurPage(curPage);
		aqnapageDTO.setTotalCnt(totalCnt);
		return aqnapageDTO;
	}
	
	public int aQnaListTotalCount(){
		return template.selectOne("AQnaMapper.aQnaListTotalCount");
	}

	public int aQnaListTotalSearchCount(HashMap<String, String> map){
		return template.selectOne("AQnaMapper.aQnaListTotalSearchCount",map);
	}
	
	public int aQnaListTotalSearchCount2(HashMap<String, String> map){
		return template.selectOne("AQnaMapper.aQnaListTotalSearchCount2",map);
	}
	
	public int aQnaListTotalSearchCount3(HashMap<String, String> map){
		return template.selectOne("AQnaMapper.aQnaListTotalSearchCount3",map);
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
