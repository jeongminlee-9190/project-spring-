package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.AdminDTO;
import com.dto.MPageDTO;
import com.dto.NoticeDTO;
import com.dto.SoPageDTO;

@Repository
public class ADAO {
	@Autowired
	SqlSessionTemplate template;
	
	public AdminDTO login(HashMap<String, String> map) {
		return template.selectOne("AdminMapper.adminlogin",map);
	}
	
	public List<Object> memberList() {
		return template.selectList("AdminMapper.memberlist");
	}
	
	public MPageDTO mDormantList(int curPage) {
		MPageDTO mpageDTO = new MPageDTO();
		//목록은 0부터 시작
		int totalCnt=0;
		totalCnt=mDormantListTotalCount();
		int start = (curPage-1)*mpageDTO.getPerPage(); //페이징 시작 글 번호
		List<MPageDTO> list =null;  //게시판 목록
		list= template.selectList("AdminMapper.mDormantList",null,new RowBounds(start ,mpageDTO.getPerPage()));
		mpageDTO.setList(list);
		mpageDTO.setCurPage(curPage);
		mpageDTO.setTotalCnt(totalCnt);
/*		System.out.println("start"+start);
		System.out.println("perpage"+mpageDTO.getPerPage());
		System.out.println("curPage"+curPage);
		System.out.println("totalCnt"+totalCnt);*/
		return mpageDTO;
	}
	
	public int mDormantListTotalCount(){
		return template.selectOne("AdminMapper.mDormantListTotalCount");
	}
	
	/*public List<Object> mDormantList() {
		return template.selectList("AdminMapper.mDormantList");
	}*/
	
	public List<Object> soList() {
		return template.selectList("AdminMapper.soList");
	}
	
	public SoPageDTO soDormantList(int curPage) {
		SoPageDTO sopageDTO = new SoPageDTO();
		//목록은 0부터 시작
		int totalCnt=0;
		totalCnt=soDormantListTotalCount();
		int start = (curPage-1)*sopageDTO.getPerPage(); //페이징 시작 글 번호
		List<SoPageDTO> list =null;  //게시판 목록
		list= template.selectList("AdminMapper.soDormantList",null,new RowBounds(start ,sopageDTO.getPerPage()));
		sopageDTO.setList(list);
		sopageDTO.setCurPage(curPage);
		sopageDTO.setTotalCnt(totalCnt);
		System.out.println("start"+start);
		System.out.println("perpage"+sopageDTO.getPerPage());
		System.out.println("curPage"+curPage);
		System.out.println("totalCnt"+totalCnt);
		return sopageDTO;
	}
	
	public int soDormantListTotalCount(){
		return template.selectOne("AdminMapper.soDormantListTotalCount");
	}
	
	public void changeSoLevel(HashMap<String, String> map) {
		template.update("AdminMapper.soLevelChange",map);
	}
}
