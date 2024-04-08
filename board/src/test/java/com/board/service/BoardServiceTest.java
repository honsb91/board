package com.board.service;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.board.mapper.BoardMapperTest;
import com.board.model.BoardVO;
import com.board.model.Criteria;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardServiceTest {
	
	private static final Logger log = LoggerFactory.getLogger(BoardServiceTest.class);
	
	@Autowired
	private BoardService service;
	
	// 게시판 등록 Test
//	@Test
//	public void registr() {
//		
//		BoardVO vo = new BoardVO();
//		
//		vo.setTitle("Service Test");
//		vo.setContent("Service Test 중입니다.");
//		vo.setWriter("service");
//		
//		service.registr(vo);
//	}
	
	// 게시판 목록 Test
//	@Test
//	public void list() {
//		
//		List list = service.list();
//		
//		for(int i=0; i<list.size(); i++) {
//			log.info("" + list.get(i));
//		}
//	}
	
	// 게시판 조회 Test
//	@Test
//	public void getpage() {
//		int bno = 31;
//		log.info("" + service.getpage(bno));
//	}
	
	// 게시판 수정 Test
//	@Test
//	public void update() {
//		BoardVO vo = new BoardVO();
//		vo.setBno(133);
//		vo.setTitle("Service Test");
//		vo.setContent("Service 내용수정");
//		
//		int result = service.update(vo);
//		log.info("result : " + result);
//	}
	
	// 게시판 삭제 Test
//	@Test
//	public void delete() {
//		int result = service.delete(233);
//		log.info("result : " + result);
//	}
	
	// 게시판 목록(페이징 적용) Test
//	@Test
//	public void getlistpaging() {
//		
//		Criteria cri = new Criteria();
//		
//		cri.setPageNum(3);
//		
//		List list = service.getlistPaging(cri);
//		
//		list.forEach(board -> log.info("" + board));
//		
//	}
	
	// 게시판 총 갯수 Test
//	@Test
//	public void getTotal() {
//		
//		int total = service.getTotal();
//		log.info("total : " + total);
//	}

}
