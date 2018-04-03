package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("InterestDTO")
public class InterestDTO {

	private String iCode;
	private String mId;
	private String sCode;

	
	public String getiCode() {
		return iCode;
	}
	public void setiCode(String iCode) {
		this.iCode = iCode;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getsCode() {
		return sCode;
	}
	public void setsCode(String sCode) {
		this.sCode = sCode;
	}
	
}
