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

import java.util.HashMap;

import org.apache.ibatis.annotations.Param;
import org.json.simple.JSONObject;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

import com.Aview.domain.AcademyVO;
import com.Aview.domain.FindPwVO;
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
			resp.setCharacterEncoding("UTF-8");
			if(mapper.stuUpdate(stu)==1) {
				PrintWriter out = resp.getWriter();
				resp.setContentType("text/html;charset=utf-8");
				out.println("<script>");
				out.println("alert('회원 정보 수정이 완료 되었습니다.')");
				out.println("location.href='/member/userinfo'");
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
		
		@PostMapping("/infoModifyaca")
		public String updateStu(AcademyVO aca, HttpServletRequest req, HttpServletResponse resp) throws Exception {
			resp.setCharacterEncoding("UTF-8");
			if(mapper.acaUpdate(aca)==1) {
				PrintWriter out = resp.getWriter();
				resp.setContentType("text/html;charset=utf-8");
				out.println("<script>");
				out.println("alert('회원 정보 수정이 완료 되었습니다.')");
				out.println("location.href='/member/userinfo'");
				out.println("</script>");
				out.close();
				return null;
			}else {
			 PrintWriter out = resp.getWriter();
			 resp.setContentType("text/html;charset=utf-8");
			 out.println("<script>");
			 out.println("alert('다시 입력해 주세요')");
			 out.println("location.href='/member/userinfo'");
			 out.println("</script>");
			 out.close();
			 return null;
			}
		}
		// 학생 ID찾기
		@GetMapping("/stuFindId")
		public String StuFindId() {
			return "/WebContent/app/member/findId";
		}
		
		// 학생 PW찾기
		@GetMapping("/stuFindPw")
		public String StuFindPw() {
			 return "/WebContent/app/member/findPw";
		}
		
		@GetMapping("/sms")
		@ResponseBody
		public String ExampleSend(String phone) {
			log.info("들어옴");
			    String api_key = "";
			    String api_secret = "";
			    String ramdom[] = {"a","b","c","d","e","f","g","h","i","j","k","l","n","m","o","p","q","r","s","t","u","v","w","x","y","z","1","2","3","4","5","6","7","8","9","0"};
			    String code = "";
			    for(int i=0; i<4; i++) {
			    	int num = (int)(Math.random()*35);
			    	code+= ramdom[num];
			    }
				/*
				 * String phone[] = vo.getPhone().split("-"); String number =
				 * phone[0]+phone[1]+phone[2];
				 */
			    Message coolsms = new Message(api_key, api_secret);

			   
			    HashMap<String, String> params = new HashMap<String, String>();
			    params.put("to", phone.replace("-", "")); // 수신번호 010-1234-5678 01012345678
			    params.put("from", "01085631665"); // 발신번호
			    params.put("type", "SMS"); // Message type ( SMS, LMS, MMS, ATA )
			    params.put("text", code); // 문자내용    
			    params.put("app_version", "JAVA SDK v2.2"); // application name and version


			    try {
			      JSONObject obj = (JSONObject) coolsms.send(params);
			      System.out.println(obj.toString());
			    } catch (CoolsmsException e) {
			      System.out.println(e.getMessage());
			      System.out.println(e.getCode());
			    }
			    return code;
			  }
		// 인증성공 시 비밀번호 보여줌
		@GetMapping("pwInfo")
		public String pwInfo(@Param("phone") String phone, Model mo) {
			String number = phone.replace("-","");
			mo.addAttribute("info", mapper.getPw(number));
			return "/WebContent/app/member/findPwResult";
		}
		
			
}
