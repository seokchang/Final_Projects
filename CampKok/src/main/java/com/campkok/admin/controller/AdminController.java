package com.campkok.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.campkok.admin.model.service.AdminService;
import com.campkok.admin.model.vo.CeoNotice;
import com.campkok.admin.model.vo.CeoNoticePageData;
import com.campkok.admin.model.vo.ClientNotice;
import com.campkok.admin.model.vo.ClientNoticePageData;
import com.campkok.admin.model.vo.Notice;

@Controller
public class AdminController {
	@Autowired
	private AdminService service;

	@RequestMapping("/pageAdmin.do")
	public String pageAdmin(int reqPage, Model model) {
		CeoNoticePageData ceoNPD = service.selectCeoNoticeList(reqPage);
		ClientNoticePageData clientNPD = service.selectClientNoticeList(reqPage);

		model.addAttribute("ceoNoticeList", ceoNPD.getList());
		model.addAttribute("clientNoticeList", clientNPD.getList());

		return "/admin/admin";
	}

	@RequestMapping("/pageNoticeForm.do")
	public String pageNoticeForm() {

		return "/admin/noticeForm";
	}

	@RequestMapping("/insertNotice.do")
	public String insertNotice(Notice notice, Model model) {
		int result = service.insertNotice(notice);

		if (result > 0) {
			model.addAttribute("msg", "공지사항 등록 성공");
		} else {
			model.addAttribute("msg", "공지사항 등록 실패");
		}
		model.addAttribute("loc", "/adminPage.do?reqPage=1");

		return "/commons/msg";
	}

	@RequestMapping("/selectCeoNotice.do")
	public String selectCeoNotice(int ceoNoticeNo, Model model) {
		CeoNotice ceoNotice = service.selectCeoNotice(ceoNoticeNo);

		model.addAttribute("ceoNotice", ceoNotice);

		return "/admin/ceoNoticeView";
	}

	@RequestMapping("/selectCeoNoticeList.do")
	public String selectCeoNoticeList(int reqPage, Model model) {
		CeoNoticePageData cnpd = service.selectCeoNoticeList(reqPage);

		model.addAttribute("list", cnpd.getList());
		model.addAttribute("pageNavi", cnpd.getpageNavi());

		return "/admin/ceoNoticeList";
	}

	@RequestMapping("/deleteCeoNotice.do")
	public String deleteCeoNotice(int ceoNoticeNo, Model model) {
		int result = service.deleteCeoNotice(ceoNoticeNo);

		if (result > 0) {
			model.addAttribute("msg", "공지사항 삭제 성공");
		} else {
			model.addAttribute("msg", "공지사항 삭제 실패");
		}
		model.addAttribute("loc", "/selectCeoNoticeList.do?reqPage=1");

		return "/commons/msg";
	}

	@RequestMapping("/selectClientNotice.do")
	public String selectClientNotice(int clientNoticeNo, Model model) {
		ClientNotice clientNotice = service.selectClientNotice(clientNoticeNo);

		model.addAttribute("clientNotice", clientNotice);

		return "/admin/clientNoticeView";
	}

	@RequestMapping("/selectClientNoticeList.do")
	public String selectClientNoticeList(int reqPage, Model model) {
		ClientNoticePageData cnpd = service.selectClientNoticeList(reqPage);

		model.addAttribute("list", cnpd.getList());
		model.addAttribute("pageNavi", cnpd.getPageNavi());

		return "/admin/clientNoticeList";
	}

	@RequestMapping("/deleteClientNotice.do")
	public String deleteClientNotice(int clientNoticeNo, Model model) {
		int result = service.deleteClientNotice(clientNoticeNo);

		if (result > 0) {
			model.addAttribute("msg", "공지사항 삭제 성공");
		} else {
			model.addAttribute("msg", "공지사항 삭제 실패");
		}
		model.addAttribute("loc", "/selectClientNoticeList.do?reqPage=1");

		return "/commons/msg";
	}

}
