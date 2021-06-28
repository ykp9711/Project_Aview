package com.Aview.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//Criteria는 검색의 기준
@Getter
@Setter
@ToString
public class Criteria {

	private int pageNum;
	private int amount;
	
	private String type;
	private String keyword;
	
	public Criteria() { // 처음에 list들어갔을 때 pageNum, 과 amount가 없으니깐 자동으로 입력해주어서 페이징 처리를 한다.
		this(1,10);
	}
	
	public Criteria(int pageNum, int amount) { //무조건 pageNum,과 amount가 있어야 페이징 처리가 되게끔 한다.
		super();
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String[] getTypeArr() {
		//split("") : 구분점 없이 각 문자를 하나 씩 분리
		//예) "ABC".split("")[0] : "A"
		return type == null ? new String[] {} : type.split("");
	}
	
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.pageNum)
				.queryParam("amount", this.amount)
				.queryParam("keyword", this.keyword)
				.queryParam("type", this.type);
				
		return builder.toUriString();
	}
}
