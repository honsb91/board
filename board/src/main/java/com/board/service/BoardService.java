package com.board.service;

import java.util.List;

import com.board.model.BoardVO;
import com.board.model.Criteria;

public interface BoardService {
	
	// 게시판 등록
	public void registr(BoardVO board);
	
	// 게시판 목록
	public List<BoardVO> list();
	
	// 게시판 목록(페이징 적용)
	public List<BoardVO> getlistPaging(Criteria cri);
	
	// 게시판 조회
	public BoardVO getpage(int bno);
	
	// 게시판 수정
	public int update(BoardVO board);
	
	// 게시판 삭제
	public int delete(int bno);
	
	// 게시판 총 갯수
	public int getTotal(Criteria cri);

}
