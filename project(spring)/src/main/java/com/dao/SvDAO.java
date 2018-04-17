package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.NoticeDTO;
import com.dto.PageDTO;
import com.dto.SvPageDTO;

@Repository
public class SvDAO {
	@Autowired
	SqlSessionTemplate template;
	
	public void payment(HashMap<String, Object> map) {
		String soId = (String)map.get("soId");
		template.insert("SoMapper.payment",map);
		template.update("SoMapper.soLevelChange",soId);
	}
	
	
	
	public SvPageDTO soPaymentList(HashMap<String, String> map,int curPage){
		SvPageDTO svpageDTO = new SvPageDTO();
		//목록은 0부터 시작
		int start = (curPage-1)*svpageDTO.getPerPage(); //페이징 시작 글 번호
		List<SvPageDTO> list =null;  //게시판 목록
		list= template.selectList("SoMapper.soPaymentList",map, new RowBounds( start , svpageDTO.getPerPage()));
		int totalCount=0;
		String searchName = map.get("searchName");
		System.out.println("searchName: "+searchName);
		if(searchName==null) {//searchValue값이 없는 상태로 검색을 누르면 전체목록 보여주기
			totalCount=soPaymentListTotalCount(map);
			System.out.println("1:"+totalCount);
		}
		else {//입력된 searchValue가 포함된 게시판 글들의 목록을 보여줌
			totalCount=soPaymentListTotalSearchCount(map);
			System.out.println("2:"+totalCount);
		}
		svpageDTO.setList(list);
		svpageDTO.setCurPage(curPage);
		svpageDTO.setSearchName(searchName);
		svpageDTO.setTotalCnt(totalCount);
		return svpageDTO;
	}
	
	
	public int soPaymentListTotalSearchCount(HashMap<String, String> map){
		return template.selectOne("SoMapper.soPaymentListTotalSearchCount",map);
	}
	
	public int soPaymentListTotalCount(HashMap<String, String> map){
		return template.selectOne("SoMapper.soPaymentListTotalCount",map);
	}
	
}
