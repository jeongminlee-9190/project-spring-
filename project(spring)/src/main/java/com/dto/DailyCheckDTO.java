package com.dto;

public class DailyCheckDTO {
	
	private int dailyNum;
	private String mId;
	private String dailyDate;
	private int dailyPoint;
	
	public DailyCheckDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DailyCheckDTO(int dailyNum, String mId, String dailyDate, int dailyPoint) {
		super();
		this.dailyNum = dailyNum;
		this.mId = mId;
		this.dailyDate = dailyDate;
		this.dailyPoint = dailyPoint;
	}
	@Override
	public String toString() {
		return "DailyCheckDTO [dailyNum=" + dailyNum + ", mId=" + mId + ", dailyDate=" + dailyDate + ", dailyPoint="
				+ dailyPoint + "]";
	}
	public int getDailyNum() {
		return dailyNum;
	}
	public void setDailyNum(int dailyNum) {
		this.dailyNum = dailyNum;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getDailyDate() {
		return dailyDate;
	}
	public void setDailyDate(String dailyDate) {
		this.dailyDate = dailyDate;
	}
	public int getDailyPoint() {
		return dailyPoint;
	}
	public void setDailyPoint(int dailyPoint) {
		this.dailyPoint = dailyPoint;
	}
	
	
}
