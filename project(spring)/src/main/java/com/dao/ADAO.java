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

	public MPageDTO mList(HashMap<String, String> map,int curPage) {
		MPageDTO mpageDTO = new MPageDTO();
		//목록은 0부터 시작
		System.out.println("mList DAO"+map+curPage);
		int start = (curPage-1)*mpageDTO.getPerPage(); //페이징 시작 글 번호
		List<MPageDTO> list =null;  //게시판 목록
		list= template.selectList("AdminMapper.mList",map,new RowBounds(start ,mpageDTO.getPerPage()));
		int totalCnt=0;
		String searchValue = map.get("searchValue");
		String searchName = map.get("searchName");
		
		if(searchValue==null) {//searchValue값이 없는 상태로 검색을 누르면 전체목록 보여주기
			totalCnt=mListTotalCount();
			System.out.println("1:"+totalCnt);
		}
		else {//입력된 searchValue가 포함된 게시판 글들의 목록을 보여줌
			totalCnt=mListTotalSearchCount(map);
			System.out.println("2:"+totalCnt);
		}
		mpageDTO.setList(list);
		mpageDTO.setCurPage(curPage);
		mpageDTO.setTotalCnt(totalCnt);
		System.out.println("mList DAO"+list+curPage+totalCnt+mpageDTO.getPerPage());
		return mpageDTO;
	}
	
	public int mListTotalCount(){
		return template.selectOne("AdminMapper.mListTotalCount");
	}

	public int mListTotalSearchCount(HashMap<String, String> map){
		return template.selectOne("AdminMapper.mListTotalSearchCount",map);
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
		return mpageDTO;
	}
	
	public int mDormantListTotalCount(){
		return template.selectOne("AdminMapper.mDormantListTotalCount");
	}
	
	public void mDormantDel(String mId) {
		template.delete("AdminMapper.mDormantDel",mId);
	}
	
	
	
	
	/////////////////////////////////////////////////////////////////////////////////////
	
	public SoPageDTO soList(HashMap<String, String> map,int curPage) {
		SoPageDTO sopageDTO = new SoPageDTO();
		//목록은 0부터 시작
		System.out.println("soList DAO"+map+curPage);
		int start = (curPage-1)*sopageDTO.getPerPage(); //페이징 시작 글 번호
		List<SoPageDTO> list =null;  //게시판 목록
		list= template.selectList("AdminMapper.soList",map,new RowBounds(start ,sopageDTO.getPerPage()));
		int totalCnt=0;
		String searchValue = map.get("searchValue");

		if(searchValue==null) {//searchValue값이 없는 상태로 검색을 누르면 전체목록 보여주기
			totalCnt=soListTotalCount();
			System.out.println("1:"+totalCnt);
		}
		else {//입력된 searchValue가 포함된 게시판 글들의 목록을 보여줌
			totalCnt=soListTotalSearchCount(map);
			System.out.println("2:"+totalCnt);
		}
		sopageDTO.setList(list);
		sopageDTO.setCurPage(curPage);
		sopageDTO.setTotalCnt(totalCnt);
		System.out.println("soList DAO"+list+curPage+totalCnt+sopageDTO.getPerPage());
		return sopageDTO;
	}
	
	
	public int soListTotalCount(){
		return template.selectOne("AdminMapper.soListTotalCount");
	}

	public int soListTotalSearchCount(HashMap<String, String> map){
		return template.selectOne("AdminMapper.soListTotalSearchCount",map);
	}
	
	public List<Object> soList2() {
		return template.selectList("AdminMapper.soList2");
	}
	
	public void soApprove(String soId) {
		template.update("AdminMapper.soApprove",soId);
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
	
	public void soDormantDel(String soId) {
		System.out.println("soId: "+soId);
		template.delete("AdminMapper.sDormantDel",soId);
		template.delete("AdminMapper.soDormantDel",soId);
		
		
	}
	public void changeSoLevel(HashMap<String, String> map) {
		template.update("AdminMapper.soLevelChange",map);
	}
}
