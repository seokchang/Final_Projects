package com.campkok.customer.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.campkok.admin.user.model.vo.User;
import com.campkok.customer.model.service.UserService;
import com.campkok.customer.model.vo.UserVO;

@Controller
public class UserController {

	@Autowired
	private UserService service;
	
	// 회원가입 선택 페이지로 이동
	@RequestMapping("/joinPage.do")
	public String join() {
		return "user/joinPage";
	}
	
	// 회원가입 페이지로 이동
	@RequestMapping("/joinFrm.do")
	public String joinFrm() {
		return "user/joinFrm";
	}
	
	// 회원가입
	@RequestMapping("/this.do")
	public void thisis() {
		System.out.println("왔다.");
	}
	
	/* 이유는 모르겠는데 dao를 한번 더 다녀와서 ORA-01400: cannot insert NULL into ("CAMPKOK"."USER_TBL"."USER_ID") 오류 뜸... 내일 진실의방 다녀올 예정
	 * 와중에 DB는 예쁘게 들어가서 더 환장할 노릇
	 * 문정이가 고쳐줘서 진실의방 안가도 댐...ㅠㅠㅠㅠㅠㅠ */
	@RequestMapping("/customerJoin.do")
	public String customerJoin(UserVO u, Model model) {
		int result = service.insertUser(u);
		if(result>0) {
			model.addAttribute("msg","환영합니다.");
			model.addAttribute("loc","/");	// 이거 빼먹음 빡대갈...
		}else {
			model.addAttribute("msg","회원가입에 실패하였습니다. 관리자에게 문의하세요.");
			model.addAttribute("loc","/");	// 이걸 어떻게 빼먹을수 있어 ㅠ
		}
		return "common/msg";
	}
	
	// 아이디 중복체크
	@ResponseBody
	@RequestMapping("/checkId.do")
	public String checkId(UserVO u) {
		UserVO user = service.selectOneUser(u);
		if(user==null) {
			return "0";
		}else {
			return "1";
		}
	}
	
	// 로그인 페이지로 이동
		@RequestMapping("/loginFrm.do")
		public String loginFrm() {
			return "user/loginFrm";
		}
	
	// 로그인
	@RequestMapping("/login.do")
	public String login(UserVO u, HttpSession session, Model model) {
		System.out.println(u.getUserId());
		System.out.println(u.getUserPw());
		UserVO user = service.selectOneUser(u);
		if(user != null) {
			session.setAttribute("user", user);
			model.addAttribute("msg", "로그인 성공.");
		}else {
			model.addAttribute("msg", "아이디 또는 비밀번호를 확인해주세요.");
		}
		model.addAttribute("loc", "/");
		return "common/msg";
	}
	
	// 로그아웃 
	@RequestMapping("/logout.do")
	public String logout(HttpSession session, Model model, @SessionAttribute(required=false) UserVO user) {	
		if(user != null) {
			session.invalidate();
			model.addAttribute("msg", "로그아웃 되었습니다.");			
		}else {
			model.addAttribute("msg", "로그인되어있지 않습니다.");
		}
		model.addAttribute("loc", "/");
		return "common/msg";
	}
}
