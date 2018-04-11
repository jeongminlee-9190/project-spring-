package com.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.dto.SDTO;
import com.dto.SoDTO;
import com.dto.Upload;
import com.service.SService;
@Controller
public class ImageUploadController {
	@Autowired
	SService sservice;
	
	@RequestMapping(value = "/sImageUploadForm")
	public String sImageUploadForm() {
		return "shop/sImageUploadForm"; //논리적 이름(파일명)
	}
	
	@RequestMapping(value = "/sImageUpload", method=RequestMethod.POST)
	public String sImageUpload(@RequestParam int num,Upload upload,HttpSession session,HttpServletRequest request) {
		SoDTO soDTO = (SoDTO)session.getAttribute("SoLogin");
		SDTO sDTO = (SDTO)session.getAttribute("sInfo");
		String soId = null;
		String nextPage=null;
		if(soDTO==null) {
			request.setAttribute("fail", "로그인을 해주세요.");
			nextPage = "index_shopowner";
		}else {
			soId = soDTO.getSoId();
			String sCode = sDTO.getsCode();
			String theText = upload.getTheText();
			CommonsMultipartFile file = upload.getTheFile();
			long size = file.getSize();
			String contentType=file.getContentType();
			HashMap<String, String> map = new HashMap<>();
			
			if(contentType.equals("image/png")) {
				String fileName = sCode+"_sImage"+num+".png";
				System.out.println("size: "+size);
				System.out.println("fileName: "+fileName);
				System.out.println("contentType: "+contentType);
				
			//특정 경로에 저장
				File dest = new File("C:\\project-spring-\\project-spring-\\project(spring)\\src\\main\\webapp\\resources\\images",fileName);
				try {
					file.transferTo(dest);
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				map.put("sCode", sCode);
				if(fileName.contains("sImage1.png")) {
					map.put("sImage",fileName);
					sservice.sImageAdd(map);
					session.setAttribute("sImage", fileName);
				}else {
					String sImage = sDTO.getsImage();
					sImage = sImage+"/"+fileName;
					System.out.println("sImage"+sImage);
					map.put("sImage", sImage);
					sservice.sImageAdd(map);
					session.setAttribute("sImage", sImage);
				}
				session.setAttribute("mesg", "업로드  완료");
				nextPage="redirect:sImageUploadForm";
			}else {
				session.setAttribute("mesg", "PNG만 업로드 가능");
				nextPage="shop/sImageUploadForm";
			}
		}
		sDTO = sservice.sInfo(soId);
		session.setAttribute("sInfo", sDTO);
		return nextPage; //논리적 이름(파일명)
	}
}
