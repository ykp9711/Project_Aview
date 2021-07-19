package com.Aview.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.Aview.domain.Criteria;
import com.Aview.domain.ReplyVO;
import com.Aview.mapper.ReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
@RestController //ajax쓸때 사용하는 어노테이션 // 일반 컨트롤러는 항상 .jsp로 이동된다.
@Controller
@Log4j
@RequestMapping("/replies/")
public class ReplyController {

	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	//댓글 등록
	@PostMapping(value="/new", consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE}) //consumes="전달 받는 타입" produces="요청한 곳으로 응답할 데이터의 타입"
	//@RequestBody = json으로 전달받은 데이터를 ReplyVO타입으로 변경
	//ResponseEntity<>는 ajax의 http상태코드와 결과값을 전달 할 수 있는 타입
	public ResponseEntity<String> register(@RequestBody ReplyVO reply) {
		log.info("ReplyVO : " + reply);
		
		int insertCount = mapper.insert(reply);
		
		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	//댓글 조회
	@GetMapping(value="/{rno}", produces= {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})//정수rno가 넘어오면 여기로 이동
	public ResponseEntity<ReplyVO> get(@PathVariable("rno") Long rno) {
		
		return new ResponseEntity<ReplyVO>(mapper.read(rno), HttpStatus.OK);
	}
	//게시글 전체 댓글 조회
	@GetMapping(value="/pages/{bno}/{page}", produces= {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
	public ResponseEntity<List<ReplyVO>> getTotal(@PathVariable("bno") Long bno, @PathVariable("page") int page){ //댓글 몇갠지 모르니깐 List<>에 ReplyVO를 담아준다
		Criteria cri = new Criteria(page,10);
		return new ResponseEntity<List<ReplyVO>>(mapper.getListWithPaging(cri,bno), HttpStatus.OK);
	}
	//댓글 수정
	//put : 자원의 전체 수정, 자원 내의 모든 필드 전달
	//patch : 자원의 일부만 수정
	@RequestMapping(method= {RequestMethod.PUT, RequestMethod.PATCH}, value="/{rno}", consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@RequestBody ReplyVO reply, @PathVariable("rno") Long rno){
		
		reply.setRno(rno); // 그냥 받아오면 rno에 null값이라 받아온 rno로 업데이트를 해준다
		
		int modifyCount = mapper.update(reply);
		
		return modifyCount == 1 ? new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<String>("error", HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//댓글 삭제
	//DeleteMapping
	@DeleteMapping(value="/{rno}", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable Long rno){
		log.info("remove : " + rno);
		
		return mapper.delete(rno) == 1 ? new ResponseEntity<String>("success", HttpStatus.OK) :
			new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	//조회 삭제 수정 모두다 rno를 받아오지만, Mapping 방법이 달라서 문제가 발생하지 않는다.
}
