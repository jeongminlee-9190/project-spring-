package com.dto;

public class ChartDTO {
	public int sJanuaryCnt;
	public int sFebruaryCnt;
	public int sMarchCnt;
	public int sAprilCnt;
	public ChartDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ChartDTO(int sJanuaryCnt, int sFebruaryCnt, int sMarchCnt, int sAprilCnt) {
		super();
		this.sJanuaryCnt = sJanuaryCnt;
		this.sFebruaryCnt = sFebruaryCnt;
		this.sMarchCnt = sMarchCnt;
		this.sAprilCnt = sAprilCnt;
	}
	public int getsJanuaryCnt() {
		return sJanuaryCnt;
	}
	public void setsJanuaryCnt(int sJanuaryCnt) {
		this.sJanuaryCnt = sJanuaryCnt;
	}
	public int getsFebruaryCnt() {
		return sFebruaryCnt;
	}
	public void setsFebruaryCnt(int sFebruaryCnt) {
		this.sFebruaryCnt = sFebruaryCnt;
	}
	public int getsMarchCnt() {
		return sMarchCnt;
	}
	public void setsMarchCnt(int sMarchCnt) {
		this.sMarchCnt = sMarchCnt;
	}
	public int getsAprilCnt() {
		return sAprilCnt;
	}
	public void setsAprilCnt(int sAprilCnt) {
		this.sAprilCnt = sAprilCnt;
	}
	
	
}
