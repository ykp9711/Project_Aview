package com.Aview.domain;

import lombok.Data;

@Data
public class StudentVO {
	private String u_id;
	private String u_pwd;
	private String u_pwd_q;
	private String u_pwd_a;
	private String u_last_name;
	private String u_first_name;
	private String u_birth;
	private String year;
	private String month;
	private String date;	
	private String u_email;
	private String u_phone;
	private String u_zipcode;
	private String u_address;
	private String u_address_detail;
}
