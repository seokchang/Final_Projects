package com.campkok.admin.chart.controller;

import java.util.HashMap;
import java.util.Set;

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

		model.addAttribute("genderRatio", genderRatio);

		return "/admin/chartView";
	}

	@RequestMapping("/getUserGenderRatio.do")
	public String getUserGenderRatio() {
		HashMap<String, Integer> userRatio = service.getUserGenderRatio();

		String result = "";
		Set<String> gender = userRatio.keySet();

		for (String key : gender) {
			if (result != "") {
				result += ", ";
			}
			result += "['" + key + "', " + userRatio.get(key) + "]";
		}

		return result;
	}
}
