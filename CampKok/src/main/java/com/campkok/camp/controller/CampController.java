package com.campkok.camp.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.campkok.camp.model.service.CampService;
import com.campkok.camp.model.vo.CampRoomVO;
import com.campkok.camp.model.vo.CampVO;
import com.campkok.camp.model.vo.UserVO;

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
		
		//user_tbl���� ����Ʈ ��������
		int userNo = 2; //���������� �޾Ƽ� ��ü�ҿ���
		UserVO userInfo = service.selectUserPoint(userNo);
		//ķ����� ���� ��������
		int roomNo = 24; //�信�� �Ѱ��ٶ� roomNo=? �������� �޾ƿ� ����
		CampRoomVO campRoomInfo = service.selectRoomInfo(roomNo);
		//ķ���� ���� ��������
		int campNo = campRoomInfo.getCampNo();
		CampVO campInfo = service.selectCampInfo(campNo);
		model.addAttribute("campRoomInfo",campRoomInfo); //ķ���� ��
		model.addAttribute("campInfo",campInfo); //ķ����
		model.addAttribute("userInfo",userInfo);
		return "camp/campReservation2";
	}
	
	@RequestMapping("campRes.do")
	public String campRes(Integer userNo, Integer campNo, Integer campRoomNo, String resInDate, String resOutDate, Integer resMember, String resMemo, Integer resPrice,Integer userUsePoint, Model model) {				
		//user_tbl ����Ʈ ������Ʈ
		int result = service.userPointUpdate(userNo,userUsePoint);
		//����Ʈ ���̺� �μ�Ʈ
		int totalPoint = service.totalPoint(userNo); //��Ż����Ʈ ��������
		int result2 = service.pointUpdate(userNo,totalPoint,userUsePoint);
		//���� ���̺� �μ�Ʈ
		int resResult = service.campRes(userNo,campNo,campRoomNo,resInDate,resOutDate,resMember,resPrice,resMemo); //�����ѹ� ���������� ��������
		if(resResult >0) {
			model.addAttribute("msg","������ �Ϸ�Ǿ����ϴ�.");
		}else {
			model.addAttribute("msg","������ ������ �߻��߽��ϴ�. �ٽ� �������ּ���.");
			model.addAttribute("loc","/camp/campReservation");
		}
		model.addAttribute("loc","/");
		return "common/msg";
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
