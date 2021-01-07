package com.campkok.camp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.campkok.camp.model.service.CampService;

@Controller
@RequestMapping("/camp")
public class CampController {
	@Autowired
	private CampService service;
	
	@RequestMapping("/kihyun.do")
	public String khpage() {
		return "camp/kh";
	}
	
	
}
