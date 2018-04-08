package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.AQnaPageDTO;
import com.dto.SoQnaDTO;

@Repository
public class SoQnaDAO {
	@Autowired
	SqlSessionTemplate template;
	
	public List<SoQnaDTO> soQna(HashMap<String, String> map) {
		String searchName = map.get("searchName");
		String searchName2 = map.get("searchName2");
		List<SoQnaDTO> list =null;  //게시판 목록
		
		if((searchName==null || searchName=="") &&(searchName=="" || searchName2==null)) {
			System.out.println("soQna searchName: "+searchName+"searchName2: "+searchName2);
			list= template.selectList("SoQnaMapper.soQna",map);
		}else if((searchName!=null || searchName!="") && (searchName2==null || searchName2=="")){
			System.out.println("soQnaSort1 searchName: "+searchName+"searchName2: "+searchName2);
			list= template.selectList("SoQnaMapper.soQnaSort1",map);
		}
		else if((searchName==null || searchName=="")&& (searchName2!=null||searchName2!="")){
			System.out.println("soQnaSort3 searchName: "+searchName+"searchName2: "+searchName2);
			list= template.selectList("SoQnaMapper.soQnaSort3",map);
		}
		else if((searchName!=null || searchName!="") && (searchName2!=null || searchName2!="")){
			System.out.println("soQnaSort2 searchName: "+searchName+"searchName2: "+searchName2);
			list= template.selectList("SoQnaMapper.soQnaSort2",map);
		}
		else {
			System.out.println("soQnaSort3 searchName: "+searchName+"searchName2: "+searchName2);
			list= template.selectList("SoQnaMapper.soQnaSort3",map);
		}
		
		return list;
	}
	
	public void soQnaWrite(HashMap<String, String> map) {
		template.insert("SoQnaMapper.soQnaWrite",map);
	}
	
	public void soQnaDelete(HashMap<String, Integer> map) {
		template.delete("SoQnaMapper.soQnaDelete",map);
	}
	
	public void soQnaModify(HashMap<String, Object> map) {
		template.update("SoQnaMapper.soQnaModify",map);
	}
	
	public void soQnaRead(int qnaNum) {
		template.update("SoQnaMapper.soQnaRead",qnaNum);
	}
}
