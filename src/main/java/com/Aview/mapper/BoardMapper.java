package com.Aview.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.Aview.domain.AcademyBoardVO;
import com.Aview.domain.AcademyFacilityVO;
import com.Aview.domain.AcademyTeacherVO;
import com.Aview.domain.Criteria;

public interface BoardMapper {
	public int register(AcademyBoardVO vo);
	
	public List<AcademyBoardVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);
	
	public AcademyBoardVO getAcademy(int ano);
	
	public int acaId(String id); // 세션 id를 보내 학원아이디인지 확인
	
	public int modifyBoard(AcademyBoardVO vo); // 게시글 수정
	
	public void removeBoard(int ano); // 게시글 삭제
	
	public void academyPhoto(AcademyFacilityVO fv); // 시설사진 등록
	
	public int getBoardSeq(); // 글 등록시 ano 값 가져옴
	
	public List<AcademyFacilityVO> getFacility(int ano); // 시설물 정보 가져옴
	
	public void academyTeacher(List<AcademyTeacherVO> tv);
	
	


}