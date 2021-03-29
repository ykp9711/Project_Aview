package com.Aview.mapper;

import com.Aview.domain.AcademyVO;
import com.Aview.domain.StudentVO;

public interface MemberMapper {

	public int stuJoin(StudentVO stu);
	
	public int checkId(String id);
	
	public int stuLogin(StudentVO stu);
	
	public int checkIdAca(String id);
	
	public int acaJoin(AcademyVO aca);
}
