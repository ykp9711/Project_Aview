package com.Aview.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.Aview.domain.AcademyBoardVO;
import com.Aview.domain.Criteria;

public interface BoardMapper {
	public int register(AcademyBoardVO vo);
	
	public List<AcademyBoardVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);
	
	/*
	 * public int getTotal(Criteria cri);
	 * 
	 * public List<AcademyBoardVO> getList(Criteria cri);
	 */
}
