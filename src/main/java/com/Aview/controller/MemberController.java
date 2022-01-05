package com.Aview.controller;

import java.io.PrintWriter;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

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
		out.println("alert('�쉶�썝媛��엯 �떎�뙣. �옞�떆 �썑 �떎�떆 �떆�룄�빐二쇱꽭�슂.')");
		out.println("</script>");
		out.close();
		return "/join/stujoin";
	}

	// �븘�씠�뵒 以묐났 寃��궗
	@GetMapping(value = "/check")
	@ResponseBody
	public String memberIdChkPOST(String memberId) throws Exception {

		int result = service.checkId(memberId);
		int result2 = service.checkIdAca(memberId);
		if (result != 0 || result2 !=0) {
			return "fail";
		} // 以묐났 �븘�씠�뵒媛� 議댁옱
		else {
			return "success"; // 以묐났 �븘�씠�뵒 x }
		}
	}
	// �븘�씠�뵒 以묐났 寃��궗 �븰�썝 
//	@GetMapping(value = "/checkAca") 
//	@ResponseBody public String memberIdChkPOST2(String memberId) throws Exception{ 
//	 
//		 int result = service.checkIdAca(memberId);
//		if(result != 0) {
//			return "fail";} // 以묐났 �븘�씠�뵒媛� 議댁옱  
//			else { 
//				return "success"; // 以묐났 �븘�씠�뵒 x }
//			}
//			}
	//�븰�썝 �쉶�썝媛��엯
	@PostMapping("/acajoin")
	public String joinAca(AcademyVO aca, HttpServletRequest req, HttpServletResponse resp) throws Exception {
		if(service.acaJoin(aca)==1) {
			return "redirect:/main/loginForm";
		}
		 PrintWriter out = resp.getWriter();
		 resp.setContentType("text/html;charset=utf-8");
		 out.println("<script>");
		 out.println("alert('�쉶�썝媛��엯 �떎�뙣. �옞�떆 �썑 �떎�떆 �떆�룄�빐二쇱꽭�슂.')");
		 out.println("</script>");
		 out.close();
		 return "/join/acajoin";
	}
	// �븰�깮 濡쒓렇�씤
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
			 out.println("alert('�븘�씠�뵒 �샊�� �뙣�뒪�썙�뱶瑜� �솗�씤�빐二쇱꽭�슂.')");
			 out.println("location.href='/main/loginForm'");
			 out.println("</script>");
		return null;
	}
	//�븰�썝 濡쒓렇�씤
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
			out.println("alert('�븘�씠�뵒 �샊�� �뙣�뒪�썙�뱶瑜� �솗�씤�빐二쇱꽭�슂.')");
			out.println("location.href='/main/loginForm'");
			out.println("</script>");
			return null;
	}
	
	// 濡쒓렇�븘�썐
	@GetMapping("/logout")
	public String logout(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.invalidate();
		return "redirect:/main/index";
	}
	//留덉씠�럹�씠吏� �럹�씠吏� �씠�룞
	@GetMapping("/userinfo")
	public String userInfo(HttpSession session, Model model) {
		String id = (String)session.getAttribute("session_id");
		model.addAttribute("session_id", session.getAttribute("session_id"));
		
		log.info(mapper.checkSessionIdStudent(id));
		try {
		if(mapper.checkSessionIdStudent(id) == 0){ // �꽭�뀡 id�쓽 CHECKACADEMY媛� 0�씠硫� �쁽�옱 濡쒓렇�씤 �맂 �븘�씠�뵒�뒗 �븰�깮 �븘�씠�뵒�엫
			stu = mapper.stuInfo(id);
			model.addAttribute("id", stu);
			return "/WebContent/app/member/userinfo";
		}
		}catch(NullPointerException e) {
		 // �꽭�뀡 id CHECKACADEMY媛� 0�씠 �븘�떂�쑝濡� �쁽�옱 �꽭�뀡 ID�뒗 �븰�썝 ID�엫
			aca = mapper.acaInfo(id);
			model.addAttribute("id",aca);
			return "/WebContent/app/member/acainfo";
		}		
		return null;
	}
	
	//留덉씠�럹�씠吏� �븰�깮 �닔�젙
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
				out.println("alert('�쉶�썝 �젙蹂� �닔�젙�씠 �셿猷� �릺�뿀�뒿�땲�떎.')");
				out.println("location.href='/member/userinfo'");
				out.println("</script>");
				
				return null;
			}else {
			 PrintWriter out = resp.getWriter();
			 resp.setContentType("text/html;charset=utf-8");
			 out.println("<script>");
			 out.println("alert('�떎�떆 �엯�젰�빐 二쇱꽭�슂')");
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
				out.println("alert('�쉶�썝 �젙蹂� �닔�젙�씠 �셿猷� �릺�뿀�뒿�땲�떎.')");
				out.println("location.href='/member/userinfo'");
				out.println("</script>");
				out.close();
				return null;
			}else {
			 PrintWriter out = resp.getWriter();
			 resp.setContentType("text/html;charset=utf-8");
			 out.println("<script>");
			 out.println("alert('�떎�떆 �엯�젰�빐 二쇱꽭�슂')");
			 out.println("location.href='/member/userinfo'");
			 out.println("</script>");
			 out.close();
			 return null;
			}
		}
		// �븰�깮 ID李얘린
		@GetMapping("/stuFindId")
		public String StuFindId() {
			return "/WebContent/app/member/findId";
		}
		
		// �븰�깮 PW李얘린
		@GetMapping("/stuFindPw")
		public String StuFindPw() {
			 return "/WebContent/app/member/findPw";
		}
		
		@GetMapping("/sms")
		@ResponseBody
		public String ExampleSend(String phone) {
			log.info("�뱾�뼱�샂");
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
			    params.put("to", phone.replace("-", "")); // �닔�떊踰덊샇 010-1234-5678 01012345678
			    params.put("from", "01085631665"); // 諛쒖떊踰덊샇
			    params.put("type", "SMS"); // Message type ( SMS, LMS, MMS, ATA )
			    params.put("text", code); // 臾몄옄�궡�슜    
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
		// �씤利앹꽦怨� �떆 鍮꾨�踰덊샇 蹂댁뿬以�
		@GetMapping("pwInfo")
		public String pwInfo(@Param("phone") String phone, Model mo) {
			String number = phone.replace("-","");
			mo.addAttribute("info", mapper.getPw(number));
			return "/WebContent/app/member/findPwResult";
		}
		
		@GetMapping("pwInfoAca")
		public String pwInfoAca(@Param("phone") String phone, Model mo) {
			String number = phone.replace("-","");
			mo.addAttribute("info", mapper.getPwAca(number));
			return "/WebContent/app/member/findPwResultAca";
		}
		
		@GetMapping("/findIDaca")
		public String findIDacaGo() {
			return "/WebContent/app/member/findIdAca";
		}
		
		@GetMapping("/acaCheckId")
		public String acaCheckIdGo() {
			return "/WebContent/app/code/checkId";
		}
		
		@GetMapping("/acaFindPw")
		public String acaCheckPwGo() {
			return "/WebContent/app/code/checkUserPw";
		}

		
		@PostMapping("/checkIdAca")
		public String checkIdAcaGo(Model model, @Param("aid") String aid, HttpServletResponse resp) throws Exception {
			model.addAttribute("aid", aid);
			log.info(aid);
			if(mapper.acaAcademyCheck2(aid)==1) {
				return "/WebContent/app/code/checkUserPw";
			}
			else
				resp.setCharacterEncoding("UTF-8");
				PrintWriter out = resp.getWriter();
				resp.setContentType("text/html;charset=utf-8");
				out.println("<script>");
				out.println("alert('�뾾�뒗 �븘�씠�뵒�엯�땲�떎.')");
				out.println("location.href='/member/acaCheckId'");
				out.println("</script>");
				return null;
		}
		
		@GetMapping("/acaIdResult")
		public String acaIdResultGo(Model model, @Param("aname") String aname, HttpServletResponse resp) throws Exception{
				model.addAttribute("aname", aname);
				log.info(aname);
				aca = mapper.getResult(aname);
				model.addAttribute("id", aca);
				return "/WebContent/app/member/IdResultAca";
		}
		
		@GetMapping("/stuIdResult")
		public String stuIdResultGo(Model model, @Param("semail") String semail, HttpServletResponse resp) throws Exception{
				model.addAttribute("semail", semail);
				log.info(semail);
				stu = mapper.getResultstu(semail);
				model.addAttribute("id", stu);
				return "/WebContent/app/member/IdResultStu";
		}
		
		@PostMapping("/acafindId")
		public String acafindIdGo(AcademyVO aca, Model model, @Param("aname") String aname, HttpServletResponse resp) throws Exception {
			log.info(aname);
			log.info(aca);
			model.addAttribute("aname", aname);

			if(mapper.acafindId(aca)==1) {
				return "redirect:/member/acaIdResult";
			}
			else
				resp.setCharacterEncoding("UTF-8");
				PrintWriter out = resp.getWriter();
				resp.setContentType("text/html;charset=utf-8");
				out.println("<script>");
				out.println("alert('紐⑤뱺 �빆紐⑹쓣 �옉�꽦�빐二쇱꽭�슂.')");
				out.println("location.href='/member/findIDaca'");
				out.println("</script>");
				return null;
		}
		
		@PostMapping("/stufindId")
		public String stufindIdGo(StudentVO stu, Model model,@Param("semail") String semail, HttpServletResponse resp) throws Exception {
			log.info(semail);
			log.info(stu);
			model.addAttribute("semail", semail);

			if(mapper.stufindId(stu)==1) {
				return "redirect:/member/stuIdResult";
			}
			else
				resp.setCharacterEncoding("UTF-8");
				PrintWriter out = resp.getWriter();
				resp.setContentType("text/html;charset=utf-8");
				out.println("<script>");
				out.println("alert('紐⑤뱺 �빆紐⑹쓣 �옉�꽦�빐二쇱꽭�슂.')");
				out.println("location.href='/member/stuFindId'");
				out.println("</script>");
				return null;
		}
		
		@GetMapping("/acaLeave")
		public void acaLeave(@RequestParam("aid") String aid, HttpServletResponse resp,HttpSession sessionid) throws Exception {
			mapper.acaLeave(aid);
			sessionid.invalidate();
			resp.setCharacterEncoding("UTF-8");
			PrintWriter out = resp.getWriter();
			resp.setContentType("text/html;charset=utf-8");
			out.println("<script>");
			out.println("alert('�깉�눜�릺�뿀�뒿�땲�떎')");
			out.println("location.href='/main/index'");
			out.println("</script>");
			
		}
		@GetMapping("/userLeave")
		public void userLeave(@RequestParam("sid") String sid, HttpServletResponse resp,HttpSession sessionid) throws Exception {
			mapper.userLeave(sid);
			sessionid.invalidate();
			resp.setCharacterEncoding("UTF-8");
			PrintWriter out = resp.getWriter();
			resp.setContentType("text/html;charset=utf-8");
			out.println("<script>");
			out.println("alert('�깉�눜�릺�뿀�뒿�땲�떎')");
			out.println("location.href='/main/index'");
			out.println("</script>");
			
		}
//		// �씤利앹꽦怨� �떆 鍮꾨�踰덊샇 蹂댁뿬以�
//		@GetMapping("pwInfo")
//		public String pwInfoAca(@Param("phone") String phone, Model mo) {
//			String number = phone.replace("-","");
//			mo.addAttribute("info", mapper.getPwAca(number));
//			return "/WebContent/app/member/findPwResultAca";
//		}
			
}
