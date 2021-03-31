package com.Aview.mapper;

import java.util.List;

import com.Aview.domain.AcademyVO;
import com.Aview.domain.StudentVO;

public interface MemberMapper {

	public int stuJoin(StudentVO stu);
	
	public int checkId(String id);
	
	public int stuLogin(StudentVO stu);
	
	public int checkIdAca(String id);
	
	public int acaJoin(AcademyVO aca);
	
	public int acaLogin(AcademyVO aca);
	
	public StudentVO stuInfo(String id);
}
