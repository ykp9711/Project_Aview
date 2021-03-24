package com.Aview.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main/*")
public class MainController {
	
	@GetMapping("/index")
	public String mainGo() {
		return "/WebContent/index";
	}
	
	@GetMapping("/loginForm")
	public String loginGo() {
		return "/WebContent/app/member/loginForm";
	}
	
	@GetMapping("/joinStudentForm")
	public String joinGo() {
		return "/WebContent/app/member/joinStudentForm";
	}
	
	@GetMapping("/joinAcademyForm")
	public String joinAcademyGo() {
		return "/WebContent/app/member/joinFormAcademy";
	}
}
