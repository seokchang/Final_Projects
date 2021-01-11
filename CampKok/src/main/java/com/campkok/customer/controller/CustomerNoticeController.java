package com.campkok.customer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.campkok.admin.notice.model.service.AdminNoticeService;
import com.campkok.admin.notice.model.vo.ClientNotice;
import com.campkok.admin.notice.model.vo.ClientNoticePageData;
import com.campkok.admin.user.model.service.AdminUserService;
import com.campkok.customer.model.service.CustomerNoticeService;
import com.campkok.customer.model.service.CustomerService;

@Controller
public class CustomerNoticeController {
	@Autowired
	private CustomerNoticeService service;
	
	@Autowired
	private AdminNoticeService nService;
	@Autowired
	private AdminUserService uService;
	

	@RequestMapping("/customerNoticeList")
	public String selectCustomerNoticeList(int reqPage, Model model) {
		ClientNoticePageData cnpd = service.selectClientNoticeList(reqPage);
		
		model.addAttribute("list", cnpd.getList());
		model.addAttribute("pageNavi", cnpd.getPageNavi());

		return "customer/notice/noticeList";
	}
	
	@RequestMapping("/selectCustomerNotice.do")
	public String selectClientNotice(int clientNoticeNo, Model model) {
		ClientNotice clientNotice = nService.selectClientNotice(clientNoticeNo);

		model.addAttribute("clientNotice", clientNotice);

		return "customer/notice/noticeView";
	}
}
