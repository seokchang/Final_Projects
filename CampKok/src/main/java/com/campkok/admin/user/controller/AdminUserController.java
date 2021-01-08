package com.campkok.admin.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.campkok.admin.user.model.service.AdminUserService;
import com.campkok.admin.user.model.vo.AdminUserInfoPageData;

@Controller
public class AdminUserController {
	@Autowired
	private AdminUserService service;
	
	@RequestMapping("selectClientInfo.do")
	public String selectClientInfo(int userNo, Model model) {
		
		
		return "/admin/clientInfo";
	}

	// ********** Client Info **********
	@RequestMapping("/selectClientInfoList.do")
	public String selectClientInfoList(int reqPage, Model model) {
		AdminUserInfoPageData auipd = service.selectClientInfoList(reqPage);

		model.addAttribute("list", auipd.getList());
		model.addAttribute("pageNavi", auipd.getPageNavi());

		return "/admin/clientInfoList";
	}

	// ********** CEO Info **********
	@RequestMapping("/selectCeoInfoList.do")
	public String selectCeoInfoList(int reqPage, Model model) {
		AdminUserInfoPageData auipd = service.selectCeoInfoList(reqPage);

		model.addAttribute("list", auipd.getList());
		model.addAttribute("pageNavi", auipd.getPageNavi());

		return "/admin/ceoInfoList";
	}
}
