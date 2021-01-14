package com.campkok.admin.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.campkok.admin.board.model.service.AdminBoardService;
import com.campkok.admin.board.model.vo.AdminBoardInfoPageData;
import com.campkok.admin.board.model.vo.Board;

@Controller
public class AdminBoardController {
	@Autowired
	private AdminBoardService service;

	// ******************** Board ********************
	@RequestMapping("/selectBoardInfo.do")
	public String selectBoardInfo(int boardNo, Model model) {
		Board boardInfo = service.selectBoardInfo(boardNo);

		model.addAttribute("boardInfo", boardInfo);

		return "/admin/boardInfoView";
	}

	@RequestMapping("/selectBoardInfoList.do")
	public String selectBoardInfoList(int reqPage, Model model) {
		AdminBoardInfoPageData abipd = service.selectBoardInfoList(reqPage);

		model.addAttribute("boardInfoList", abipd.getList());
		model.addAttribute("pageNavi", abipd.getPageNavi());

		return "/admin/boardInfoList";
	}

	@RequestMapping("/searchBoardInfoList.do")
	public String searchBoardInfoList(int reqPage, String searchCategory, String search, Model model) {
		AdminBoardInfoPageData abipd = service.searchBoardInfoList(reqPage, searchCategory, search);

		model.addAttribute("boardInfoList", abipd.getList());
		model.addAttribute("pageNavi", abipd.getPageNavi());

		return "/admin/boardInfoList";
	}

	@RequestMapping("/deleteBoardInfo.do")
	public String deleteBoardInfo(int boardNo, Model model) {
		int result = service.deleteBoardInfo(boardNo);

		if (result > 0) {
			model.addAttribute("msg", "게시글 삭제 완료");
		} else {
			model.addAttribute("msg", "게시글 삭제 실패");
		}
		model.addAttribute("loc", "/selectBoardInfoList.do?reqPage=1");

		return "/common/msg";
	}

	// ******************** FAQ ********************
	@RequestMapping("/selectFAQInfoList.do")
	public String selectFAQInfoList(Model model) {

		return "/admin/faqInfoList";
	}
}
