package com.Aview.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.Aview.domain.AcademyBoardReviewVO;
import com.Aview.domain.AcademyBoardVO;
import com.Aview.domain.AcademyFacilityVO;
import com.Aview.domain.AcademyTeacherVO;
import com.Aview.domain.AcademyTeacherVO1;
import com.Aview.domain.AcademyTeacherVO2;
import com.Aview.domain.AcademyTeacherVO3;
import com.Aview.domain.AcademyTeacherVO4;
import com.Aview.domain.AcademyTeacherVO5;
import com.Aview.domain.AcademyTeacherVO6;
import com.Aview.domain.AcademyTeacherVO7;
import com.Aview.domain.AcademyTeacherVO8;
import com.Aview.domain.Criteria;
import com.Aview.domain.PageDTO;
import com.Aview.domain.Upload;
import com.Aview.mapper.BoardMapper;

import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@RequestMapping("/board/*")
public class BoardController {
   //커밋 테스트2
   @Autowired
   Upload up;
   
   @Autowired
   BoardMapper mapper;
   
   
   
   @GetMapping("/academyDetailEdit")
   public String academyEditGo() {
      return "/WebContent/app/academy/academyDetailEdit";
   }

   
   @Transactional
   @PostMapping("/register")
   public String BoardRegister(MultipartFile[] file, @ModelAttribute AcademyBoardVO av,AcademyFacilityVO fv ,HttpServletResponse resp, HttpSession session ,  HttpServletRequest req, MultipartFile[] acaPhoto,
         AcademyTeacherVO1 tv1,AcademyTeacherVO2 tv2, AcademyTeacherVO3 tv3 , AcademyTeacherVO4 tv4, AcademyTeacherVO5 tv5,
         AcademyTeacherVO6 tv6, AcademyTeacherVO7 tv7 , AcademyTeacherVO8 tv8
         ,MultipartFile teacherPhoto1[], MultipartFile teacherPhoto2[], MultipartFile teacherPhoto3[], MultipartFile teacherPhoto4[] , MultipartFile teacherPhoto5[],
         MultipartFile teacherPhoto6[], MultipartFile teacherPhoto7[], MultipartFile teacherPhoto8[]) throws Exception{
      
      int ano = mapper.getBoardSeq(); // 게시판 ano를 가져옴
      AcademyTeacherVO vo = new AcademyTeacherVO();
      av.setAno(ano); // 학원소개 ano 
      fv.setAno(ano); // 학원시설 ano
      vo.setAno(ano); // 강사사진 ano
      fv.setPhoto("noPhoto.jpg"); // 시설 사진 초기네임
      av.setAcademyPhoto("noThumbnail.jpg"); // 학원 썸네일 이미지 초기네임
       
      // -------------   학원 썸네일 사진 업로드 ----------//
      if(file[0].getSize() != 0) {
      ArrayList<String> fileName = new ArrayList<>(); // 파일 이름들을 받을 리스트 생성
      fileName=(ArrayList<String>) up.FileUpload(file); // 받아온 파일 이름들을 리스트에 저장
      for(int i=0; i<fileName.size(); i++) { // 리스트 크기만큼 반복
         av.setAcademyPhoto(fileName.get(i)); // 파일들을 DB에 저장
      }
      }

     // ---------------------------------------------- //
      av.setAcademyId((String)session.getAttribute("session_id"));
      av.setAcademyIntro("임시값"); // intro는 후에 사용하게되면 이 부분 지우고 사용
      av.setAcademyMapPhoto("임시값"); // 이후에 삭제
      av.setAcademyContent(av.getAcademyContent().replace("\r\n","<br>"));
      
      resp.setCharacterEncoding("UTF-8");
      log.info(av);
      if(mapper.register(av)==1) {

     //------------------------ 학원 강사 업로드    
         log.info(tv1);
         if(!tv1.getName1().equals("")) { // 1번 강사
            List<String> photo = new ArrayList<>(); // 사진 Upload메소드를 통해 나오는 파일이름을 담기위한 리스트
           vo.setName(tv1.getName1()); // 1번강사 정보들을 AcademyTeacherVO에 담아준다
           vo.setGender(tv1.getGender1());
           vo.setIntro(tv1.getIntro1());
           if(teacherPhoto1[0].getSize() !=0) { // 파일첨부를 했다면 첫번째 index가 0이 아님으로 파일을 첨부한 것 이다.
           photo = (ArrayList<String>) up.FileUpload(teacherPhoto1);
           vo.setPhoto(photo.get(0));
           }else {
              vo.setPhoto("noTeacher.jpg"); // 파일을 첨부하지 않았으면 notTeacher.jpg 문자열 저장
           }
           mapper.academyTeacher(vo); // vo객체를 db에 저장해준다
        }
         if(!tv2.getName2().equals("")) { // 2번 강사
            List<String> photo = new ArrayList<>();
           vo.setName(tv2.getName2());
           vo.setGender(tv2.getGender2());
           vo.setIntro(tv2.getIntro2());
           if(teacherPhoto2[0].getSize() !=0) {
           photo = (ArrayList<String>) up.FileUpload(teacherPhoto2);
           vo.setPhoto(photo.get(0));
           }else {
              vo.setPhoto("noTeacher.jpg");
           }
           mapper.academyTeacher(vo);
        }
         
         if(!tv3.getName3().equals("")) { // 3번 강사
            List<String> photo = new ArrayList<>();
           vo.setName(tv3.getName3());
           vo.setGender(tv3.getGender3());
           vo.setIntro(tv3.getIntro3());
           if(teacherPhoto3[0].getSize() !=0) {
           photo = (ArrayList<String>) up.FileUpload(teacherPhoto3);
           vo.setPhoto(photo.get(0));
           }else {
              vo.setPhoto("noTeacher.jpg");
           }
           mapper.academyTeacher(vo);
        }
         
         if(!tv4.getName4().equals("")) { // 4번 강사
            List<String> photo = new ArrayList<>();
           vo.setName(tv4.getName4());
           vo.setGender(tv4.getGender4());
           vo.setIntro(tv4.getIntro4());
           if(teacherPhoto4[0].getSize() !=0) {
           photo = (ArrayList<String>) up.FileUpload(teacherPhoto4);
           vo.setPhoto(photo.get(0));
           }else {
              vo.setPhoto("noTeacher.jpg");
           }
           mapper.academyTeacher(vo);
        }
         
         if(!tv5.getName5().equals("")) { // 5번 강사
            List<String> photo = new ArrayList<>();
           vo.setName(tv5.getName5());
           vo.setGender(tv5.getGender5());
           vo.setIntro(tv5.getIntro5());
           if(teacherPhoto5[0].getSize() !=0) {
           photo = (ArrayList<String>) up.FileUpload(teacherPhoto5);
           vo.setPhoto(photo.get(0));
           }else {
              vo.setPhoto("noTeacher.jpg");
           }
           mapper.academyTeacher(vo);
        }
           
         if(!tv6.getName6().equals("")) { // 6번 강사
            List<String> photo = new ArrayList<>();
           vo.setName(tv6.getName6());
           vo.setGender(tv6.getGender6());
           vo.setIntro(tv6.getIntro6());
           if(teacherPhoto6[0].getSize() !=0) {
           photo = (ArrayList<String>) up.FileUpload(teacherPhoto6);
           vo.setPhoto(photo.get(0));
           }else {
              vo.setPhoto("noTeacher.jpg");
           }
           mapper.academyTeacher(vo);
        }
         
         if(!tv7.getName7().equals("")) { // 7번 강사
            List<String> photo = new ArrayList<>();
           vo.setName(tv7.getName7());
           vo.setGender(tv7.getGender7());
           vo.setIntro(tv7.getIntro7());
           if(teacherPhoto7[0].getSize() !=0) {
           photo = (ArrayList<String>) up.FileUpload(teacherPhoto7);
           vo.setPhoto(photo.get(0));
           }else {
              vo.setPhoto("noTeacher.jpg");
           }
           mapper.academyTeacher(vo);
        }
         
         if(!tv8.getName8().equals("")) { // 8번 강사
            List<String> photo = new ArrayList<>();
           vo.setName(tv8.getName8());
           vo.setGender(tv8.getGender8());
           vo.setIntro(tv8.getIntro8());
           if(teacherPhoto8[0].getSize() !=0) {
           photo = (ArrayList<String>) up.FileUpload(teacherPhoto8);
           vo.setPhoto(photo.get(0));
           }else {
              vo.setPhoto("noTeacher.jpg");
           }
           mapper.academyTeacher(vo);
        }
         
         //--------------- 학원 시설사진 업로드 ----------------// 시설의 ano가 게시글 ano를 참조하기때문에 게시글이 생성된 후 시설 사진을 업로드 해줘야 에러가 안뜬다.
         if(acaPhoto[0].getSize() != 0) {

            ArrayList<String> fileName2 = new ArrayList<>(); // 파일 이름들을 받을 리스트 생성
            
            fileName2=(ArrayList<String>) up.FileUpload(acaPhoto); // 받아온 파일 이름들을 리스트에 저장
            log.info(fileName2);
            for(int i=0; i<fileName2.size(); i++) { // 리스트 크기만큼 반복
               fv.setPhoto(fileName2.get(i));
              mapper.academyPhoto(fv); // 파일들을 DB에 저장
            }
      }else {
         mapper.academyPhoto(fv);
      }
       //---------------------------------------------------//  
         
         
         PrintWriter out = resp.getWriter();
         resp.setContentType("text/html;charset=utf-8");
         out.println("<script>");
         out.println("alert('글 등록이 완료되었습니다..')");
          out.println("location.href='/board/academyBoard'");
          out.println("</script>");
          return null;
      }else {
          PrintWriter out = resp.getWriter();
          resp.setContentType("text/html;charset=utf-8");
          out.println("<script>");
          out.println("alert('다시 입력해 주세요')");
          out.println("location.href='/board/academyDetailEdit'");
          out.println("</script>");
          return null;
      }
   }

   
   // 내 정보
@GetMapping("/academyBoard") 
   public String serviceGo(Model mo, Criteria cri, HttpSession session) throws Exception{
      String id="";
      id = (String)session.getAttribute("session_id");
      
      try {
       if(id.trim() != null || id.trim()!="" || !id.trim().equals("")) { }
      if(mapper.acaId(id) == 1) {

         mo.addAttribute("acaid", "acaOk");
      } // try문에서 id값이 null이라 NullPointerException 발생 시 catch로 이동 , id값에 session_id값이 들어가 있어서 에러가 안뜨면 try문 실행 후 
        // finally로 이동해서 계속 진행
      }catch (NullPointerException e) {
         mo.addAttribute("list", mapper.getList(cri));
         mo.addAttribute("pageMaker", new PageDTO(cri, mapper.getTotal(cri)));
         mo.addAttribute("total", mapper.getTotal(cri));
         return "/WebContent/app/academy/academyBoard";
   }finally {
      mo.addAttribute("list", mapper.getList(cri));
      mo.addAttribute("pageMaker", new PageDTO(cri, mapper.getTotal(cri)));
      mo.addAttribute("total", mapper.getTotal(cri));
      return "/WebContent/app/academy/academyBoard";
   }
   }
   //게시판 상세보기
   @GetMapping("/getBoard")
   public String getBoard(@Param("ano") int ano, Model mo) {
	   
	  mo.addAttribute("review", mapper.getReview(ano));
      AcademyBoardVO vo = mapper.getAcademy(ano);
      
      mo.addAttribute("review", mapper.getReview(ano));
      mo.addAttribute("ano", ano);
      
         if(vo.getAcademyYoutube().length() >=32) {
            String youtube = vo.getAcademyYoutube().substring(32);
            String realYoutube = "https://www.youtube.com/embed/"+youtube;
      vo.setAcademyYoutube(realYoutube);
         }
       
         mo.addAttribute("board", vo);
      return "/WebContent/app/academy/getAcademy";
}
   
   //시설 상세보기
   @GetMapping("/getFacility")
   public String getFacility(@Param("ano") int ano, Model mo) {
      mo.addAttribute("board", mapper.getFacility(ano));
      return "/WebContent/app/academy/getFacility";
   }
   //리뷰 작성하기
   
   @PostMapping("/insertReview") 
   public String insertReivew(AcademyBoardReviewVO ar, HttpServletRequest req, HttpServletResponse resp) throws Exception {
   log.info(ar);
   mapper.insertReview(ar);
   String referer = req.getHeader("Referer"); // 헤더에서 이전 페이지를 읽는다.
   return "redirect:"+ referer; // 이전 페이지로 리다이렉트
   }
   
   
   //강사 상세보기
   @GetMapping("/Teacher")
   public String getTeacher(@Param("ano") int ano , Model mo) {
      mo.addAttribute("teacher", mapper.getAcademyTeacher(ano));
      return "/WebContent/app/academy/getTeacher";
   }
   
   //게시판 수정 이동
   @GetMapping("/modifyBoard")
   public String modify(@Param("ano") int ano, Model mo) {
      mo.addAttribute("board", mapper.getAcademy(ano));
      mo.addAttribute("teacher", mapper.getAcademyTeacher(ano));
      mo.addAttribute("teacherCount", mapper.getTeacherCount(ano));
      return "/WebContent/app/academy/modifyAcademy";
   }
   @PostMapping("/modifyBoard")
   public String modifyBoard(AcademyBoardVO vo, HttpServletResponse resp) throws Exception{
        log.info(vo);
        vo.setAcademyIntro("임시값");
     mapper.modifyBoard(vo);
     resp.setCharacterEncoding("UTF-8");
     PrintWriter out = resp.getWriter();
      resp.setContentType("text/html;charset=utf-8");
      out.println("<script>");
      out.println("alert('글 수정이 완료되었습니다..')");
       out.println("</script>");
       return "redirect:/board/getBoard?ano="+vo.getAno();
   }
   
   @GetMapping("/removeBoard")
   public String removeBoard(@Param("ano") int ano, HttpServletResponse resp) throws Exception{
      mapper.removeBoard(ano);

      return "redirect:/board/academyBoard";
      
   }
   
//  게시글 수정
   @PostMapping("/modifyIntro")
   public String test(AcademyBoardVO av, MultipartFile file[], AcademyTeacherVO1 tv1,AcademyTeacherVO2 tv2, AcademyTeacherVO3 tv3 , AcademyTeacherVO4 tv4, AcademyTeacherVO5 tv5,
         AcademyTeacherVO6 tv6, AcademyTeacherVO7 tv7 , AcademyTeacherVO8 tv8
         ,MultipartFile teacherPhoto1[], MultipartFile teacherPhoto2[], MultipartFile teacherPhoto3[], MultipartFile teacherPhoto4[] , MultipartFile teacherPhoto5[],
         MultipartFile teacherPhoto6[], MultipartFile teacherPhoto7[], MultipartFile teacherPhoto8[]) throws IOException {
      // 학원소개 수정
      int ano = av.getAno();
      if(file[0].getSize() == 0) {
         av.setAcademyPhoto(mapper.getAcaPhotoName(av.getAno()));
      }else {
         List<String> fileName = new ArrayList<>();
         fileName = up.FileUpload(file);
         for(int i =0; i<fileName.size(); i++) {
            av.setAcademyPhoto(fileName.get(i));
         }
      }
      mapper.modifyBoard(av);
      //
      
      //학원강사 수정

      AcademyTeacherVO vo = new AcademyTeacherVO();
      vo.setAno(ano);
      mapper.deleteTeacher(ano); 
      // 기존에 등록된 강사 삭제
      if(!tv1.getName1().equals("")) { // 1번 강사
         List<String> photo = new ArrayList<>(); // 사진 Upload메소드를 통해 나오는 파일이름을 담기위한 리스트
           vo.setName(tv1.getName1()); // 1번강사 정보들을 AcademyTeacherVO에 담아준다
           vo.setGender(tv1.getGender1());
           vo.setIntro(tv1.getIntro1());
           if(teacherPhoto1[0].getSize() !=0) { // 파일첨부를 했다면 첫번째 index가 0이 아님으로 파일을 첨부한 것 이다.
           photo = (ArrayList<String>) up.FileUpload(teacherPhoto1);
           vo.setPhoto(photo.get(0));
           }else {
              vo.setPhoto("noTeacher.jpg"); // 파일을 첨부하지 않았으면 notTeacher.jpg 문자열 저장
           }
           log.info(vo);
           mapper.academyTeacher(vo); // vo객체를 db에 저장해준다
      }
      if(!tv2.getName2().equals("")) { // 2번 강사
         List<String> photo = new ArrayList<>();
           vo.setName(tv2.getName2());
           vo.setGender(tv2.getGender2());
           vo.setIntro(tv2.getIntro2());
           if(teacherPhoto2[0].getSize() !=0) {
           photo = (ArrayList<String>) up.FileUpload(teacherPhoto2);
           vo.setPhoto(photo.get(0));
           }else {
              vo.setPhoto("noTeacher.jpg");
           }
           mapper.academyTeacher(vo);
        }

      if(!tv3.getName3().equals("")) { // 3번 강사
         List<String> photo = new ArrayList<>();
           vo.setName(tv3.getName3());
           vo.setGender(tv3.getGender3());
           vo.setIntro(tv3.getIntro3());
           if(teacherPhoto3[0].getSize() !=0) {
           photo = (ArrayList<String>) up.FileUpload(teacherPhoto3);
           vo.setPhoto(photo.get(0));
           }else {
              vo.setPhoto("noTeacher.jpg");
           }
           mapper.academyTeacher(vo);
        }

      if(!tv4.getName4().equals("")) { // 4번 강사
         log.info("들어옴");
         List<String> photo = new ArrayList<>();
           vo.setName(tv4.getName4());
           vo.setGender(tv4.getGender4());
           vo.setIntro(tv4.getIntro4());
           if(teacherPhoto4[0].getSize() !=0) {
           photo = (ArrayList<String>) up.FileUpload(teacherPhoto4);
           vo.setPhoto(photo.get(0));
           }else {
              vo.setPhoto("noTeacher.jpg");
           }
           mapper.academyTeacher(vo);
        }

     if(!tv5.getName5().equals("")) { // 5번 강사
        List<String> photo = new ArrayList<>();
        vo.setName(tv5.getName5());
        vo.setGender(tv5.getGender5());
        vo.setIntro(tv5.getIntro5());
        if(teacherPhoto5[0].getSize() !=0) {
        photo = (ArrayList<String>) up.FileUpload(teacherPhoto5);
        vo.setPhoto(photo.get(0));
        }else {
           vo.setPhoto("noTeacher.jpg");
        }
        mapper.academyTeacher(vo);
     }

     if(!tv6.getName6().equals("")) { // 6번 강사
        List<String> photo = new ArrayList<>();
        vo.setName(tv6.getName6());
        vo.setGender(tv6.getGender6());
        vo.setIntro(tv6.getIntro6());
        if(teacherPhoto6[0].getSize() !=0) {
        photo = (ArrayList<String>) up.FileUpload(teacherPhoto6);
        vo.setPhoto(photo.get(0));
        }else {
           vo.setPhoto("noTeacher.jpg");
        }
        mapper.academyTeacher(vo);
     }

     if(!tv7.getName7().equals("")) { // 7번 강사
        List<String> photo = new ArrayList<>();
        vo.setName(tv7.getName7());
        vo.setGender(tv7.getGender7());
        vo.setIntro(tv7.getIntro7());
        if(teacherPhoto7[0].getSize() !=0) {
        photo = (ArrayList<String>) up.FileUpload(teacherPhoto7);
        vo.setPhoto(photo.get(0));
        }else {
           vo.setPhoto("noTeacher.jpg");
        }
        mapper.academyTeacher(vo);
     }

     if(!tv8.getName8().equals("")) { // 8번 강사
        List<String> photo = new ArrayList<>();
        vo.setName(tv8.getName8());
        vo.setGender(tv8.getGender8());
        vo.setIntro(tv8.getIntro8());
        if(teacherPhoto8[0].getSize() !=0) {
        photo = (ArrayList<String>) up.FileUpload(teacherPhoto8);
        vo.setPhoto(photo.get(0));
        }else {
           vo.setPhoto("noTeacher.jpg");
        }
        mapper.academyTeacher(vo);
     }

      return "redirect:/board/academyBoard";
   }
       
   
}