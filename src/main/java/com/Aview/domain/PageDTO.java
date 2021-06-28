package com.Aview.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {
	private int startPage;
	private int endPage;
	private int realEnd;
	private boolean prev, next;
	
	private int total;
	private Criteria cri;
	
	public PageDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		//현재 페이지를 기준으로 마지막 페이지를 구해준다.
		this.endPage = (int)(Math.ceil(cri.getPageNum() / 10.0) * 10);
		
		//마지막 페이지에서 -9를 하면 마지막페이지가 10이면 1이 나온다.
		this.startPage = endPage - 9;
		
		this.realEnd = (int)(Math.ceil((double)total / cri.getAmount()));
		
		if(realEnd < endPage) {
			endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < this.realEnd;
	}
}
