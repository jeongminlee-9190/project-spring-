package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("ShopDTO")
public class ShopDTO {
	private String sCode;
	private String sName;
	private String soId;
	private String sPost;
	private String sAddr;
	private String sPhone;
	private String sBusinessHours;
	private String sParkingLot;
	private String sTerrace;
	private String sMenu1;
	private String sMenu2;
	private String sCategory;
	private String sImage;
	private int sLike;
	private int sHate;
	private int sInterest;
	private String sSubway;

	
	@Override
	public String toString() {
		return "ShopDTO [sCode=" + sCode + ", sName=" + sName + ", soId=" + soId + ", sPost=" + sPost + ", sAddr="
				+ sAddr + ", sPhone=" + sPhone + ", sBusinessHours=" + sBusinessHours + ", sParkingLot=" + sParkingLot
				+ ", sTerrace=" + sTerrace + ", sMenu1=" + sMenu1 + ", sMenu2=" + sMenu2 + ", sCategory=" + sCategory
				+ ", sImage=" + sImage + ", sLike=" + sLike + ", sHate=" + sHate + ", sInterest=" + sInterest
				+ ", sSubway=" + sSubway + "]";
	}
	public String getsCode() {
		return sCode;
	}
	public void setsCode(String sCode) {
		this.sCode = sCode;
	}
	public String getsName() {
		return sName;
	}
	public void setsName(String sName) {
		this.sName = sName;
	}
	public String getSoId() {
		return soId;
	}
	public void setSoId(String soId) {
		this.soId = soId;
	}
	public String getsPost() {
		return sPost;
	}
	public void setsPost(String sPost) {
		this.sPost = sPost;
	}
	public String getsAddr() {
		return sAddr;
	}
	public void setsAddr(String sAddr) {
		this.sAddr = sAddr;
	}
	public String getsPhone() {
		return sPhone;
	}
	public void setsPhone(String sPhone) {
		this.sPhone = sPhone;
	}
	public String getsBusinessHours() {
		return sBusinessHours;
	}
	public void setsBusinessHours(String sBusinessHours) {
		this.sBusinessHours = sBusinessHours;
	}
	public String getsParkingLot() {
		return sParkingLot;
	}
	public void setsParkingLot(String sParkingLot) {
		this.sParkingLot = sParkingLot;
	}
	public String getsTerrace() {
		return sTerrace;
	}
	public void setsTerrace(String sTerrace) {
		this.sTerrace = sTerrace;
	}
	public String getsMenu1() {
		return sMenu1;
	}
	public void setsMenu1(String sMenu1) {
		this.sMenu1 = sMenu1;
	}
	public String getsMenu2() {
		return sMenu2;
	}
	public void setsMenu2(String sMenu2) {
		this.sMenu2 = sMenu2;
	}
	public String getsCategory() {
		return sCategory;
	}
	public void setsCategory(String sCategory) {
		this.sCategory = sCategory;
	}
	public String getsImage() {
		return sImage;
	}
	public void setsImage(String sImage) {
		this.sImage = sImage;
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
	public int getsInterest() {
		return sInterest;
	}
	public void setsInterest(int sInterest) {
		this.sInterest = sInterest;
	}
	public String getsSubway() {
		return sSubway;
	}
	public void setsSubway(String sSubway) {
		this.sSubway = sSubway;
	}
	
	
	

}
