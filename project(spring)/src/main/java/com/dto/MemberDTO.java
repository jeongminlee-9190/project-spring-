package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("MemberDTO")
public class MemberDTO {
   private int rownum;
   private String mId;
   private String mPasswd;
   private String mName;
   private String mPhone;
   private String mBirth;
   private String mLastLogin;   
   private String mLastLogin2;
   
   public MemberDTO() {
	   super();
   }
	
   public MemberDTO(int rownum, String mId, String mPasswd, String mName, String mPhone, String mBirth) {
	   super();
	   this.rownum = rownum;
	   this.mId = mId;
	   this.mPasswd = mPasswd;
	   this.mName = mName;
	   this.mPhone = mPhone;
	   this.mBirth = mBirth;
   }

   
	public MemberDTO(int rownum, String mId, String mPasswd, String mName, String mPhone, String mBirth,
		String mLastLogin,String mLastLogin2) {
	super();
	this.rownum = rownum;
	this.mId = mId;
	this.mPasswd = mPasswd;
	this.mName = mName;
	this.mPhone = mPhone;
	this.mBirth = mBirth;
	this.mLastLogin = mLastLogin;
	this.mLastLogin2 = mLastLogin2;
}

	public MemberDTO(String mId, String mPasswd, String mName, String mPhone, String mBirth) {
	super();
	this.mId = mId;
	this.mPasswd = mPasswd;
	this.mName = mName;
	this.mPhone = mPhone;
	this.mBirth = mBirth;
}

	public int getRownum() {
		return rownum;
	}
	
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	
	public String getmId() {
		return mId;
	}
	
	public void setmId(String mId) {
		this.mId = mId;
	}
	
	public String getmPasswd() {
		return mPasswd;
	}
	
	public void setmPasswd(String mPasswd) {
		this.mPasswd = mPasswd;
	}
	
	public String getmName() {
		return mName;
	}
	
	public void setmName(String mName) {
		this.mName = mName;
	}
	
	public String getmPhone() {
		return mPhone;
	}
	
	public void setmPhone(String mPhone) {
		this.mPhone = mPhone;
	}
	
	public String getmBirth() {
		return mBirth;
	}
	
	public void setmBirth(String mBirth) {
		this.mBirth = mBirth;
	}

	public String getmLastLogin() {
		return mLastLogin;
	}

	public void setmLastLogin(String mLastLogin) {
		this.mLastLogin = mLastLogin;
	}

	public String getmLastLogin2() {
		return mLastLogin2;
	}

	public void setmLastLogin2(String mLastLogin2) {
		this.mLastLogin2 = mLastLogin2;
	}
	
	   
}