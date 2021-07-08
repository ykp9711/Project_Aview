package com.Aview.service;

import java.util.List;

import com.Aview.domain.Criteria;
import com.Aview.domain.ReviewVO;

public interface ReviewService {

	public int register(ReviewVO rv);
	
	public List<ReviewVO> getList(Criteria cri);
	
	public int getTotal();
	
	public ReviewVO getReview(int bno);
	
	public int modify(ReviewVO rv);
	
	public void delete(int bno);
}
