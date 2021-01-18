package com.campkok.admin.chart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.campkok.admin.chart.model.service.ChartService;

@Controller
public class ChartController {
	@Autowired
	private ChartService service;

	/* **************************************************
	 * Chart Page
	 * **************************************************
	*/
	@RequestMapping("/pageChart.do")
	public String pageChart(Model model) {
		String visitUserRatio = getVisitUserRatio();
		String genderRatio = getUserGenderRatio();
		String resMemberRatio = getReservationMemberRatio();
		String reviewScoreRatio = getReviewScoreRatio();
		String userInfoRatio = getUserInfoRatio();

		model.addAttribute("visitUserRatio", visitUserRatio);
		model.addAttribute("genderRatio", genderRatio);
		model.addAttribute("resMemberRatio", resMemberRatio);
		model.addAttribute("reviewScoreRatio", reviewScoreRatio);
		model.addAttribute("userInfoRatio", userInfoRatio);

		return "/admin/chartView";
	}

	public String getVisitUserRatio() {
		String visitUserRatio = service.getVisitUserRatio();

		return visitUserRatio;
	}

	public String getUserGenderRatio() {
		String userRatio = service.getUserGenderRatio();

		return userRatio;
	}

	public String getReservationMemberRatio() {
		String resMemberRatio = service.getReservationMemberRatio();

		return resMemberRatio;
	}

	public String getReviewScoreRatio() {
		String reviewScoreRatio = service.getReviewScoreRatio();

		return reviewScoreRatio;
	}

	public String getUserInfoRatio() {
		String userInfoRatio = service.getUserInfoRatio();

		return userInfoRatio;
	}
}
