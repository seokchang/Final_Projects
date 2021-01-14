package com.campkok.camplist.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.campkok.camplist.model.service.CampListService;
import com.campkok.camplist.model.vo.CampList;
import com.campkok.camplist.model.vo.CampListPageData;

@Controller
public class CampListController {
	
	@Autowired
	private CampListService service;

	// 캠핑장 리스트
	@RequestMapping("/campList.do")
	public String campList(int reqPage, Model model) {
		CampListPageData clpd = service.campList(reqPage);
		model.addAttribute("list",clpd.getList());
		model.addAttribute("pageNavi",clpd.getPageNavi());
		return "user/campList";
	}
	
	// 캠핑장 상세페이지
	@RequestMapping("/campView.do")
	public String selectOneCamp(int campNo, Model model) {
		CampList c = service.selectOneCamp(campNo);
		model.addAttribute("c",c);
		return "user/campView";
	}
}
