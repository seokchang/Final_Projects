package com.campkok.admin.visit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;

import com.campkok.admin.visit.model.service.VisitService;
import com.campkok.admin.visit.model.vo.Visit;

@Controller
public class VisitController {
	@Autowired
	private VisitService service;

	@Transactional
	public int insertVisitInfo(Visit visit) {
		return service.insertVisitInfo(visit);
	}
}