package com.Aview.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.UUID;

import javax.annotation.Resource;
import javax.annotation.Resources;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.Aview.domain.FileVO;
import com.Aview.mapper.FileMapper;

import jdk.internal.org.jline.utils.Log;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/file")
public class filetestcontroller {
	@Autowired
	FileMapper mapper;
	
	@GetMapping("/test")
	public String goTestJsp() {
		return "footer";
	} 
	
	@PostMapping("/upload")
	public String uploadFile(MultipartFile[] file, HttpServletRequest request, FileVO vo) throws Exception {
		    //String uploadPath = "C:\\Users\\ykp\\git\\Project_Aview\\src\\main\\webapp\\resources\\FileImage"; //경필 저장 주소
		    String uploadPath = "C:\\Users\\YJG\\git\\Project_Aview\\src\\main\\webapp\\resources\\FileImage"; //정근 저장 주소
		    
		    

		    File target = new File(uploadPath);
	        if(!target.exists()) target.mkdirs(); // 파일 경로에 폴더 없으면 새로운 폴더 생성

	        for(int i=0; i<file.length; i++) { // 파일 갯수만큼 반복
	        	 
	            String orgFileName = file[i].getOriginalFilename();  //파일 실제이름 
	            String orgFileExtension = orgFileName.substring(orgFileName.lastIndexOf(".")); // 파일 확장자 exe같은거
	            String saveFileName = UUID.randomUUID().toString().replaceAll("-", "") + orgFileExtension; // 파일 랜덤이름
	            Long saveFileSize = file[i].getSize();
	            
	            log.info("================== file start ==================");
	            log.info("파일 실제 이름: "+orgFileName);
	            log.info("파일 저장 이름: "+saveFileName);
	            log.info("파일 크기: "+saveFileSize);
	            log.info("content type: "+file[i].getContentType());


	 
	            target = new File(uploadPath, saveFileName);
	            file[i].transferTo(target);

	            	vo.setRealName(orgFileName);
	            	vo.setName(saveFileName);
	            	mapper.realName(vo);

	        }	
	        return null;
}
}
