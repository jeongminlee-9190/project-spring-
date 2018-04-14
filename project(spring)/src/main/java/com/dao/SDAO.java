package com.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.dto.SDTO;

@Repository
public class SDAO {
	@Autowired
	SqlSessionTemplate template;
	
	public SDTO sInfo(String soId) {
		return template.selectOne("SMapper.sInfo",soId);
	}
	
	public SDTO sInfo2(String sCode) {
		return template.selectOne("SMapper.sInfo2",sCode);
	}
	
	public void SInfoEnroll(SDTO dto) {
		template.insert("SMapper.sAdd",dto);
		template.insert("SMapper.sScoreInsert",dto.getsCode());
	}
	
	public void sInfoUpdate(SDTO dto) {
		template.update("SMapper.sInfoUpdate",dto);
	}
	
	/*public void sScoreInsert(String sCode) {
		System.out.println("sScoreInsert SDAO 접근"+sCode);
		template.insert("SMapper.sScoreInsert",sCode);
	}*/
	
	public void sImageAdd(HashMap<String, String> map) {
		template.update("SMapper.sImageAdd",map);
	}
	
	public void sImageAdd2(HashMap<String, String> map) {
		template.update("SMapper.sImageAdd2",map);
	}
	
	public void sDelAll(HashMap<String, String> map) {
		template.delete("SoMapper.soShopDel",map);
		template.delete("SoMapper.soReviewDel",map);
		template.delete("SoMapper.soInterestDel",map);
		template.delete("SoMapper.soScoreDel",map);
		template.delete("SoMapper.soCouponDel",map);
		template.delete("SoMapper.soPaymentDel",map);
	}
}
