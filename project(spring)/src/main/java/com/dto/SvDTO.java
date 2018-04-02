package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("SvDTO")
public class SvDTO {
	
	private String soId; //상점회원아이디
	private int payNum; //결제번호
	private String payDate;//결제한날자
	private int period; //결제일수
	private int price; //결제금액
	public String getSoId() {
		return soId;
	}
	public void setSoId(String soId) {
		this.soId = soId;
	}
	public int getPayNum() {
		return payNum;
	}
	public void setPayNum(int payNum) {
		this.payNum = payNum;
	}
	public String getPayDate() {
		return payDate;
	}
	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}
	public int getPeriod() {
		return period;
	}
	public void setPeriod(int period) {
		this.period = period;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "svDTO [soId=" + soId + ", payNum=" + payNum + ", payDate=" + payDate + ", period=" + period + ", price="
				+ price + "]";
	}
	public SvDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SvDTO(String soId, int payNum, String payDate, int period, int price) {
		super();
		this.soId = soId;
		this.payNum = payNum;
		this.payDate = payDate;
		this.period = period;
		this.price = price;
	}
	
	
}
