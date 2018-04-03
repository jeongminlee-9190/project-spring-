package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("ReviewDTO")
public class ReviewDTO {
	
	private int rvNum;
	private String rvContent;
	private String mName;
	private String rvWritedate;
	private int sLike;
	private int sHate;
	private String sCode;

	public int getRvNum() {
		return rvNum;
	}
	public void setRvNum(int rvNum) {
		this.rvNum = rvNum;
	}
	public String getRvContent() {
		return rvContent;
	}
	public void setRvContent(String rvContent) {
		this.rvContent = rvContent;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getRvWritedate() {
		return rvWritedate;
	}
	public void setRvWritedate(String rvWritedate) {
		this.rvWritedate = rvWritedate;
	}
	public int getsLike() {
		return sLike;
	}
	public void setsLike(int sLike) {
		this.sLike = sLike;
	}
	public int getsHate() {
		return sHate;
	}
	public void setsHate(int sHate) {
		this.sHate = sHate;
	}
	public String getsCode() {
		return sCode;
	}
	public void setsCode(String sCode) {
		this.sCode = sCode;
	}
	
	

}
