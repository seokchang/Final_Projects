package com.campkok.admin.chart.model.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campkok.admin.chart.model.dao.ChartDao;

@Service
public class ChartService {
	@Autowired
	private ChartDao dao;

	public String getUserGenderRatio() {
		int totalMan = dao.getNumberOfMan();
		int totalWoman = dao.getNumberOfWoman();
		String result = "";

		HashMap<String, Integer> genderRatio = new HashMap<String, Integer>();

		genderRatio.put("woman", totalWoman);
		genderRatio.put("man", totalMan);

		Set<String> keySet = genderRatio.keySet();

		for (String key : keySet) {
			if (result != "") {
				result += ", ";
			}
			result += "['" + key + "', " + genderRatio.get(key) + "]";
		}

		return result;
	}

	public String getReservationMemberRatio() {
		HashMap<Integer, Integer> resMemberRatio = new HashMap<Integer, Integer>();

		for (int i = 1; i < 7; i++) {
			int member = dao.getResMemberCount(i);

			resMemberRatio.put(i, member);
		}

		Set<Integer> keySet = resMemberRatio.keySet();
		ArrayList<Integer> list = new ArrayList<Integer>(keySet);
		Collections.sort(list);
		String result = "";

		for (int key : list) {
			if (result != "") {
				result += ", ";
			}

			result += (key < 6) ? "['" + key + "인', " + resMemberRatio.get(key) + "]"
					: "['" + key + "인 이상', " + resMemberRatio.get(key) + "]";
		}
		return result;
	}

	public String getReviewScoreRatio() {
		HashMap<Integer, Integer> reviewScore = new HashMap<Integer, Integer>();

		for (int i = 1; i < 6; i++) {
			int count = dao.getReviewScoreCount(i);

			reviewScore.put(i, count);
		}

		Set<Integer> keySet = reviewScore.keySet();
		ArrayList<Integer> list = new ArrayList<Integer>(keySet);
		Collections.sort(list);
		String result = "";

		for (int key : list) {
			if (result != "")
				result += ", ";
			result += "['" + key + "점', " + reviewScore.get(key) + "]";
		}
		return result;
	}
}
