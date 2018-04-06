package com.dto;

import java.util.List;

import org.apache.ibatis.type.Alias;
@Alias("SoPageDTO")
public class SoPageDTO {
	private List<SoPageDTO> list; // 게시판 목록
	private int perPage=7; // 페이지 당 보여줄 갯수
	private int curPage; // 현재 페이지 번호
	private int totalCnt; // 전체 레코드 갯수
	public SoPageDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SoPageDTO(List<SoPageDTO> list, int perPage, int curPage, int totalCnt) {
		super();
		this.list = list;
		this.perPage = perPage;
		this.curPage = curPage;
		this.totalCnt = totalCnt;
	}
	public List<SoPageDTO> getList() {
		return list;
	}
	public void setList(List<SoPageDTO> list) {
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
}
