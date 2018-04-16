package com.validator;

import java.util.HashMap;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.dto.SvDTO;

public class SoValidator implements Validator {
    //SvDTO 
	@Override
	public boolean supports(Class<?> arg0) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void validate(Object obj, Errors e) {
		// TODO Auto-generated method stub
		HashMap<String, String> map = (HashMap<String, String>)obj; 
		
		if(map.get("cardNum").length()==0) { //cardNum가 입력되지 않은 경우
			e.rejectValue("cardNum", "required","카드번호를 입력해주세요");
		}else if(map.get("cardNum").length()<15) { //cardNum
			e.rejectValue("cardNum", "required","카드번호는 숫자로만 되어있으며 15~16자리 입니다. 다시 확인해주세요.");
		}
	}

}
