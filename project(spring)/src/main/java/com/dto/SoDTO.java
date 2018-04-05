package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("SoDTO")
public class SoDTO {
	private int rownum;
	private String soId;
	private String soPasswd;
	private String soName;
	private String soPhone;
	private String soLicense;
	private String soPost;
	private String soAddr;
	private String soLevel;
	private String soJoindate;
	private String sLastLogin;
	private String sLastLogin2;
	
	public SoDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SoDTO(String soId, String soPasswd, String soName, String soPhone, String soLicense, String soPost,
			String soAddr) {
		super();
		this.soId = soId;
		this.soPasswd = soPasswd;
		this.soName = soName;
		this.soPhone = soPhone;
		this.soLicense = soLicense;
		this.soPost = soPost;
		this.soAddr = soAddr;
	}
	public SoDTO(int rownum, String soId, String soPasswd, String soName, String soPhone, String soLicense,
			String soPost, String soAddr, String soLevel, String soJoindate, String sLastLogin, String sLastLogin2) {
		super();
		this.rownum = rownum;
		this.soId = soId;
		this.soPasswd = soPasswd;
		this.soName = soName;
		this.soPhone = soPhone;
		this.soLicense = soLicense;
		this.soPost = soPost;
		this.soAddr = soAddr;
		this.soLevel = soLevel;
		this.soJoindate = soJoindate;
		this.sLastLogin = sLastLogin;
		this.sLastLogin2 = sLastLogin2;
	}
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	public String getSoId() {
		return soId;
	}
	public void setSoId(String soId) {
		this.soId = soId;
	}
	public String getSoPasswd() {
		return soPasswd;
	}
	public void setSoPasswd(String soPasswd) {
		this.soPasswd = soPasswd;
	}
	public String getSoName() {
		return soName;
	}
	public void setSoName(String soName) {
		this.soName = soName;
	}
	public String getSoPhone() {
		return soPhone;
	}
	public void setSoPhone(String soPhone) {
		this.soPhone = soPhone;
	}
	public String getSoLicense() {
		return soLicense;
	}
	public void setSoLicense(String soLicense) {
		this.soLicense = soLicense;
	}
	public String getSoPost() {
		return soPost;
	}
	public void setSoPost(String soPost) {
		this.soPost = soPost;
	}
	public String getSoAddr() {
		return soAddr;
	}
	public void setSoAddr(String soAddr) {
		this.soAddr = soAddr;
	}
	public String getSoLevel() {
		return soLevel;
	}
	public void setSoLevel(String soLevel) {
		this.soLevel = soLevel;
	}
	public String getSoJoindate() {
		return soJoindate;
	}
	public void setSoJoindate(String soJoindate) {
		this.soJoindate = soJoindate;
	}
	public String getsLastLogin() {
		return sLastLogin;
	}
	public void setsLastLogin(String sLastLogin) {
		this.sLastLogin = sLastLogin;
	}
	public String getsLastLogin2() {
		return sLastLogin2;
	}
	public void setsLastLogin2(String sLastLogin2) {
		this.sLastLogin2 = sLastLogin2;
	}
	
}