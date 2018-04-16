package com.dto;

public class CouponDTO {

	private String couponCode;
	private String mId;
	private String couponDate;
	private int couponPirce;
	private String Statement;
	
	
	public CouponDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CouponDTO(String couponCode, String mId, String couponDate, int couponPirce, String statement) {
		super();
		this.couponCode = couponCode;
		this.mId = mId;
		this.couponDate = couponDate;
		this.couponPirce = couponPirce;
		Statement = statement;
	}
	@Override
	public String toString() {
		return "CouponDTO [couponCode=" + couponCode + ", mId=" + mId + ", couponDate=" + couponDate + ", couponPirce="
				+ couponPirce + ", Statement=" + Statement + "]";
	}
	public String getCouponCode() {
		return couponCode;
	}
	public void setCouponCode(String couponCode) {
		this.couponCode = couponCode;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getCouponDate() {
		return couponDate;
	}
	public void setCouponDate(String couponDate) {
		this.couponDate = couponDate;
	}
	public int getCouponPirce() {
		return couponPirce;
	}
	public void setCouponPirce(int couponPirce) {
		this.couponPirce = couponPirce;
	}
	public String getStatement() {
		return Statement;
	}
	public void setStatement(String statement) {
		Statement = statement;
	}
	
	
	
}
