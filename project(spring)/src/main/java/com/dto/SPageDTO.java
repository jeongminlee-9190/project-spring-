package com.dto;

import java.util.List;

import org.apache.ibatis.type.Alias;
@Alias("SPageDTO")
public class SPageDTO {
	private List<SPageDTO> list; // 게시판 목록
	private int perPage=5; // 페이지 당 보여줄 갯수
	private int curPage; // 현재 페이지 번호
	private int totalCnt; // 전체 레코드 갯수
	private String searchName;
	private String searchValue;
	
	public SPageDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SPageDTO(List<SPageDTO> list, int perPage, int curPage, int totalCnt, String searchName,
			String searchValue) {
		super();
		this.list = list;
		this.perPage = perPage;
		this.curPage = curPage;
		this.totalCnt = totalCnt;
		this.searchName = searchName;
		this.searchValue = searchValue;
	}

	public List<SPageDTO> getList() {
		return list;
	}

	public void setList(List<SPageDTO> list) {
		this.list = list;
	}

	public int getPerPage() {
		return perPage;
	}

	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getTotalCnt() {
		return totalCnt;
	}

	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}

	public String getSearchName() {
		return searchName;
	}

	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}
}
