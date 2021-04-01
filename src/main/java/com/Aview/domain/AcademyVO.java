package com.Aview.domain;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class AcademyVO {
	private String aname;
	private String aid;
	private String acorporate;
	private String apwd;
	private String apwdq;
	private String apwda;
	private String aemail;
	private String aphone;
	private String azipcode;
	private String aaddress;
	private String aaddressdetail;
}
