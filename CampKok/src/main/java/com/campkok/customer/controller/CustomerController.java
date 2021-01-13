package com.campkok.customer.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.campkok.customer.model.service.CustomerService;
import com.campkok.customer.model.vo.BoardPageData;
import com.campkok.customer.model.vo.BoardVO;
import com.campkok.customer.model.vo.PointVO;
import com.campkok.customer.model.vo.ReservationVO;
import com.campkok.customer.model.vo.ReviewInfoPageData;
import com.campkok.customer.model.vo.UseInfoPageData;
import com.campkok.customer.model.vo.UserVO;
import com.campkok.hik.common.FileNameOverlap;

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
		if (result > 0) {
			model.addAttribute("msg", "수정 완료되었습니다.");
		} else {
			model.addAttribute("msg", "수정 실패하였습니다.");
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

	@RequestMapping("/allMemberChat.do")
	public String allMemberChat() {
		return "customer/allMemberChat";
	}

	
}
