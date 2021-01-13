package com.campkok.admin.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.campkok.admin.board.model.service.AdminBoardService;

@Controller
public class AdminBoardController {
	@Autowired
	private AdminBoardService service;
	
	@RequestMapping("/selectFAQInfoList.do")
	public String selectFAQInfoList(Model model) {
		
		return "/admin/faqInfoList";
	}
}
