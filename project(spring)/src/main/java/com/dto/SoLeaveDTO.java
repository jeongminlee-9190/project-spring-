package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("SoLeaveDTO")
public class SoLeaveDTO {
	int soShopCnt;
	int soReviewCnt;
	int soInterestCnt;
	int soScore;
	String soCouponCnt;
	String soExpireDate;
	
	public SoLeaveDTO() {

	}
	
	public SoLeaveDTO(int soShopCnt, int soReviewCnt, int soInterestCnt, int soScore, String soCouponCnt,
			String soExpireDate) {
		super();
		this.soShopCnt = soShopCnt;
		this.soReviewCnt = soReviewCnt;
		this.soInterestCnt = soInterestCnt;
		this.soScore = soScore;
		this.soCouponCnt = soCouponCnt;
		this.soExpireDate = soExpireDate;
	}
	public int getSoShopCnt() {
		return soShopCnt;
	}
	public void setSoShopCnt(int soShopCnt) {
		this.soShopCnt = soShopCnt;
	}
	public int getSoReviewCnt() {
		return soReviewCnt;
	}
	public void setSoReviewCnt(int soReviewCnt) {
		this.soReviewCnt = soReviewCnt;
	}
	public int getSoInterestCnt() {
		return soInterestCnt;
	}
	public void setSoInterestCnt(int soInterestCnt) {
		this.soInterestCnt = soInterestCnt;
	}
	public int getSoScore() {
		return soScore;
	}
	public void setSoScore(int soScore) {
		this.soScore = soScore;
	}
	public String getSoCouponCnt() {
		return soCouponCnt;
	}
	public void setSoCouponCnt(String soCouponCnt) {
		this.soCouponCnt = soCouponCnt;
	}
	public String getSoExpireDate() {
		return soExpireDate;
	}
	public void setSoExpireDate(String soExpireDate) {
		this.soExpireDate = soExpireDate;
	}

	@Override
	public String toString() {
		return "SoLeaveDTO [soShopCnt=" + soShopCnt + ", soReviewCnt=" + soReviewCnt + ", soInterestCnt="
				+ soInterestCnt + ", soScore=" + soScore + ", soCouponCnt=" + soCouponCnt + ", soExpireDate="
				+ soExpireDate + "]";
	}
	
}
