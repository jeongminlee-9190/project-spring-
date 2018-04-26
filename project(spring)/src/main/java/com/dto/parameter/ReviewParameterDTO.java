package com.dto.parameter;

import java.util.Arrays;

import org.apache.ibatis.type.Alias;

@Alias("ReviewParameterDTO")
public class ReviewParameterDTO {
	
	private String reviewContent;
	private String mName;
	private String sCode;
	private String [] favorKeywords;
	
	
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	
	public String getmName() {
		return mName;
	}
	@Override
	public String toString() {
		return "ReviewParameterDTO [reviewContent=" + reviewContent + ", mName=" + mName + ", sCode=" + sCode
				+ ", favorKeywords=" + Arrays.toString(favorKeywords) + "]";
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getsCode() {
		return sCode;
	}
	public void setsCode(String sCode) {
		this.sCode = sCode;
	}
	public String[] getFavorKeywords() {
		return favorKeywords;
	}
	public void setFavorKeywords(String[] favorKeywords) {
		this.favorKeywords = favorKeywords;
	}

	
	

}
