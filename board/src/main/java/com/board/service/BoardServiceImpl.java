package com.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.mapper.BoardMapper;
import com.board.model.BoardVO;
import com.board.model.Criteria;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardMapper mapper; // mapper를 의존성주입
	
	// 게시판 등록
	@Override
	public void registr(BoardVO board) {
		mapper.registr(board);
	}

	// 게시판 목록
	@Override
	public List<BoardVO> list() {
		return mapper.list();
	}

	// 게시판 조회
	@Override
	public BoardVO getpage(int bno) {
		return mapper.getpage(bno);
	}

	// 게시판 수정
	@Override
	public int update(BoardVO board) {
		return mapper.update(board);
	}

	// 게시판 삭제
	@Override
	public int delete(int bno) {
		return mapper.delete(bno);
	}

	// 게시판 목록(페이징 적용)
	@Override
	public List<BoardVO> getlistPaging(Criteria cri) {
		return mapper.getlistPaging(cri);
	}

	// 게시판 총 갯수
	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotal(cri);
	}

}
