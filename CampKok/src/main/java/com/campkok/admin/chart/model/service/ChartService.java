package com.campkok.admin.chart.model.service;

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
		int one = dao.getResMemberCount(1);
		int two = dao.getResMemberCount(2);
		int three = dao.getResMemberCount(3);
		int four = dao.getResMemberCount(4);
		int five = dao.getResMemberCount(5);
		int six = dao.getResMemberCount(6);
		String result = "";

		HashMap<String, Integer> resMemberRatio = new HashMap<String, Integer>();

		resMemberRatio.put("one", one);
		resMemberRatio.put("two", two);
		resMemberRatio.put("three", three);
		resMemberRatio.put("four", four);
		resMemberRatio.put("five", five);
		resMemberRatio.put("six", six);

		Set<String> keySet = resMemberRatio.keySet();

		for (String key : keySet) {
			if (result != "") {
				result += ", ";
			}
			result += "['" + key + "', " + resMemberRatio.get(key) + "]";
		}

		return result;
	}
}
