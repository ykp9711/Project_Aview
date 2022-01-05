package com.Aview.mapper;


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
	
	public AcademyVO acaInfo(String id);
	
	public int stuAcademyCheck(String id);
	
	public int acaAcademyCheck(String id);
	
	public Integer checkSessionIdStudent(String id);
	
	public int stuUpdate(StudentVO stu);
	
	public int acaUpdate(AcademyVO aca);
	
	public int acaAcademyCheck2(String aid);
	
	public int acafindId(AcademyVO aca);
	
	public int stufindId(StudentVO stu);
	
	public AcademyVO getResult(String aname);
	
	public StudentVO getResultstu(String semail);
	//비번찾기
	public StudentVO getPw(String number);
	
	public AcademyVO getPwAca(String number);
	
	public void acaLeave(String aid); //학원 회원탈퇴
	
	public void userLeave(String sid); //학원 회원탈퇴
	
}