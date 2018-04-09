package com.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.dto.SDTO;
import com.dto.SoDTO;
import com.dto.Upload;
@Controller
public class ImageUploadController {
	@RequestMapping(value = "/sImageUploadForm")
	public String sImageUploadForm() {
		return "shop/sImageUploadForm"; //논리적 이름(파일명)
	}
	
	@RequestMapping(value = "/sImageUpload", method=RequestMethod.POST)
	public String sImageUpload(@RequestParam int num,Upload upload,HttpSession session) {
		SoDTO soDTO = (SoDTO)session.getAttribute("SoLogin");
		SDTO sDTO = (SDTO)session.getAttribute("sInfo");
		String sCode = sDTO.getsCode();
		String theText = upload.getTheText();
		CommonsMultipartFile file = upload.getTheFile();
		long size = file.getSize();
		String contentType=file.getContentType();
		String nextPage=null;
		
		if(contentType.equals("image/png")) {
			String fileName = sCode+"_sImage"+num+".png";
			System.out.println("size: "+size);
			System.out.println("fileName: "+fileName);
			System.out.println("contentType: "+contentType);
			
		//특정 경로에 저장
			File dest = new File("c:\\upload",fileName);
			try {
				file.transferTo(dest);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			session.setAttribute("mesg", "업로드  완료");
			nextPage="shop/sImageUploadForm";
		}else {
			session.setAttribute("mesg", "PNG만 업로드 가능");
			nextPage="shop/sImageUploadForm";
		}
		return nextPage; //논리적 이름(파일명)
	}
}
