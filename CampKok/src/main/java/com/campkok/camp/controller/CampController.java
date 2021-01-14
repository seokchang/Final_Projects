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
	 *                     ���� 
	 ***********************************************/
	@RequestMapping("campReservation.do")
	public String campReservation(Model model) {
		//1. ����� ���� ���� ��������
		//2. �ش��������� ����Ʈ�� �ѷ��ְ�
		//3. �޷¿��� �迭ó���� ��¥���� ��ü �������� �ֱ�(null���� �ƴ�����? -> Ķ����jsp �ٽ� ���)
		//4. ���� ���������� �α��μ������� ��񿡼� �ֱٰ� ������ �������°ɷ� �ؾ��ҵ�?(�̰͵� jsp���� �ٽ� ���)
		int roomNo = 24;
		CampRoomVO campRoomInfo = service.selectRoomInfo(roomNo);
		int campNo = campRoomInfo.getCampNo();
		CampVO campInfo = service.selectCampInfo(campNo);
		model.addAttribute("campRoomInfo",campRoomInfo);
		model.addAttribute("campInfo",campInfo);
		return "camp/campReservation2";
	}
	
	
	
	/***********************************************
	 *                     ���� 
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
