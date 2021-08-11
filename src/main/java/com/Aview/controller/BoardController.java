package com.Aview.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.Aview.domain.AcademyBoardVO;
import com.Aview.domain.AcademyTeacherVO;
import com.Aview.domain.Criteria;
import com.Aview.domain.PageDTO;
import com.Aview.mapper.BoardMapper;

import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@RequestMapping("/board/*")
public class BoardController {
   
   @Autowired
   BoardMapper mapper;
   
   @GetMapping("/academyDetail")
   public String academyGo() {
      return "/WebContent/app/academy/getTeacher";
   }
   
   @GetMapping("/academyDetailEdit")
   public String academyEditGo() {
      return "/WebContent/app/academy/academyDetailEdit";
   }

   
   
   @PostMapping("/register")
   public String BoardRegister(MultipartFile[] file, @ModelAttribute AcademyBoardVO av, HttpServletResponse resp, HttpSession session ,  HttpServletRequest req) throws Exception{
	   //String uploadPath = "C:\\Users\\ykp\\git\\Project_Aview\\src\\main\\webapp\\resources\\FileImage"; // 경필 저장 경로
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
           
           av.setAcademyPhoto(saveFileName);

           target = new File(uploadPath, saveFileName);
           file[i].transferTo(target);

           	av.setAcademyPhoto(saveFileName);
			/* av.setAcademyMapPhoto(saveFileName); */
       }
	   
      av.setAcademyId((String)session.getAttribute("session_id"));
      av.setAcademyIntro("임시값"); // intro는 후에 사용하게되면 이 부분 지우고 사용
      av.setAcademyMapPhoto("임시값"); // 이후에 삭제
      log.info(av);
      resp.setCharacterEncoding("UTF-8");
      if(mapper.register(av)==1) {
         PrintWriter out = resp.getWriter();
         resp.setContentType("text/html;charset=utf-8");
         out.println("<script>");
         out.println("alert('글 등록이 완료되었습니다..')");
          out.println("location.href='/board/academyBoard'");
          out.println("</script>");
          return null;
      }else {
          PrintWriter out = resp.getWriter();
          resp.setContentType("text/html;charset=utf-8");
          out.println("<script>");
          out.println("alert('다시 입력해 주세요')");
          out.println("location.href='/board/academyDetailEdit'");
          out.println("</script>");
          return null;
      }
   }
   
   @PostMapping("/registerTeacher")
   public String BoardRegisterTeacher(MultipartFile[] file, @ModelAttribute AcademyTeacherVO tv, HttpServletResponse resp, HttpSession session ,  HttpServletRequest req) throws Exception{
	   //String uploadPath = "C:\\Users\\ykp\\git\\Project_Aview\\src\\main\\webapp\\resources\\FileImage"; // 경필 저장 경로
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
           
           tv.setTeacherPhoto1(saveFileName);

           target = new File(uploadPath, saveFileName);
           file[i].transferTo(target);

           	tv.setTeacherPhoto1(saveFileName);
			/* av.setAcademyMapPhoto(saveFileName); */
       }
	   
      log.info(tv);
      resp.setCharacterEncoding("UTF-8");
      if(mapper.registerTeacher(tv)==1) {
         PrintWriter out = resp.getWriter();
         resp.setContentType("text/html;charset=utf-8");
         out.println("<script>");
         out.println("alert('글 등록이 완료되었습니다..')");
          out.println("location.href='/board/academyBoard'");
          out.println("</script>");
          return null;
      }else {
          PrintWriter out = resp.getWriter();
          resp.setContentType("text/html;charset=utf-8");
          out.println("<script>");
          out.println("alert('다시 입력해 주세요')");
          out.println("location.href='/board/academyDetailEdit'");
          out.println("</script>");
          return null;
      }
   }

@GetMapping("/academyBoard") 
   public String serviceGo(Model mo, Criteria cri, HttpSession session) throws Exception{
	   String id="";
	   id = (String)session.getAttribute("session_id");
	   
	   log.info("여기----------");
	   log.info(id);

	   try {
		 if(id.trim() != null || id.trim()!="" || !id.trim().equals("")) { }
	   if(mapper.acaId(id) == 1) {

		   mo.addAttribute("acaid", "acaOk");
	   } // try문에서 id값이 null이라 NullPointerException 발생 시 catch로 이동 , id값에 session_id값이 들어가 있어서 에러가 안뜨면 try문 실행 후 
	     // finally로 이동해서 계속 진행
	   }catch (NullPointerException e) {
		   mo.addAttribute("list", mapper.getList(cri));
			mo.addAttribute("pageMaker", new PageDTO(cri, mapper.getTotal(cri)));
			mo.addAttribute("total", mapper.getTotal(cri));
	      return "/WebContent/app/academy/academyBoard";
	}finally {
	   mo.addAttribute("list", mapper.getList(cri));
		mo.addAttribute("pageMaker", new PageDTO(cri, mapper.getTotal(cri)));
		mo.addAttribute("total", mapper.getTotal(cri));
      return "/WebContent/app/academy/academyBoard";
	}
   }
   //게시판 상세보기
   @GetMapping("/getBoard")
   public String getBoard(@Param("ano") int ano, Model mo) {
	   AcademyBoardVO vo = mapper.getAcademy(ano);
	 
		   if(vo.getAcademyYoutube().length() >=32) {
			   String youtube = vo.getAcademyYoutube().substring(32);
			   String realYoutube = "https://www.youtube.com/embed/"+youtube;
	   vo.setAcademyYoutube(realYoutube);
		   }
	   	mo.addAttribute("board", vo);
	   return "/WebContent/app/academy/getAcademy";
}
   
   //강사 상세보기
   @GetMapping("/getTeacher")
   public String getTeacher(@Param("ano") int tno, Model mo) {
	   AcademyTeacherVO av = mapper.getTeacher(tno);
	   
	   mo.addAttribute("board", av);
	   return "/WebContent/app/academy/getTeacher";
   }
   
   //게시판 수정 이동
   @GetMapping("/modifyBoard")
   public String modify(@Param("ano") int ano, Model mo) {
	   mo.addAttribute("board", mapper.getAcademy(ano));
	   return "/WebContent/app/academy/modifyAcademy";
   }
   @PostMapping("/modifyBoard")
   public String modifyBoard(AcademyBoardVO vo, HttpServletResponse resp) throws Exception{
		  log.info(vo);
		  vo.setAcademyIntro("임시값");
	  mapper.modifyBoard(vo);
	  resp.setCharacterEncoding("UTF-8");
	  PrintWriter out = resp.getWriter();
      resp.setContentType("text/html;charset=utf-8");
      out.println("<script>");
      out.println("alert('글 수정이 완료되었습니다..')");
       out.println("</script>");
       return "redirect:/board/getBoard?ano="+vo.getAno();
   }
   
   @GetMapping("/removeBoard")
   public String removeBoard(@Param("ano") int ano, HttpServletResponse resp) throws Exception{
	   mapper.removeBoard(ano);

	   return "redirect:/board/academyBoard";
	   
   }
   
   @GetMapping("/test")
   public String test() {
	   return "/WebContent/app/academy/test";
   }
}