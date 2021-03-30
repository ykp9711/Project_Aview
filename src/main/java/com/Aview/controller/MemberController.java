package com.Aview.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Aview.domain.AcademyVO;
import com.Aview.domain.StudentVO;
import com.Aview.mapper.MemberMapper;
import com.Aview.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	@Autowired
	MemberService service;

	@Autowired
	MemberMapper mapper;

	@PostMapping("/stujoin")
	public String joinStu(StudentVO stu, HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String birth = stu.getYear() + "-" + stu.getMonth() + "-" + stu.getDate();
		stu.setU_birth(birth);
		if (service.stuJoin(stu) == 1) {
			return "redirect:/main/loginForm";
		}
		PrintWriter out = resp.getWriter();
		resp.setContentType("text/html;charset=utf-8");
		out.println("<script>");
		out.println("alert('회원가입 실패. 잠시 후 다시 시도해주세요.')");
		out.println("</script>");
		out.close();
		return "/join/stujoin";
	}

	// 아이디 중복 검사
	@GetMapping(value = "/check")
	@ResponseBody
	public String memberIdChkPOST(String memberId) throws Exception {

		int result = mapper.checkId(memberId);
		if (result != 0) {
			return "fail";
		} // 중복 아이디가 존재
		else {
			return "success"; // 중복 아이디 x }
		}
	}
	// 아이디 중복 검사 학원 
		@GetMapping(value = "/checkAca") 
		@ResponseBody public String memberIdChkPOST2(String memberId) throws Exception{ 
		 
			 int result = service.checkIdAca(memberId);
			if(result != 0) {
				return "fail";} // 중복 아이디가 존재  
				else { 
					return "success"; // 중복 아이디 x }
				}
				}
	//학원 회원가입
		@PostMapping("/acajoin")
		public String joinAca(AcademyVO aca, HttpServletRequest req, HttpServletResponse resp) throws Exception {
			if(service.acaJoin(aca)==1) {
				return "redirect:/main/loginForm";
			}
			 PrintWriter out = resp.getWriter();
			 resp.setContentType("text/html;charset=utf-8");
			 out.println("<script>");
			 out.println("alert('회원가입 실패. 잠시 후 다시 시도해주세요.')");
			 out.println("</script>");
			 out.close();
			 return "/join/acajoin";
		}
	// 학생 로그인
	@PostMapping("/stulogin")
	public String stuLogin(StudentVO stu,Model model, HttpServletRequest req, HttpServletResponse resp) throws Exception {
		if(service.stuLogin(stu)==1) {
			HttpSession session = req.getSession();
			session.setAttribute("session_id", stu.getU_id());
			return "redirect:/main/index";
		}else 
			resp.setCharacterEncoding("UTF-8");
			PrintWriter out = resp.getWriter();
			 resp.setContentType("text/html;charset=utf-8");
			 out.println("<script>");
			 out.println("alert('아이디 혹은 패스워드를 확인해주세요.')");
			 out.println("location.href='/main/loginForm'");
			 out.println("</script>");
		return null;
	}
	//학원 로그인
	@PostMapping("/acaLogin")
	public String acaLogin(AcademyVO aca,Model model, HttpServletRequest req, HttpServletResponse resp) throws Exception {
		if(service.acaLogin(aca)==1) {
			HttpSession session = req.getSession();
			session.setAttribute("session_id", aca.getAid());
			return "redirect:/main/index";
		}else
			resp.setCharacterEncoding("UTF-8");
			PrintWriter out = resp.getWriter();
			resp.setContentType("text/html;charset=utf-8");
			out.println("<script>");
			out.println("alert('아이디 혹은 패스워드를 확인해주세요.')");
			out.println("location.href='/main/loginForm'");
			out.println("</script>");
			return null;
	}
	// 로그아웃
	@GetMapping("/logout")
	public String logout(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.invalidate();
		return "redirect:/main/index";
	}
}
