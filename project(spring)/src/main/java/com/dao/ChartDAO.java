package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.AdminDTO;
import com.dto.MPageDTO;
import com.dto.SPageDTO;
import com.dto.SoPageDTO;
import com.dto.sSubwayDTO;

@Repository
public class ChartDAO {
	@Autowired
	SqlSessionTemplate template;
	
	public int sJanuaryCnt() {
		return template.selectOne("ChartMapper.sJanuary");
	}
	public int sFebruaryCnt() {
		return template.selectOne("ChartMapper.sFebruary");
	}
	public int sMarchCnt() {
		return template.selectOne("ChartMapper.sMarch");
	}
	public int sAprilCnt() {
		return template.selectOne("ChartMapper.sApril");
	}
	
	public List<Object> sSubwayCnt() {
		return template.selectList("ChartMapper.sSubwayCnt");
	}
}
