package com.board.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.model.BoardVO;
import com.board.model.Criteria;
import com.board.model.PageMakeDTO;
import com.board.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	private static final Logger log = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService service;
	

	// 게시판 목록페이지(페이징 적용)
    @GetMapping("/list")
    public void boardListGET(Model model, Criteria cri) {
        
        log.info("게시판 목록 페이지 진입");
        
        model.addAttribute("list", service.getlistPaging(cri));
        
        int total = service.getTotal(cri);
        
        PageMakeDTO pageMake = new PageMakeDTO(cri, total);
        
        model.addAttribute("pageMake", pageMake);
        
    }
    
    // 게시판 등록페이지
    @GetMapping("/registr")
    public void boardRegistrGET() {
        
        log.info("게시판 등록 페이지 진입");
        
    }
    
    // 게시판 등록
    @PostMapping("/registr")
    public String boardRegistrPOST(BoardVO board, RedirectAttributes rttr) {
    	
    	log.info("BoardVO : " + board);
    	
    	service.registr(board);
    	
    	rttr.addFlashAttribute("result", "registr success");
    	
    	return "redirect:/board/list";
    }
    
    // 게시판 조회
    @GetMapping("/get")
    public void boardGetPage(int bno, Model model,Criteria cri) {
    	model.addAttribute("pageInfo", service.getpage(bno));
    	model.addAttribute("cri", cri);
    }
	
    // 수정페이지 이동
    @GetMapping("/update")
    public void boardUpdateGET(int bno, Model model, Criteria cri) {
    	model.addAttribute("pageInfo", service.getpage(bno));
    	model.addAttribute("cri", cri);
    }
    
    // 페이지 수정
    @PostMapping("/update")
    public String boardUpdatePOST(BoardVO board, RedirectAttributes rttr) {
    	
    	service.update(board);
    	rttr.addFlashAttribute("result", "update success");
    	return "redirect:/board/list";
    }
    
    // 페이지 삭제
	@PostMapping("/delete")
	public String boardDeletePOST(int bno,RedirectAttributes rttr) {
		service.delete(bno);
		rttr.addFlashAttribute("result", "delete success");
		return "redirect:/board/list";
	}
}
