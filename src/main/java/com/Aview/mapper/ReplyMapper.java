package com.Aview.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.Aview.domain.Criteria;
import com.Aview.domain.ReplyVO;

public interface ReplyMapper {
	public int getTotal(Long bno);
	
	public int insert(ReplyVO reply);
	
	public int delete(Long rno);
	
	public ReplyVO read(Long rno);
	
	public int update(ReplyVO reply);
	
	//기존의 게시물 페이징 처리 + 특정 게시물 번호를 전달하여야한다.
	//mybatis는 두개 이상의 데이터를 파라미터로 전달하기 위해서는 별도의 객체를 구성하거나, map을 이용
	//@Param 어노테이션으로 key값
	public List<ReplyVO> getListWithPaging(@Param("cri") Criteria cri, @Param("bno") Long bno);
}
