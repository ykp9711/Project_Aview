package com.Aview.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.Aview.domain.StudentVO;
import com.Aview.mapper.MemberMapper;

public interface MemberService {
	
	public int stuJoin(StudentVO stu);
}
