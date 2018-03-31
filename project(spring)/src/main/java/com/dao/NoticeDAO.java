package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.NoticeDTO;
import com.dto.PageDTO;

@Repository
public class NoticeDAO {
	@Autowired
	SqlSessionTemplate template;
	//////////////////////////////////////////////////////////////////////////////////////////////////////////
		public PageDTO soNoticeList(HashMap<String, String> map,int curPage){
			PageDTO pageDTO = new PageDTO();
			//목록은 0부터 시작
			int start = (curPage-1)*pageDTO.getPerPage(); //페이징 시작 글 번호
			List<NoticeDTO> list =null;  //게시판 목록
			list= template.selectList("SoNoticeMapper.soNoticeList",map, new RowBounds( start , pageDTO.getPerPage()));
			int totalCount=0;
			String searchValue = map.get("searchValue");
			String searchName = map.get("searchName");
			System.out.println("searchValue: "+searchValue+" searchName: "+searchName);
			if(searchValue==null) {//searchValue값이 없는 상태로 검색을 누르면 전체목록 보여주기
				totalCount=soNoticeTotalCount();
				System.out.println("1:"+totalCount);
			}
			else {//입력된 searchValue가 포함된 게시판 글들의 목록을 보여줌
				totalCount=soNoticeTotalSearchCount(map);
				System.out.println("2:"+totalCount);
			}
			
			pageDTO.setList(list);
			pageDTO.setCurPage(curPage);
			pageDTO.setSearchName(searchName);
			pageDTO.setSearchValue(searchValue);
			pageDTO.setTotalCnt(totalCount);
			
			return pageDTO;
		}
		
		public int soNoticeTotalSearchCount(HashMap<String, String> map){
			return template.selectOne("SoNoticeMapper.soNoticeTotalSearchCount",map);
		}
		
		public int soNoticeTotalCount(){
			return template.selectOne("SoNoticeMapper.soNoticeTotalCount");
		}
		
		//글쓰기
		public void soNoticeWrite(NoticeDTO dto){
			template.insert("SoNoticeMapper.soNoticeInsert",dto);
		}
		
		public NoticeDTO soNoticeRetrieve(int num){
			soNoticeReadCnt(num);
			return template.selectOne("SoNoticeMapper.soNoticeRetrieve", num);
		}
		
		private void soNoticeReadCnt(int num) {
			template.update("SoNoticeMapper.soNoticeReadCnt",num);
		}
		
		public void soNoticeDelete(int num){
			template.delete("SoNoticeMapper.soNoticeDelete", num);
		}
		
		public void soNoticeUpdate(NoticeDTO dto){
			template.update("SoNoticeMapper.soNoticeUpdate",dto);
		}
		
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////		
		public PageDTO mNoticeList(HashMap<String, String> map,int curPage){
			PageDTO pageDTO = new PageDTO();
			//목록은 0부터 시작
			int start = (curPage-1)*pageDTO.getPerPage(); //페이징 시작 글 번호
			List<NoticeDTO> list =null;  //게시판 목록
			list= template.selectList("MNoticeMapper.mNoticeList",map, new RowBounds( start , pageDTO.getPerPage()));
			int totalCount=0;
			String searchValue = map.get("searchValue");
			String searchName = map.get("searchName");
			System.out.println("searchValue: "+searchValue+" searchName: "+searchName);
			if(searchValue==null) {//searchValue값이 없는 상태로 검색을 누르면 전체목록 보여주기
				totalCount=soNoticeTotalCount();
				System.out.println("1:"+totalCount);
			}
			else {//입력된 searchValue가 포함된 게시판 글들의 목록을 보여줌
				totalCount=soNoticeTotalSearchCount(map);
				System.out.println("2:"+totalCount);
			}
			
			pageDTO.setList(list);
			pageDTO.setCurPage(curPage);
			pageDTO.setSearchName(searchName);
			pageDTO.setSearchValue(searchValue);
			pageDTO.setTotalCnt(totalCount);
			
			return pageDTO;
		}
		
		public int mNoticeTotalSearchCount(HashMap<String, String> map){
			return template.selectOne("MNoticeMapper.mNoticeTotalSearchCount",map);
		}
		
		public int mNoticeTotalCount(){
			return template.selectOne("MNoticeMapper.mNoticeTotalCount");
		}
		
		//글쓰기
		public void mNoticeWrite(NoticeDTO dto){
			template.insert("MNoticeMapper.mNoticeInsert",dto);
		}
		
		public NoticeDTO mNoticeRetrieve(int num){
			mNoticeReadCnt(num);
			return template.selectOne("MNoticeMapper.mNoticeRetrieve", num);
		}
		
		private void mNoticeReadCnt(int num) {
			template.update("MNoticeMapper.mNoticeReadCnt",num);
		}
		
		public void mNoticeDelete(int num){
			template.delete("MNoticeMapper.mNoticeDelete", num);
		}
		
		public void mNoticeUpdate(NoticeDTO dto){
			template.update("MNoticeMapper.mNoticeUpdate",dto);
		}
	
}
