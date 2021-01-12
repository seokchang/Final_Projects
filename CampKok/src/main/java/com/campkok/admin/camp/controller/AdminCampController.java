package com.campkok.admin.camp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.campkok.admin.camp.model.service.AdminCampService;
import com.campkok.admin.camp.model.vo.AdminCampInfoPageData;
import com.campkok.admin.camp.model.vo.Camp;

@Controller
public class AdminCampController {
	@Autowired
	private AdminCampService service;

	@RequestMapping("/selectCampInfo.do")
	public String selectCampInfo(int campNo, Model model) {
		Camp campInfo = service.selectCampInfo(campNo);

		model.addAttribute("campInfo", campInfo);

		return "/admin/campInfoView";
	}

	@RequestMapping("/selectCampInfoList.do")
	public String selectCampInfoList(int reqPage, Model model) {
		AdminCampInfoPageData acipd = service.selectCampInfoList(reqPage);

		model.addAttribute("list", acipd.getList());
		model.addAttribute("pageNavi", acipd.getPageNavi());

		return "/admin/campInfoList";
	}

	@RequestMapping("/searchCampInfoList.do")
	public String searchCampInfoList(int reqPage, String searchCategory, String search, Model model) {
		AdminCampInfoPageData acipd = service.searchCampInfoList(reqPage, searchCategory, search);

		model.addAttribute("list", acipd.getList());
		model.addAttribute("pageNavi", acipd.getPageNavi());

		return "/admin/campInfoList";
	}

}
