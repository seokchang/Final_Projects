package com.campkok.camplist.controller;

import java.util.ArrayList;
import java.util.List;

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
	
	// 메인 페이지 로드할 때 캠핑장 광고, 새로운 캠핑장 리스트 
	@RequestMapping("/main.do")
	public String main(Model model) {
		// ArrayList<CampList> adCampList = service.mainAdCampList();	// main 캠핑장 광고 리스트
		ArrayList<CampList> newCampList = service.mainNewCampList();	// main 새로운 캠핑장 리스트
		ArrayList<CampList> campRanking = service.mainCampRanking();	// main 캠핑장 랭킹
		// model.addAttribute("adCampList",adCampList);
		model.addAttribute("newCampList",newCampList);
		model.addAttribute("campRanking",campRanking);
		return "main";
	}

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
		System.out.println("캠핑장 번호:"+campNo);
		CampList cl = service.selectOneCamp(campNo);
		model.addAttribute("cl",cl);
		return "user/campView";
	}
	
	// 캠핑장 검색
	@RequestMapping("/searchCampList.do")
	public String searchCampList(int reqPage, String searchSelect, String keyword, Model model) {
		CampListPageData clpd = service.searchCampList(reqPage, searchSelect, keyword);
		model.addAttribute("list",clpd.getList());
		model.addAttribute("pagiNavi",clpd.getPageNavi());
		return "user/campList";
	}
	
}
