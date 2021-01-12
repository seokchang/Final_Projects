package com.campkok.customer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.campkok.customer.model.service.UserService;
import com.campkok.customer.model.vo.UserVO;

@Controller
public class UserController {

	@Autowired
	private UserService service;

	@RequestMapping("/joinPage.do")
	public String join() {
		return "user/joinPage";
	}
	
	@RequestMapping("/joinFrm.do")
	public String joinFrm() {
		return "user/joinFrm";
	}
	
	@RequestMapping("/customerJoinfrm.do")
	public String customerJoin(UserVO u, Model model) {
		int result = service.insertUser(u);
		if(result>0) {
			model.addAttribute("msg","환영합니다.");
		}else {
			model.addAttribute("msg","회원가입에 실패하였습니다. 관리자에게 문의하세요.");
		}
		return "common/msg";
	}
	
	// 아이디 중복체크
	@ResponseBody
	@RequestMapping("/checkId.kh")
	public String checkId(UserVO u) {
		UserVO user = service.selectOneUser(u);
		if(user==null) {
			return "0";
		}else {
			return "1";
		}
	}
}
