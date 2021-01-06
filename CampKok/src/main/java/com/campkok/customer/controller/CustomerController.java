package com.campkok.customer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.campkok.customer.model.service.CustomerService;
import com.campkok.customer.model.vo.UserVO;

@Controller
public class CustomerController {

	@Autowired
	private CustomerService service;
	
	@RequestMapping("/mypage.do")
	public String mypage(int userNo, Model model) {
		UserVO u = service.selectOneCustomer(userNo);
		System.out.println(userNo);
		if(u!=null) {
			System.out.println("u¿÷¿Ω");
		}else {
			System.out.println("uø≤¿Ω");
		}
		model.addAttribute("u", u);
		return "customer/mypage";
	}
	
}
