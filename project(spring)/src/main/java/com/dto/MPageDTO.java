package com.dto;

import java.util.List;

import org.apache.ibatis.type.Alias;
@Alias("MPageDTO")
public class MPageDTO {
	private List<MPageDTO> list; // 게시판 목록
	private int perPage=8; // 페이지 당 보여줄 갯수
	private int curPage; // 현재 페이지 번호
	private int totalCnt; // 전체 레코드 갯수
	public MPageDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MPageDTO(List<MPageDTO> list, int perPage, int curPage, int totalCnt) {
		super();
		this.list = list;
		this.perPage = perPage;
		this.curPage = curPage;
		this.totalCnt = totalCnt;
	}
	public List<MPageDTO> getList() {
		return list;
	}
	public void setList(List<MPageDTO> list) {
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
