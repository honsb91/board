package com.board.model;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	
	// 게시판 번호
	private int bno;
	
	// 게시판 제목
	private String title;
	
	// 게시판 내용
	private String content;
	
	// 게시판 작성자
	private String writer;
	
	// 게시판 등록일, 수정일
	private Date regdate, updatedate;

}
