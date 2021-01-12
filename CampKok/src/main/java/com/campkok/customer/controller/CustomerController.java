package com.campkok.customer.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.campkok.customer.model.service.CustomerService;
import com.campkok.customer.model.vo.PointVO;
import com.campkok.customer.model.vo.ReservationVO;
import com.campkok.customer.model.vo.ReviewInfoPageData;
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
	
	@RequestMapping("/reserveAll.do")
	public String reserveAll(int reqPage, int userNo, Model model) {
		UseInfoPageData uipd = service.reserveList(reqPage, userNo);
		model.addAttribute("list", uipd.getList());
		model.addAttribute("pageNavi", uipd.getPageNavi());
		return "customer/useInfo";
	}	
	
	@RequestMapping("/review.do")
	public String review(int reqPage, String userId, Model model) {
		ReviewInfoPageData ripd = service.reviewList(reqPage, userId);
		model.addAttribute("list", ripd.getList());
		model.addAttribute("pageNavi", ripd.getPageNavi());
		return "customer/reviewInfo";
	}
	
	@RequestMapping("/point.do")
	public String point(int userNo, Model model) {
		ArrayList<PointVO> list = service.pointList(userNo);
		model.addAttribute("list", list);
		return "customer/pointInfo";
	}
	
	@RequestMapping("/chat.do")
	public String chat(int userNo) {
		return "customer/chatPage";
	}
}
