package com.Aview.mapper;

import java.util.List;

import com.Aview.domain.AcademyCustomerReviewVO;
import com.Aview.domain.Criteria;
import com.Aview.domain.ServiceVO;

public interface ServiceMapper {
	
	public int register(ServiceVO sv);
	
	public List<ServiceVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);
	
	public ServiceVO get(int bno);
	
	public ServiceVO check(Long bno);
	
	public int modify(ServiceVO sv);
	
	public void delete(int bno);
	
	public ServiceVO modifyGo(String password);
	
	public int insertReview(AcademyCustomerReviewVO ar); // 학원 리뷰 등록
	
	public void removeReview(int rno); // 학원 리뷰 삭제

	
}
