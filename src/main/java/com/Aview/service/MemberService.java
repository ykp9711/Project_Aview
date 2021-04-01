package com.Aview.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.Aview.domain.AcademyVO;
import com.Aview.domain.StudentVO;
import com.Aview.mapper.MemberMapper;

public interface MemberService {
	
	public int stuJoin(StudentVO stu);
	
	public int stuLogin(StudentVO stu);
	
	public int acaJoin(AcademyVO aca);
	
	public int checkId(String id);
	
	public int checkIdAca(String id);
	
	public int acaLogin(AcademyVO aca);
	
	public StudentVO stuInfo(String id);
}
