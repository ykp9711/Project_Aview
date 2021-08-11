package com.Aview.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
import com.Aview.domain.AcademyPhotoVO;
import com.Aview.domain.AcademyTeacherVO;
import com.Aview.domain.Criteria;
import com.Aview.domain.PageDTO;
import com.Aview.domain.Upload;
import com.Aview.mapper.BoardMapper;

import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@RequestMapping("/board/*")
public class BoardController {
   @Autowired
   Upload up;
	
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
	   ArrayList<String> fileName = new ArrayList<>(); // 파일 이름들을 받을 리스트 생성
	   
	   fileName=(ArrayList<String>) up.FileUpload(file); // 받아온 파일 이름들을 리스트에 저장
	   
	   for(int i=0; i<fileName.size(); i++) { // 리스트 크기만큼 반복
		   av.setAcademyPhoto(fileName.get(i)); // 파일들을 DB에 저장
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
   
   @PostMapping("/acatest")
   public void acatest(MultipartFile file[], AcademyPhotoVO vo) throws IOException {
	   ArrayList<String> fileName = new ArrayList<>(); // 리턴값을 받아 줄 리스트 생성
	  log.info("여기-----");
		  fileName = (ArrayList<String>) up.FileUpload(file); // 저장된 파일이름 받아줌
	
		  log.info(fileName.get(0));

	   
		   }
   
}