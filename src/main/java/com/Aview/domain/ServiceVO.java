package com.Aview.domain;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class ServiceVO {
	private int bno;
	private String title;
	private String content;
	private String writer;
	private String regDate;
	private String password;
	private String react;
	private int rn;
}
