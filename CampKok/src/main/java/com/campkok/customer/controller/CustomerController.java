package com.campkok.customer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.campkok.customer.model.service.CustomerService;

@Controller
public class CustomerController {

	@Autowired
	private CustomerService service;
	
	@RequestMapping("/mypage.do")
	public String mypage() {
		return "/customer/mypage";
	}
}
