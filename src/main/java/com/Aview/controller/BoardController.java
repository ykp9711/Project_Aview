package com.Aview.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.Aview.domain.AcademyBoardVO;
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
      return "/WebContent/app/academy/academyDetail";
   }
   
   @GetMapping("/academyDetailEdit")
   public String academyEditGo() {
      return "/WebContent/app/academy/academyDetailEdit";
   }
   
   
   @PostMapping("/register")
   public String BoardRegister(AcademyBoardVO av, HttpServletResponse resp, HttpSession session) throws Exception{
      av.setAcademyId((String)session.getAttribute("session_id"));
      log.info("여기");
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
   
   @GetMapping("/academyBoard") 
   public String serviceGo(Model mo, Criteria cri) {
     mo.addAttribute("list", mapper.getList(cri));
     mo.addAttribute("total", mapper.getTotal());
     mo.addAttribute("pageMaker", new PageDTO(cri, mapper.getTotal()));
      return "/WebContent/app/academy/academyBoard";
   }
}