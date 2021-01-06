package com.campkok.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.campkok.admin.model.service.AdminService;
import com.campkok.admin.model.vo.CeoNoticePageData;

@Controller
public class AdminController {
	@Autowired
	private AdminService service;

	@RequestMapping("/adminPage.do")
	public String adminPage(int reqPage, Model model) {
		CeoNoticePageData cnpd = service.selectCeoNoticeList(reqPage);

		model.addAttribute("ceoNoticeList", cnpd.getList());

		return "/admin/admin";
	}

	@RequestMapping("/selectCeoNoticeList")
	public String selectCeoNoticeList(int reqPage, Model model) {
		CeoNoticePageData cnpd = service.selectCeoNoticeList(reqPage);

		model.addAttribute("list", cnpd.getList());
		model.addAttribute("pageNavi", cnpd.getpageNavi());

		return "/admin/ceoNoticeList";
	}

}
