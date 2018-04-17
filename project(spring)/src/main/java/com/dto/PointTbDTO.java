package com.dto;

public class PointTbDTO {

	private int pNum;
	private String mId;
	private String pDate;
	private int point;
	private int pTotal;
	private String pStatement;
	
	public PointTbDTO() {
		super();
	}
	public PointTbDTO(int pNum, String mId, String pDate, int point, int pTotal, String pStatement) {
		super();
		this.pNum = pNum;
		this.mId = mId;
		this.pDate = pDate;
		this.point = point;
		this.pTotal = pTotal;
		this.pStatement = pStatement;
	}
	@Override
	public String toString() {
		return "PointTbDTO [pNum=" + pNum + ", mId=" + mId + ", pDate=" + pDate + ", point=" + point + ", pTotal="
				+ pTotal + ", pStatement=" + pStatement + "]";
	}
	
	public int getpNum() {
		return pNum;
	}
	public void setpNum(int pNum) {
		this.pNum = pNum;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getpDate() {
		return pDate;
	}
	public void setpDate(String pDate) {
		this.pDate = pDate;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getpTotal() {
		return pTotal;
	}
	public void setpTotal(int pTotal) {
		this.pTotal = pTotal;
	}
	public String getpStatement() {
		return pStatement;
	}
	public void setpStatement(String pStatement) {
		this.pStatement = pStatement;
	}
	
	
	
	
}
