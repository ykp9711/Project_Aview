package com.Aview.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.Aview.domain.Criteria;
import com.Aview.domain.PageDTO;
import com.Aview.domain.ReviewVO;
import com.Aview.mapper.ReviewMapper;
import com.Aview.service.ReviewService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/list/*")
public class ListController {
//	@Autowired
//	ReivewService service;

	@Autowired
	ReviewService service;
	
	//리뷰 페이지 이동
	@GetMapping("/review") 
	public String reviewGo(Model mo ,Criteria cri) {
		mo.addAttribute("list", service.getList(cri));
		mo.addAttribute("pageMaker", new PageDTO(cri, service.getTotal()));
		mo.addAttribute("total", service.getTotal());
		
		return "/WebContent/app/review/boardAcademy";
	}

	//리뷰 글쓰기 페이지 이동 , session id가 존재 할 시 글쓰기 페이지로 이동 , session이 존재하지 않을 시 로그인 페이지로 이동
	@GetMapping("/registerGo")
	public String registerGo(HttpServletResponse resp , HttpSession session) throws Exception {
		String id = (String) session.getAttribute("session_id");
		resp.setCharacterEncoding("UTF-8");
		if(id == "" || id==null) {
			PrintWriter out = resp.getWriter();
			resp.setContentType("text/html;charset=utf-8");
			out.println("<script>");
			out.println("alert('로그인 후 이용해주세요')");
			out.println("location.href='/main/loginForm'");
			out.println("</script>");
			return null;
		}else
		return "/WebContent/app/review/register";
	}
	
    //리뷰 글 등록
	@PostMapping("/register")
	public String register(ReviewVO rv, HttpServletResponse resp) throws Exception{
		resp.setCharacterEncoding("UTF-8");
		if(service.register(rv)==1) {
			PrintWriter out = resp.getWriter();
			resp.setContentType("text/html;charset=utf-8");
			out.println("<script>");
			out.println("alert('글 등록이 완료되었습니다..')");
			
			 out.println("location.href='/list/review'");
			 out.println("</script>");
			 return null;
		}else {
			PrintWriter out = resp.getWriter();
			 resp.setContentType("text/html;charset=utf-8");
			 out.println("<script>");
			 out.println("alert('다시 입력해 주세요')");
			 out.println("location.href='/member/userinfo'");
			 out.println("</script>");
			 return null;
		}
	}
	// 리뷰 글 상세보기
	@GetMapping("/getReview")
	public String getReview(ReviewVO rv, Model mo, @ModelAttribute("cri") Criteria cri) {
		mo.addAttribute("review", service.getReview(rv.getBno()));
		return "/WebContent/app/review/getReview";
	}

	// 리뷰 수정
	@PostMapping("/modify")
		public String modify(ReviewVO rv , Model mo , HttpServletResponse resp) throws Exception {
			service.modify(rv);
			 return "redirect:/list/getReview?bno=" + rv.getBno();
	}
	
	//리뷰 삭제
	@GetMapping("/delete")
	public String delete(@Param("bno") int bno, HttpSession session , HttpServletResponse resp) throws Exception{
		String id = service.getReview(bno).getWriter(); // 게시물에 등록된 ID
		String session_id = (String)session.getAttribute("session_id");
		
		if(id.equals(session_id)) {
		service.delete(bno);
		return "redirect:/list/review";
		}else {
			resp.setCharacterEncoding("UTF-8");
			PrintWriter out = resp.getWriter();
			resp.setContentType("text/html;charset=utf-8");
			out.println("<script>");
			out.println("alert('다른 회원의 게시글을 삭제 할 수 없습니다.')");
			out.println("window.history.back();");
			out.println("</script>");
			return null;
		}
	}

}
