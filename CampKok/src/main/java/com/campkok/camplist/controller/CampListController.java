package com.campkok.camplist.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.campkok.camplist.model.service.CampListService;
import com.campkok.camplist.model.vo.CampListPageData;

@Controller
public class CampListController {
	
	@Autowired
	private CampListService service;

	@RequestMapping("/campList.do")
	public String campList(int reqPage, Model model) {
		CampListPageData clpd = service.campList(reqPage);
		return "user/campList";
	}
}
