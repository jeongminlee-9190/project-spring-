package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("sSubwayDTO")
public class sSubwayDTO {
	private String sSubway;
	private int sSubwayCnt;
	
	public sSubwayDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public sSubwayDTO(String sSubway, int sSubwayCnt) {
		super();
		this.sSubway = sSubway;
		this.sSubwayCnt = sSubwayCnt;
	}


	public String getsSubway() {
		return sSubway;
	}

	public void setsSubway(String sSubway) {
		this.sSubway = sSubway;
	}

	public int getsSubwayCnt() {
		return sSubwayCnt;
	}

	public void setsSubwayCnt(int sSubwayCnt) {
		this.sSubwayCnt = sSubwayCnt;
	}

	@Override
	public String toString() {
		return "sSubway=" + sSubway + ", sSubwayCnt=" + sSubwayCnt;
	}
}
