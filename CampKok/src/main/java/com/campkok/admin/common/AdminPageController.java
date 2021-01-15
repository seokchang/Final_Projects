package com.campkok.admin.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.campkok.admin.board.model.service.AdminBoardService;
import com.campkok.admin.board.model.vo.AdminBoardInfoPageData;
import com.campkok.admin.camp.model.service.AdminCampService;
import com.campkok.admin.camp.model.vo.AdminCampInfoPageData;
import com.campkok.admin.notice.model.service.AdminNoticeService;
import com.campkok.admin.notice.model.vo.CeoNoticePageData;
import com.campkok.admin.notice.model.vo.ClientNoticePageData;
import com.campkok.admin.user.model.service.AdminUserService;
import com.campkok.admin.user.model.vo.AdminUserInfoPageData;

@Controller
public class AdminPageController {
	@Autowired
	private AdminNoticeService nService;
	@Autowired
	private AdminUserService uService;
	@Autowired
	private AdminCampService cService;
	@Autowired
	private AdminBoardService bService;

	/* **************************************************
	 * Admin Page
	 * **************************************************
	*/
	@RequestMapping("/pageAdmin.do")
	public String pageAdmin(int reqPage, Model model) {
		CeoNoticePageData ceoNPD = nService.selectCeoNoticeList(reqPage);
		ClientNoticePageData clientNPD = nService.selectClientNoticeList(reqPage);
		AdminUserInfoPageData clientInfoList = uService.selectClientInfoList(reqPage);
		AdminUserInfoPageData ceoInfoList = uService.selectCeoInfoList(reqPage);
		AdminCampInfoPageData campInfoList = cService.selectCampInfoList(reqPage);
		AdminBoardInfoPageData boardInfoList = bService.selectBoardInfoList(reqPage);

		model.addAttribute("ceoNoticeList", ceoNPD.getList());
		model.addAttribute("clientNoticeList", clientNPD.getList());
		model.addAttribute("clientInfoList", clientInfoList.getList());
		model.addAttribute("ceoInfoList", ceoInfoList.getList());
		model.addAttribute("campInfoList", campInfoList.getList());
		model.addAttribute("boardInfoList", boardInfoList.getList());

		return "/admin/admin";
	}
}
