package com.Aview.domain;

import java.util.Date;

import lombok.Data;

@Data
public class AcademyBoardReviewVO {
    private int ano;
	private int rno;
	private String writer;
	private String content;
	private Date redate;
}


