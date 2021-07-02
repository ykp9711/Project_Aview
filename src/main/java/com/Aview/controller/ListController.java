package com.Aview.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.Aview.domain.Criteria;
import com.Aview.domain.PageDTO;
import com.Aview.domain.ReviewVO;
import com.Aview.mapper.ReviewMapper;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/list/*")
public class ListController {
//	@Autowired
//	ReivewService service;

	@Autowired
	ReviewMapper mapper;
	
	//리뷰 페이지 이동
	@GetMapping("/review") 
	public String reviewGo(Model mo ,Criteria cri) {
		mo.addAttribute("list", mapper.getList(cri));
		mo.addAttribute("pageMaker", new PageDTO(cri, mapper.getTotal()));
		mo.addAttribute("total", mapper.getTotal());
		
		return "/WebContent/app/review/boardAcademy";
	}

	//리뷰 글쓰기 페이지 이동
	@GetMapping("/registerGo")
	public String registerGo() {
		return "/WebContent/app/review/register";
	}
	
    //리뷰 글 등록
	@PostMapping("/register")
	public String register(ReviewVO rv, HttpServletResponse resp) throws Exception{
		resp.setCharacterEncoding("UTF-8");
		if(mapper.register(rv)==1) {
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
	public String getReview(ReviewVO rv, Model mo) {
		mo.addAttribute("review", mapper.getReview(rv.getBno()));
		return "/WebContent/app/review/getReview";
	}

	// 리뷰 수정
	@PostMapping("/modify")
		public String modify(ReviewVO rv , Model mo , HttpServletResponse resp) throws Exception {
			mapper.modify(rv);
			 return "redirect:/list/getReview?bno=" + rv.getBno();
	}
	
	@GetMapping("/delete")
	public String delete(@Param("bno") int bno) {
		mapper.delete(bno);
		
		return "redirect:/list/review";
	}

}
