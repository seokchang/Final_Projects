package com.campkok.camp.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.campkok.camp.model.service.CampService;
import com.campkok.camp.model.vo.CampRoomVO;
import com.campkok.camp.model.vo.CampVO;

@Controller
@RequestMapping("/camp")
public class CampController {
	@Autowired
	private CampService service;
	
	/***********************************************
	 *                     기현 
	 ***********************************************/
	@RequestMapping("campReservation.do")
	public String campReservation(Model model) {
		//1. 예약된 정보 전부 가져오기
		//2. 해당페이지에 리스트로 뿌려주고
		//3. 달력에는 배열처리로 날짜별로 전체 예약정보 넣기(null인지 아닌지로? -> 캘린더jsp 다시 고민)
		//4. 개별 예약정보는 로그인세션으로 디비에서 최근값 정렬후 가져오는걸로 해야할듯?(이것도 jsp에서 다시 고민)
		int roomNo = 24;
		CampRoomVO campRoomInfo = service.selectRoomInfo(roomNo);
		int campNo = campRoomInfo.getCampNo();
		CampVO campInfo = service.selectCampInfo(campNo);
		model.addAttribute("campRoomInfo",campRoomInfo);
		model.addAttribute("campInfo",campInfo);
		return "camp/campReservation2";
	}
	
	
	
	/***********************************************
	 *                     진우 
	 ***********************************************/
	@RequestMapping("jinwoo.do")
	public String start() {
		return "camp/start";
	}
	
	@RequestMapping("/campBoard.do")
	public String campBoard(Model model) {
		return null;
	}
	@RequestMapping("/joinFrm.do")
	public String joinFrm() {
		return "camp/campjoin";
	}
	@RequestMapping("/campjoin.do")
	public String campjoin() {
		return "camp/campjoin2";
	}
	@RequestMapping("/campjoin2.do")
	public String campjoin2() {
		return "camp/campjoin3";
	}
	@RequestMapping("/campjoin3.do")
	public String campjoin3() {
		return "camp/campjoin4";
	}
}
