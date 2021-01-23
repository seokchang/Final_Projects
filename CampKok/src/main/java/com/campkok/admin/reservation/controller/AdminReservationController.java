package com.campkok.admin.reservation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.campkok.admin.reservation.model.service.AdminReservationService;
import com.campkok.admin.reservation.model.vo.AdminReservationPageData;
import com.campkok.admin.reservation.model.vo.Reservation;

@Controller
public class AdminReservationController {
	@Autowired
	private AdminReservationService service;

	@RequestMapping("/selectReservationInfo.do")
	public String selectReservationInfo(int resNo, Model model) {
		Reservation reservationInfo = service.selectReservationInfo(resNo);
		
		model.addAttribute("reservationInfo", reservationInfo);

		return "/admin/clientReservationView";
	}

	@RequestMapping("/selectReservationInfoList.do")
	public String selectReservationInfoList(int reqPage, int userNo, Model model) {
		AdminReservationPageData arpd = service.selectReservationInfoList(reqPage, userNo);

		model.addAttribute("list", arpd.getList());
		model.addAttribute("pageNavi", arpd.getPageNavi());

		return "/admin/clientReservationList";
	}
}
