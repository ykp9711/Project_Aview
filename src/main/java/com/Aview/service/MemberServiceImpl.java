package com.Aview.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Aview.domain.AcademyVO;
import com.Aview.domain.StudentVO;
import com.Aview.mapper.MemberMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberMapper mapper;
	@Override
	public int stuJoin(StudentVO stu) {
		return mapper.stuJoin(stu);
	}
	
	public int stuLogin(StudentVO stu) {
		return mapper.stuLogin(stu);
	}
	
	public int acaJoin(AcademyVO aca) {
		return mapper.acaJoin(aca);
	}
	
	public int checkId(String id) {
		return mapper.checkId(id);
	}

	public int checkIdAca(String id) {
		return mapper.checkIdAca(id);
	}
	public int acaLogin(AcademyVO aca) {
		return mapper.acaLogin(aca);
	}
}
