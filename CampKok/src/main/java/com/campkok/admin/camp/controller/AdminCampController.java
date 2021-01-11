package com.campkok.admin.camp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.campkok.admin.camp.model.service.AdminCampService;
import com.campkok.admin.camp.model.vo.Camp;

@Controller
public class AdminCampController {
	@Autowired
	private AdminCampService service;
	
	@RequestMapping("")
	public String selectCampInfo(String ceoId, Model model) {
		Camp campInfo = service.selectCampInfo(ceoId);
		
		model.addAttribute("campInfo", campInfo);
		
		return "/admin/campInfoView";
	}
}
