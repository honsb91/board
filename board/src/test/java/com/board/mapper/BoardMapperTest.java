package com.board.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.board.model.BoardVO;
import com.board.model.Criteria;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardMapperTest {
	
	private static final Logger log = LoggerFactory.getLogger(BoardMapperTest.class);
	
	@Autowired
	private BoardMapper mapper; // BoardMapper.java를 의존성으로 선언
	
	// 게시판 등록 Test
//	@Test
//	public void registr() {
//		
//		BoardVO vo = new BoardVO();
//		
//		vo.setTitle("Mapper Test");
//		vo.setContent("Mapper Test중입니다.");
//		vo.setWriter("Mapper");
//		
//		mapper.registr(vo);
//	}
	
	// 게시판 목록 Test
//	@Test
//	public void list() {
//		List list = mapper.list();
//		
//		for(int i=0; i<list.size(); i++) {
//			log.info("" + list.get(i));
//		}
//	}
	
	// 게시판 조회 Test
//	@Test
//	public void getpage() {
//		// 실제 존재하는 페이지
//		int bno = 31;
//		log.info("" + mapper.getpage(bno));
//	}
	
	// 게시판 수정 Test
//	@Test
//	public void update() {
//		BoardVO vo = new BoardVO();
//		
//		vo.setBno(333);
//		vo.setTitle("Mapper Test");
//		vo.setContent("Mapper수정중");
//		
//		int result = mapper.update(vo);
//		log.info("result : " + result);
//	}
	
	// 게시판 삭제 Test
//	@Test
//	public void delete() {
//		int result = mapper.delete(244);
//		log.info("result : " + result);
//	}
	
	// 게시판 목록(페이징 적용) Test
//	@Test
//	public void getlistpaging() {
//		
//		Criteria cri = new Criteria();
//		
//		cri.setPageNum(2);
//		
//		List list = mapper.getlistPaging(cri);
//		
//		list.forEach(board -> log.info("" + board));
//	}
	
	// 게시판 총 갯수 Test
//	@Test
//	public void getTotal() {
//		
//		
//		int total = mapper.getTotal();
//		log.info("total : " + total);
//	}

}
