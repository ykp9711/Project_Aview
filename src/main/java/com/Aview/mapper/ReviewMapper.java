package com.Aview.mapper;

import java.util.List;

import com.Aview.domain.Criteria;
import com.Aview.domain.ReviewVO;

public interface ReviewMapper {
	
	public int register(ReviewVO rv);
	
	public List<ReviewVO> getList(Criteria cri);
	
	public int getTotal();
	
	public ReviewVO getReview(int bno);
	
	public int modify(ReviewVO rv);
	
	public void delete(int bno);
}
