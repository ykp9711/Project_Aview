package com.Aview.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@RequestMapping("/board/*")
public class BoardController {
	
	@GetMapping("/academyBoard")
	public String academyBoardGo() {
		return "/WebContent/app/academy/academyBoard";
	}
	
	@GetMapping("/academyDetail")
	public String academyGo() {
		return "/WebContent/app/academy/academyDetail";
	}
	
	@GetMapping("/academyDetailEdit")
	public String academyEditGo() {
		return "/WebContent/app/academy/academyDetailEdit";
	}
	
	@GetMapping("/search")
	public String academysearchGo() {
		return "/WebContent/app/academy/search";
	}
}
