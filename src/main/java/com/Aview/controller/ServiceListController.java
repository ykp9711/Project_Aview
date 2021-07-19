package com.Aview.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.mapper.MapperListener;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.Aview.domain.Criteria;
import com.Aview.domain.PageDTO;
import com.Aview.domain.ServiceVO;
import com.Aview.mapper.ServiceMapper;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/serviceList/*")
public class ServiceListController {
//	@Autowired
//	ReivewService service;

	@Autowired

	ServiceMapper mapper;
	

	//고객센터 페이지 이동
		@GetMapping("/service") 
		public String serviceGo(Model mo ,Criteria cri) {
			mo.addAttribute("list", mapper.getList(cri));
			mo.addAttribute("pageMaker", new PageDTO(cri, mapper.getTotal(cri)));
			mo.addAttribute("total", mapper.getTotal(cri));
			
			return "/WebContent/app/CustomerService/serviceAcademy";
		}

		//고객센터 글 쓰기 페이지 이동
		@GetMapping("/registerServiceGo")
		public String registerServiceGo() {
			return "/WebContent/app/CustomerService/registerService";
		}
		
		//고객센터 글 쓴거 등록
		@PostMapping("registerService")
		public String registerService(ServiceVO sv, HttpServletResponse resp) throws Exception{
			resp.setCharacterEncoding("UTF-8");
			if(mapper.register(sv)==1) {
				PrintWriter out = resp.getWriter();
				resp.setContentType("text/html;charset=utf-8");
				out.println("<script>");
				out.println("alert('글 등록이 완료되었습니다..')");
				
				 out.println("location.href='/serviceList/service'");
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
		
		//고객센터 게시물 들어가기
		@GetMapping("/get")
		public String getGo(Model mo ,@RequestParam("bno") int bno,@ModelAttribute("cri")Criteria cri) {
			mo.addAttribute("list", mapper.get(bno));
			return "/WebContent/app/CustomerService/getGo";
		}
		
		//게시물 수정하기
		@PostMapping("/modify")
		public String modify(ServiceVO sv, Criteria cri, HttpServletResponse resp) throws Exception{

			if(mapper.modify(sv)==1) {		
				resp.setCharacterEncoding("UTF-8");
				PrintWriter out = resp.getWriter();
				resp.setContentType("text/html;charset=utf-8");
				out.println("<script>");
				out.println("alert('글 수정이 완료되었습니다..')");
				 out.println("window.close()");
				 out.println("</script>");
				 return null;
				 
			}else {
				resp.setCharacterEncoding("UTF-8");
				PrintWriter out = resp.getWriter();
				 resp.setContentType("text/html;charset=utf-8");
				 out.println("<script>");
				 out.println("alert('다시 입력해 주세요')");
				 out.println("location.href='/serviceList/get'");
				 out.println("</script>");
				 return null;
			}
		}
		
		//게시글 비밀번호 확인
		@GetMapping("/checkPw")
		public String checkPw(Model mo,@Param("pw") String pw, @Param("bno") int bno, HttpServletResponse resp) throws Exception{
			mo.addAttribute("pw",pw); 
			mo.addAttribute("bno", bno);
			resp.setCharacterEncoding("UTF-8");
			PrintWriter out = resp.getWriter();
			resp.setContentType("text/html;charset=utf-8");
			out.println("<script>");
			out.println("location.href='/serviceList/service'");
			out.println("</script>");
			// 비번이랑 bno만 넘기면 될듯? 근데 비번은 이미 아까 @param으로 받은 패스워드가 게시판 비번이니까 굳이 또 db 조회 안해도 될듯
			return "/WebContent/app/CustomerService/checkPw"; // 비밀번호 치는 페이지로 게시판 비번이랑 번호 보내기  >> 다음 컨트롤러 그냥 다시쓰
		}

		@GetMapping("/modifyGo")
		public String modfiyGo(Model mo ,@Param("bno") int bno,@ModelAttribute("cri")Criteria cri) {
			mo.addAttribute("list", mapper.get(bno));
			return "/WebContent/app/CustomerService/modifyGo"; 
		}

		//게시글 삭제하기
		@GetMapping("/delete")
		public String delete(@Param("bno") int bno, Criteria cri, HttpServletResponse resp) throws Exception{
			mapper.delete(bno);
			return "redirect:/serviceList/service"; 
		}

}
