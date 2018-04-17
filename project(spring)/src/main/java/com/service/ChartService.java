package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ADAO;
import com.dao.ChartDAO;

@Service
public class ChartService {
	@Autowired
	ChartDAO dao;
	
	public int sJanuaryCnt() {
		return dao.sJanuaryCnt();
	}
	public int sFebruaryCnt() {
		return dao.sFebruaryCnt();
	}
	public int sMarchCnt() {
		return dao.sMarchCnt();
	}
	public int sAprilCnt() {
		return dao.sAprilCnt();
	}
	public List<Object> sSubwayCnt() {
		return dao.sSubwayCnt();
	}
}
