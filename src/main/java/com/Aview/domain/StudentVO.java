package com.Aview.domain;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class StudentVO {
	private String sid;
	private String spwd;
	private String spwdq;
	private String spwda;
	private String slastname;
	private String sfirstname;
	private String sbirth;
	private String year;
	private String month;
	private String date;	
	private String semail;
	private String sphone;
	private String szipcode;
	private String saddress;
	private String saddressdetail;
}
