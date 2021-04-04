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
@RequestMapping("/member/*")
public class MemberController {
	@Autowired
	MemberService service;

	@Autowired
	MemberMapper mapper;
	
	@Autowired
	StudentVO stu;
	
	@Autowired
	AcademyVO aca;

	@PostMapping("/stujoin")
	public String joinStu(StudentVO stu, HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String birth = stu.getYear() + "-" + stu.getMonth() + "-" + stu.getDate();
		stu.setSbirth(birth);
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

		int result = service.checkId(memberId);
		int result2 = service.checkIdAca(memberId);
		if (result != 0 || result2 !=0) {
			return "fail";
		} // 중복 아이디가 존재
		else {
			return "success"; // 중복 아이디 x }
		}
	}
	// 아이디 중복 검사 학원 
//	@GetMapping(value = "/checkAca") 
//	@ResponseBody public String memberIdChkPOST2(String memberId) throws Exception{ 
//	 
//		 int result = service.checkIdAca(memberId);
//		if(result != 0) {
//			return "fail";} // 중복 아이디가 존재  
//			else { 
//				return "success"; // 중복 아이디 x }
//			}
//			}
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
			session.setAttribute("session_id", stu.getSid());
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
	//마이페이지 페이지 이동
	@GetMapping("/userinfo")
	public String userInfo(HttpSession session, Model model) {
		String id = (String)session.getAttribute("session_id");
		model.addAttribute("session_id", session.getAttribute("session_id"));
		
		log.info(mapper.checkSessionIdStudent(id));
		try {
		if(mapper.checkSessionIdStudent(id) == 0){ // 세션 id의 CHECKACADEMY가 0이면 현재 로그인 된 아이디는 학생 아이디임
			stu = mapper.stuInfo(id);
			model.addAttribute("id", stu);
			return "/WebContent/app/member/userinfo";
		}
		}catch(NullPointerException e) {
		 // 세션 id CHECKACADEMY가 0이 아님으로 현재 세션 ID는 학원 ID임
			aca = mapper.acaInfo(id);
			model.addAttribute("id",aca);
			return "/WebContent/app/member/acainfo";
		}		
		return null;
	}
	
	//마이페이지 학생 수정
//	@PostMapping("/infoModifystu")
//	public String edit_user_apply(UserInfo userinfo, ModelMap modelMap) throws Exception { 
//		int updateCount = service.updatetUser(userinfo);
//		return "redirect:/hello_world.iot"; 
//	}
		@PostMapping("/infoModifystu")
		public String updateStu(StudentVO stu, HttpServletRequest req, HttpServletResponse resp) throws Exception {
			if(mapper.stuUpdate(stu)==1) {
				PrintWriter out = resp.getWriter();
				resp.setContentType("text/html;charset=utf-8");
				out.println("<script>");
				out.println("alert('회원 정보 수정이 완료 되었습니다.')");
				out.println("</script>");
				out.close();
				return "/WebContent/index";
			}
			 PrintWriter out = resp.getWriter();
			 resp.setContentType("text/html;charset=utf-8");
			 out.println("<script>");
			 out.println("alert('빈칸 없이 입력해주세요.')");
			 out.println("</script>");
			 out.close();
			 return "/WebContent/index";
		}
		
		@PostMapping("/infoModifyaca")
		public String updateStu(AcademyVO aca, HttpServletRequest req, HttpServletResponse resp) throws Exception {
			if(mapper.acaUpdate(aca)==1) {
				PrintWriter out = resp.getWriter();
				resp.setContentType("text/html;charset=utf-8");
				out.println("<script>");
				out.println("alert('회원 정보 수정이 완료 되었습니다.')");
				out.println("</script>");
				out.close();
				return "/WebContent/index";
			}
			 PrintWriter out = resp.getWriter();
			 resp.setContentType("text/html;charset=utf-8");
			 out.println("<script>");
			 out.println("alert('빈칸 없이 입력해주세요.')");
			 out.println("</script>");
			 out.close();
			 return "/WebContent/index";
		}
}
