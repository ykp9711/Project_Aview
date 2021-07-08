package com.Aview.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Aview.domain.Criteria;
import com.Aview.domain.ReviewVO;
import com.Aview.mapper.ReviewMapper;

@Service
public class ReviewServiceImpl implements ReviewService {

		@Autowired
		ReviewMapper mapper;
	@Override
	public int register(ReviewVO rv) {
		return mapper.register(rv);
	}

	@Override
	public List<ReviewVO> getList(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getList(cri);
	}

	@Override
	public int getTotal() {
		// TODO Auto-generated method stub
		return mapper.getTotal();
	}

	@Override
	public ReviewVO getReview(int bno) {
		// TODO Auto-generated method stub
		return mapper.getReview(bno);	
	}
	@Override
	public int modify(ReviewVO rv) {
		// TODO Auto-generated method stub
		return mapper.modify(rv);
	}

	@Override
	public void delete(int bno) {
		mapper.delete(bno);
	}

	
	
}
