package com.Aview.domain;

import lombok.Data;

@Data
public class StudentVO {
	private Long bno;
	private String s_id;
	private String s_pwd;
	private String s_pwd_q;
	private String s_pwd_a;
	private String s_last_name;
	private String s_first_name;
	private String s_gender;
	private String s_email;
	private String s_phone;
	private String s_residence;
}
