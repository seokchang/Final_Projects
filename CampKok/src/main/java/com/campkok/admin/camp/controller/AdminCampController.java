package com.campkok.admin.camp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.campkok.admin.camp.model.service.AdminCampService;
import com.campkok.admin.camp.model.vo.AdminCampInfoPageData;

@Controller
public class AdminCampController {
	@Autowired
	private AdminCampService service;
	
	@RequestMapping("/selectCampInfoList.do")
	public String selectCampInfoList(int reqPage, Model model) {
		AdminCampInfoPageData acipd = service.selectCampInfoList(reqPage);
		
		model.addAttribute("list", acipd.getList());
		model.addAttribute("pageNavi", acipd.getPageNavi());
		
		return "/admin/campInfoList";
	}

}
