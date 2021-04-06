package com.Aview.controller;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Aview.domain.AcademyVO;
import com.Aview.domain.StudentVO;
import com.Aview.mapper.MemberMapper;
import com.Aview.service.MemberService;

import jdk.internal.org.jline.utils.Log;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/list/*")
public class ListController {
	@Autowired
	MemberService service;

	@Autowired
	MemberMapper mapper;
	
	@Autowired
	StudentVO stu;
	
	@Autowired
	AcademyVO aca;
	
	//리뷰 페이지 이동
	@GetMapping("/review")
	public String reviewGo() {
		return "/WebContent/app/academy/boardAcademy";
	}
	
	@GetMapping("/register")
	public String registerList(HttpSession session, Model model, HttpServletRequest req, HttpServletResponse resp) throws Exception{
		String id = (String)session.getAttribute("session_id");
		model.addAttribute("session_id", session.getAttribute("session_id"));

		try {
		if(mapper.checkSessionIdStudent(id) != 0){ // 세션 id의 CHECKACADEMY가 0이면 현재 로그인 된 아이디는 학생 아이디임
			PrintWriter out = resp.getWriter();
			resp.setContentType("text/html;charset=utf-8");
			out.println("<script>");
			out.println("alert('일반 회원은 글 등록이 불가합니다<br>리뷰 게시판을 이용해주세요.')");
			out.println("</script>");
			out.close();
		}
		}catch(NullPointerException e) {
		 // 세션 id CHECKACADEMY가 0이 아님으로 현재 세션 ID는 학원 ID임
			aca = mapper.acaInfo(id);
			model.addAttribute("id",aca);
			return "/WebContent/app/academy/academyDetailEdit";
		}		
		return null;
	}

}
