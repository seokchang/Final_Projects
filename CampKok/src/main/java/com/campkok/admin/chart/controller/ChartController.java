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
		String genderRatio = getUserGenderRatio();
		String resMemberRatio = getReservationMemberRatio();
		String reviewScoreRatio = getReviewScoreRatio();

		model.addAttribute("genderRatio", genderRatio);
		model.addAttribute("resMemberRatio", resMemberRatio);
		model.addAttribute("reviewScoreRatio", reviewScoreRatio);

		return "/admin/chartView";
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
}
