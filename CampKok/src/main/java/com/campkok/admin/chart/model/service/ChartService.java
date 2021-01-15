package com.campkok.admin.chart.model.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campkok.admin.chart.model.dao.ChartDao;

@Service
public class ChartService {
	@Autowired
	private ChartDao dao;

	public HashMap<String, Integer> getUserGenderRatio() {
		int totalMan = dao.getNumberOfMan();
		int totalWoman = dao.getNumberOfWoman();

		HashMap<String, Integer> map = new HashMap<String, Integer>();

		map.put("woman", totalWoman);
		map.put("man", totalMan);

		return map;
	}
}
