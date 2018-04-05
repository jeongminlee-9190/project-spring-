package com.dto.parameter;

import org.apache.ibatis.type.Alias;

@Alias("ReviewParameterDTO")
public class ReviewParameterDTO {
	
	private String reviewContent;
	private String mId;
	private String sCode;
	private String [] favorKeywords;
	
	
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
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
	public String[] getFavorKeywords() {
		return favorKeywords;
	}
	public void setFavorKeywords(String[] favorKeywords) {
		this.favorKeywords = favorKeywords;
	}

	
	

}
