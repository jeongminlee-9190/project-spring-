package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("SearchResultDTO")
public class SearchResultDTO {
	
	//score
		private String keyword;
		private String sCode;
		private int good;
		private int bad;
		private int scoresum;
		
		//shop
		private String sName;
		private String soId;
		private String sPost;
		private String sAddr;
		private String sPhone;
		private String sBusinesshours;
		private String sParkinglot;
		private String sTerrace;
		private String sMenu1;
		private String sMenu2;
		private String sCategory;
		private String sImage;
		private int sLike;
		private int sHate;
		private int sInterest;
		private String sSubway;
		
		public String getKeyword() {
			return keyword;
		}
		public void setKeyword(String keyword) {
			this.keyword = keyword;
		}
		public String getsCode() {
			return sCode;
		}
		public void setsCode(String sCode) {
			this.sCode = sCode;
		}
		public int getGood() {
			return good;
		}
		public void setGood(int good) {
			this.good = good;
		}
		public int getBad() {
			return bad;
		}
		public void setBad(int bad) {
			this.bad = bad;
		}
		public int getScoresum() {
			return scoresum;
		}
		public void setScoresum(int scoresum) {
			this.scoresum = scoresum;
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
		public String getsBusinesshours() {
			return sBusinesshours;
		}
		public void setsBusinesshours(String sBusinesshours) {
			this.sBusinesshours = sBusinesshours;
		}
		public String getsParkinglot() {
			return sParkinglot;
		}
		public void setsParkinglot(String sParkinglot) {
			this.sParkinglot = sParkinglot;
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
		@Override
		public String toString() {
			return "SearchResultDTO [keyword=" + keyword + ", sCode=" + sCode + ", good=" + good + ", bad=" + bad
					+ ", scoresum=" + scoresum + ", sName=" + sName + ", soId=" + soId + ", sPost=" + sPost + ", sAddr="
					+ sAddr + ", sPhone=" + sPhone + ", sBusinesshours=" + sBusinesshours + ", sParkinglot="
					+ sParkinglot + ", sTerrace=" + sTerrace + ", sMenu1=" + sMenu1 + ", sMenu2=" + sMenu2
					+ ", sCategory=" + sCategory + ", sImage=" + sImage + ", sLike=" + sLike + ", sHate=" + sHate
					+ ", sInterest=" + sInterest + ", sSubway=" + sSubway + "]";
		}

		
		
		

}
