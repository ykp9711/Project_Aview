package com.Aview.domain;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class ReviewVO {
	private String title;
	private String content;
	private String writer;
}
