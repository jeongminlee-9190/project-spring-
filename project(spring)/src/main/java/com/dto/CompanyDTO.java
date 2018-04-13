package com.dto;

public class CompanyDTO {

	private String companyCode;
	private String mId;
	private String companyDate;
	private int companyPoint;
	
	public CompanyDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CompanyDTO(String companyCode, String mId, String companyDate, int companyPoint) {
		super();
		this.companyCode = companyCode;
		this.mId = mId;
		this.companyDate = companyDate;
		this.companyPoint = companyPoint;
	}
	@Override
	public String toString() {
		return "CompanyDTO [companyCode=" + companyCode + ", mId=" + mId + ", companyDate=" + companyDate
				+ ", companyPoint=" + companyPoint + "]";
	}
	public String getCompanyCode() {
		return companyCode;
	}
	public void setCompanyCode(String companyCode) {
		this.companyCode = companyCode;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getCompanyDate() {
		return companyDate;
	}
	public void setCompanyDate(String companyDate) {
		this.companyDate = companyDate;
	}
	public int getCompanyPoint() {
		return companyPoint;
	}
	public void setCompanyPoint(int companyPoint) {
		this.companyPoint = companyPoint;
	}
	
	
}
