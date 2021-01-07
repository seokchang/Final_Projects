package com.campkok.customer.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.campkok.customer.model.service.CustomerService;
import com.campkok.customer.model.vo.ReservationVO;
import com.campkok.customer.model.vo.UseInfoPageData;
import com.campkok.customer.model.vo.UserVO;

@Controller
public class CustomerController {

	@Autowired
	private CustomerService service;
	
	@RequestMapping("/mypage.do")
	public String mypage(int userNo, Model model) {
		UserVO u = service.selectOneCustomer(userNo);
		model.addAttribute("u", u);
		return "customer/mypage";
	}
	
	@RequestMapping("/update.do")
	public String update(UserVO u, Model model) {
		int result = service.updateCustomer(u);
		if(result>0) {
			model.addAttribute("msg", "정상적으로 수정되었습니다.");
		}else {
			model.addAttribute("msg", "수정에 실패하셨습니다.");
		}
		model.addAttribute("loc", "/");
		return "common/msg";
	}
	
	@RequestMapping("/reserve.do")
	public String resurve(int userNo, Model model) {
		ReservationVO r = service.selectOneReserve(userNo);
		model.addAttribute("r", r);
		return "customer/reserveInfo";
	}
	
//	@RequestMapping("/reserveAll.do")
//	public String reserveAll(int userNo, Model model) {
//		ArrayList<ReservationVO> list = service.selectAllReserve(userNo);
//		model.addAttribute("list", list);
//		return "customer/useInfo";
//	}
	
	@RequestMapping("/reserveAll.do")
	public String reserveAll(int reqPage, Model model) {
		UseInfoPageData uipd = service.reserveList(reqPage);
		model.addAttribute("list", uipd.getList());
		model.addAttribute("pageNavi", uipd.getPageNavi());
		return "customer/useInfo";
	}	
}
