package com.campkok.camplist.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.campkok.camp.model.vo.ReviewVO;
import com.campkok.camp.notice.model.vo.CampNoticeVO;
import com.campkok.camplist.model.service.CampListService;
import com.campkok.camplist.model.vo.CampList;
import com.campkok.camplist.model.vo.CampListPageData;
import com.campkok.camplist.model.vo.CampRoomList;

@Controller
public class CampListController {
	
	@Autowired
	private CampListService service;
	
	// 메인페이지 로드할 때 캠핑장 광고, 새로운 캠핑장, 캠핑장 랭킹
	@RequestMapping("/main.do")
	public String main(Model model) {
		// ArrayList<CampList> adCampList = service.mainAdCampList();	// main 캠핑장 광고
		ArrayList<CampList> newCampList = service.mainNewCampList();	// main 새로운 캠핑장
		ArrayList<CampList> campRanking = service.mainCampRanking();	// main 예약순 캠핑장 랭킹
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
	
	// 캠핑장 상세 페이지
	@RequestMapping("/campView.do")
	public String selectOneCamp(int campNo, Model model) {
		CampList cl = service.selectOneCamp(campNo);
		ArrayList<CampRoomList> roomList = service.campRoomList(campNo);
		ArrayList<CampNoticeVO> cnList = service.selectCampNoticeList(campNo);
		ArrayList<ReviewVO> crList = service.selectCampReviewList(campNo);
		model.addAttribute("cl",cl);
		model.addAttribute("cnList", cnList);
		model.addAttribute("crList", crList);
		model.addAttribute("campRoomList",roomList);
		model.addAttribute("campNo",campNo);
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
